local north = {direction = defines.direction.north, position = {0, 0}}
local south = {direction = defines.direction.south, position = {0, 0}}
local west = {direction = defines.direction.west, position = {0, 0}}
local east = {direction = defines.direction.east, position = {0, 0}}

local direction_table = {
  N = {north},
  S = {south},
  E = {east},
  W = {west},
  EW = {east, west},
  NW = {north, west},
  NE = {north, east},
  NEW = {north, east, west},
  SW = {south, west},
  SE = {south, east},
  SEW = {south, east, west},
  NS = {north, south},
  NSW = {north, south, west},
  NSE = {north, south, east},
  NSEW = {north, south, east, west},
}

local base_ug_distance = data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance

local function build_connections_table(directions, level)
  local connections = {
    util.table.deepcopy(north),
  }
  local max_distance = (base_ug_distance + 1) * level

  for _, connection in ipairs(direction_table[directions]) do
    connections[#connections + 1] = {
      connection_type = "underground",
      direction = connection.direction,
      position = connection.position,
      max_underground_distance = max_distance,
      underground_collision_mask = underground_collision_mask,
    }
  end

  return connections
end

local names_table = {
  ["one-to-one"] = {
    {
      icon = "one-to-one",
      mine_and_place = "-forward",
      variants = {
        ["-forward-"] = "S",
        ["-left-"] = "E",
        ["-reverse-"] = "N",
        ["-right-"] = "W",
      },
    },
  },
  ["one-to-two"] = {
    {
      icon = "one-to-two-parallel",
      mine_and_place = "-perpendicular",
      variants = {
        ["-perpendicular-"] = "EW",
        ["-parallel-"] = "NS",
        ["-perpendicular-secondary-"] = "EW",
        ["-parallel-secondary-"] = "NS",
        ["-L-FL-"] = "SE",
        ["-L-FR-"] = "SW",
        ["-L-RR-"] = "NW",
        ["-L-RL-"] = "NE",
      },
    },
  },
  ["one-to-three"] = {
    {
      icon = "one-to-three",
      mine_and_place = "-forward",
      variants = {
        ["-forward-"] = "SEW",
        ["-left-"] = "NSE",
        ["-reverse-"] = "NEW",
        ["-right-"] = "NSW",
      },
    },
  },
  ["one-to-four"] = {
    {
      icon = "one-to-four",
      mine_and_place = "",
      variants = {
        ["-"] = "NSEW",
      },
    },
  },
}

-- Descending order makes next_upgrade deterministic: tier 1 -> tier 2 -> tier 3.
local levels = {3, 2, 1}
local file_path = "__underground-pipe-pack__/graphics/entity/level-"

local function build_picture_table(pipe_type, variant, level)
  if variant == "-perpendicular-secondary-" then
    variant = "-perpendicular-"
  elseif variant == "-parallel-secondary-" then
    variant = "-parallel-"
  end

  return {
    north = {
      filename = file_path .. level .. "/hr-" .. pipe_type .. variant .. "pipe-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    south = {
      filename = file_path .. level .. "/hr-" .. pipe_type .. variant .. "pipe-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    west = {
      filename = file_path .. level .. "/hr-" .. pipe_type .. variant .. "pipe-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    east = {
      filename = file_path .. level .. "/hr-" .. pipe_type .. variant .. "pipe-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
  }
end

local pipes = {}

for pipe_type, sets in pairs(names_table) do
  for _, definition in ipairs(sets) do
    for variant, directions in pairs(definition.variants) do
      local next_upgrade = nil

      for _, level in ipairs(levels) do
        local current_pipe = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
        local item_name

        if level == 1 then
          current_pipe.name = pipe_type .. variant .. "pipe"
          item_name = pipe_type .. definition.mine_and_place .. "-pipe"
        else
          current_pipe.name = pipe_type .. variant .. "t" .. level .. "-pipe"
          item_name = pipe_type .. definition.mine_and_place .. "-t" .. level .. "-pipe"
        end

        current_pipe.minable.result = item_name
        current_pipe.placeable_by = {item = item_name, count = 1}
        current_pipe.icon = "__underground-pipe-pack__/graphics/icons/" .. definition.icon .. "-t" .. level .. ".png"
        current_pipe.icon_size = 32
        current_pipe.collision_mask = afh_normal_mask
        current_pipe.npt_compat = {mod = "afh", tier = level}

        local fluid_box = util.table.deepcopy(current_pipe.fluid_box)
        fluid_box.pipe_covers = _G.tierpipecoverspictures(tostring(level))
        fluid_box.pipe_connections = build_connections_table(directions, level)
        current_pipe.fluid_box = fluid_box
        current_pipe.fast_replaceable_group = "pipe-to-ground"

        if next_upgrade then
          current_pipe.next_upgrade = next_upgrade
        else
          current_pipe.next_upgrade = nil
        end
        next_upgrade = current_pipe.name

        current_pipe.pictures = build_picture_table(pipe_type, variant, level)
        pipes[#pipes + 1] = current_pipe
      end
    end
  end
end

data:extend(pipes)
