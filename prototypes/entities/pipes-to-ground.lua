local north = {direction=defines.direction.north, position = {0, 0}}
local south = {direction=defines.direction.south, position = {0, .0}}
local west = {direction=defines.direction.west, position = {0, 0}}
local east = {direction=defines.direction.east, position = {0, 0}}

local direction_table = {
  ['N'] = {north},
  ['S'] = {south},
  ['E'] = {east},
  ['W'] = {west},
  ['EW'] = {east, west},
  ['NW'] = {north, west},
  ['NE'] = {north, east},
  ['NEW'] = {north, east, west},
  ['SW'] = {south, west},
  ['SE'] = {south, east},
  ['SEW'] = {south, east, west},
  ['NS'] = {north, south},
  ['NSW'] = {north, south, west},
  ['NSE'] = {north, south, east},
  ['NSEW'] = {north, south, east, west}
}
local base_ug_distance = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance)
local function build_connections_table(directions, level)
  local connections_table = {
    north,
  }
  local max_distance
  for _, datas in pairs(direction_table[directions]) do
    if level == 4 then
      max_distance = 16
    else
      max_distance = (base_ug_distance + 1) * level
    end
    connections_table[#connections_table + 1] = {
      connection_type = "underground",
      underground_collision_mask = underground_collision_mask,
      position = datas.position,
      direction = datas.direction,
      max_underground_distance = max_distance,
    }
  end
  return connections_table
end

local namesTable = {
  ["one-to-one"] = {
    {
      icon = "one-to-one",
      mine_and_place = "-forward",
      variant = {
      ["-forward-"] = "S",
      ["-left-"] = "E",
      ["-reverse-"] = "N",
      ["-right-"] = "W"
      }
    }
  },
  ["one-to-two"] = {
    {
      icon = "one-to-two-parallel",
      mine_and_place = "-perpendicular",
      variant = {
      ["-perpendicular-"] = "EW",
      ["-parallel-"] = "NS",
      ["-perpendicular-secondary-"] = "EW",
      ["-parallel-secondary-"] = "NS",
      ["-L-FL-"] = "SE",
      ["-L-FR-"] = "SW",
      ["-L-RR-"] = "NW",
      ["-L-RL-"] = "NE"
      }
    },
    --[[{
      icon = "one-to-two-L",
      mine_and_place = "-L-FL",
      variant = {
        ["-L-FL-"] = "SE",
        ["-L-FR-"] = "SW",
        ["-L-RR-"] = "NW",
        ["-L-RL-"] = "NE"
      }
    }]]--
  },
  ["one-to-three"] = {
    {
      icon = "one-to-three",
      mine_and_place = "-forward",
      variant = {
      ["-forward-"] = "SEW",
      ["-left-"] = "NSE",
      ["-reverse-"] = "NEW",
      ["-right-"] = "NSW"
      }
    }
  },
  ["one-to-four"] = {
    {
      icon = "one-to-four",
      mine_and_place = "",
      variant = {
        ["-"] = "NSEW"
      }
    }
  }
}

local levelsTable = {
  ["3"] = 3,
  ["2"] = 2,
  ["1"] = 1,
}

local file_path = "__underground-pipe-pack__/graphics/entity/level-"
local function build_picture_table(type, variant, level)
  if variant == "-perpendicular-secondary-" then
    variant = "-perpendicular-"
  elseif variant == "-parallel-secondary-" then
    variant = "-parallel-"
  end
  return {
    north = {
      filename = file_path .. level .. "/hr-" .. type .. variant .. "pipe-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    south = {
      filename = file_path .. level .. "/hr-" .. type .. variant .. "pipe-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    west = {
      filename = file_path .. level .. "/hr-" .. type .. variant .. "pipe-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    east = {
      filename = file_path .. level .. "/hr-" .. type .. variant .. "pipe-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    }
  }
end


local pipes ={}
for types, sets in pairs(namesTable) do
  for _ , datas in pairs(sets) do
    for variants, directions in pairs(datas.variant) do
      local next_upgrade = nil
      for levelsS , levelsN in pairs(levelsTable) do
        local currentPipe = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
        if levelsS == "1" then
          currentPipe.name = types .. variants ..  "pipe"
          currentPipe.minable.result = types .. datas.mine_and_place .. "-pipe"
          currentPipe.placeable_by = {item = types .. datas.mine_and_place .. "-pipe", count = 1}
        else
          currentPipe.name = types .. variants .. "t" .. levelsS .. "-pipe"
          currentPipe.minable.result = types .. datas.mine_and_place .. "-t" .. levelsS .. "-pipe"
          currentPipe.placeable_by = {item = types .. datas.mine_and_place .. "-t" .. levelsS .. "-pipe", count = 1}
        end

        currentPipe.icon = "__underground-pipe-pack__/graphics/icons/" .. datas.icon .. "-t" .. levelsS .. ".png"

        currentPipe.icon_size = 32
        currentPipe.collision_mask = afh_normal_mask
        currentPipe.npt_compat = {mod = "afh", tier = levelsS}

        local fluidBox = util.table.deepcopy(currentPipe.fluid_box)
        fluidBox.pipe_covers = _G.tierpipecoverspictures(levelsS)
        fluidBox.pipe_connections = build_connections_table(directions, levelsN)
        currentPipe.fluid_box = fluidBox
        currentPipe.fast_replaceable_group = "pipe-to-ground"
        if next_upgrade then
          currentPipe.next_upgrade = next_upgrade
        end
        next_upgrade = currentPipe.name

        currentPipe.pictures = build_picture_table(types, variants, levelsS)
        pipes[#pipes + 1] = currentPipe
      end
    end
  end
end
data:extend(pipes)