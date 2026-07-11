local north = {direction = defines.direction.north, position = {0, 0}}
local south = {direction = defines.direction.south, position = {0, 0}}
local west = {direction = defines.direction.west, position = {0, 0}}
local east = {direction = defines.direction.east, position = {0, 0}}

local direction_table = {
  NS = {north, south},
  ES = {east, south},
  ESW = {east, south, west},
  NSEW = {north, south, east, west},
}

local base_ug_distance = data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance

local function build_connections_table(directions, level)
  local connections = {}
  local max_distance = (base_ug_distance + 1) * level

  for _, connection in ipairs(direction_table[directions]) do
    connections[#connections + 1] = {
      connection_type = "underground",
      direction = connection.direction,
      position = connection.position,
      max_underground_distance = max_distance,
      underground_collision_mask = underground_collision_mask,
      hide_connection_info = true,
    }
  end

  return connections
end

local names_table = {
  ["underground-i"] = {
    directions = "NS",
    picture_variants = {
      north = "NS",
      east = "EW",
      south = "NS",
      west = "EW",
    },
  },
  ["underground-L"] = {
    directions = "ES",
    picture_variants = {
      north = "ES",
      south = "NW",
      east = "SW",
      west = "NE",
    },
  },
  ["underground-t"] = {
    directions = "ESW",
    picture_variants = {
      north = "ESW",
      east = "NSW",
      south = "NEW",
      west = "NES",
    },
  },
  ["underground-cross"] = {
    directions = "NSEW",
    picture_variants = {
      north = "NESW",
      south = "NESW",
      west = "NESW",
      east = "NESW",
    },
  },
}

-- Descending order makes next_upgrade deterministic: tier 1 -> tier 2 -> tier 3.
local levels = {
  {number = 3, colour = {r = 38, g = 173, b = 227, a = 0.5}},
  {number = 2, colour = {r = 227, g = 38, b = 45, a = 0.5}},
  {number = 1, colour = {r = 255, g = 191, b = 0, a = 0.5}},
}

local file_path = "__underground-pipe-pack__/graphics/entity/underground-cap/"
local arrow_file_path = "__underground-pipe-pack__/graphics/entity/arrows/"

local function build_picture_table(variants, colour)
  local pictures = {}

  for direction, variant in pairs(variants) do
    pictures[direction] = {
      layers = {
        {
          filename = file_path .. "hr-ug-" .. variant .. ".png",
          priority = "extra-high",
          width = 96,
          height = 96,
          shift = {0, 0.1875},
          scale = 0.5,
        },
        {
          filename = arrow_file_path .. "hr-ug-arrow-" .. variant .. ".png",
          priority = "extra-high",
          width = 96,
          height = 96,
          shift = {0, 0.1875},
          apply_runtime_tint = true,
          tint = colour,
          scale = 0.5,
        },
        {
          filename = file_path .. "hr-underground-metal-mask.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          shift = {0, 0.1875},
          apply_runtime_tint = true,
          tint = colour,
          scale = 0.5,
        },
        {
          filename = "__underground-pipe-pack__/graphics/entity/shadows/hr-minipump-shadow.png",
          priority = "high",
          width = 96,
          height = 96,
          shift = {0, 0.1875},
          draw_as_shadow = true,
          scale = 0.5,
        },
      },
    }
  end

  return pictures
end

local pipes = {}

for name, properties in pairs(names_table) do
  local next_upgrade = nil

  for _, level in ipairs(levels) do
    local number = level.number
    local current_pipe = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])

    if number == 1 then
      current_pipe.name = name .. "-pipe"
      current_pipe.minable.result = name .. "-pipe"
    else
      current_pipe.name = name .. "-t" .. number .. "-pipe"
      current_pipe.minable.result = name .. "-t" .. number .. "-pipe"
    end

    current_pipe.collision_mask = afh_walkable_mask
    current_pipe.icon = "__underground-pipe-pack__/graphics/icons/" .. name .. "-t" .. number .. ".png"
    current_pipe.icon_size = 32
    current_pipe.selection_priority = 51
    current_pipe.npt_compat = {mod = "afh", tier = number}

    local fluid_box = util.table.deepcopy(current_pipe.fluid_box)
    fluid_box.pipe_connections = build_connections_table(properties.directions, number)
    fluid_box.pipe_covers = nil
    current_pipe.fluid_box = fluid_box
    current_pipe.fast_replaceable_group = "pipe-to-ground"

    if next_upgrade then
      current_pipe.next_upgrade = next_upgrade
    else
      current_pipe.next_upgrade = nil
    end
    next_upgrade = current_pipe.name

    current_pipe.pictures = build_picture_table(properties.picture_variants, level.colour)
    current_pipe.draw_fluid_icon_override = true
    pipes[#pipes + 1] = current_pipe
  end
end

data:extend(pipes)
