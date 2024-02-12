local pipeData = require("prototypes.pipe-definitions")

local north = {position = {0, -1}}
local south = {position = {0, 1}}
local west = {position = {-1, 0}}
local east = {position = {1, 0}}

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

local base_ug_distance = 10
local function build_connections_table(directions, level)
  local connections_table = {
    { position = {0, -1} },
  }
  local max_distance
  for _, datas in pairs(direction_table[directions]) do
    if level == 4 then
      max_distance = 16
    else
      max_distance = (base_ug_distance + 1) * level
    end
    connections_table[#connections_table + 1] = {
      position = datas.position,
      max_underground_distance = max_distance
    }
  end
  return connections_table
end

local file_path = "__underground-pipe-pack__/graphics/entity/level-"
local function build_picture_table(type, variant, level)
  if variant == "-perpendicular-secondary-" then
    variant = "-perpendicular-"
  elseif variant == "-parallel-secondary-" then
    variant = "-parallel-"
  end
  return {
    up = {
      filename = file_path .. level .. "/" .. type .. variant .. "pipe-up.png",
      priority = "high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = file_path .. level .. "/hr-" .. type .. variant .. "pipe-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    down = {
      filename = file_path .. level .. "/" .. type .. variant .. "pipe-down.png",
      priority = "high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = file_path .. level .. "/hr-" .. type .. variant .. "pipe-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    left = {
      filename = file_path .. level .. "/" .. type .. variant .. "pipe-left.png",
      priority = "high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = file_path .. level .. "/hr-" .. type .. variant .. "pipe-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    right = {
      filename = file_path .. level .. "/" .. type .. variant .. "pipe-right.png",
      priority = "high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = file_path .. level .. "/hr-" .. type .. variant .. "pipe-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    }
  }
end


local pipes ={}
for types, sets in pairs(pipeData.pipeNames) do
  for _ , datas in pairs(sets) do
    for variants, directions in pairs(datas.variant) do
      for levelsS , levelsN in pairs(pipeData.levels) do
        local currentPipe = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
        if levelsS == "1" then
          currentPipe.name = types .. variants ..  "pipe"
          currentPipe.minable.result = types .. datas.mine_and_place .. "-pipe"
          currentPipe.placeable_by = {item = types .. datas.mine_and_place .. "-pipe", count = 1}
        elseif levelsS == "space" then
          currentPipe.name = types .. variants ..  "space-pipe"
          currentPipe.minable.result = types .. datas.mine_and_place .. "-space-pipe"
          currentPipe.placeable_by = {item = types .. datas.mine_and_place .. "-space-pipe", count = 1}
        else
          currentPipe.name = types .. variants .. "t" .. levelsS .. "-pipe"
          currentPipe.minable.result = types .. datas.mine_and_place .. "-t" .. levelsS .. "-pipe"
          currentPipe.placeable_by = {item = types .. datas.mine_and_place .. "-t" .. levelsS .. "-pipe", count = 1}
        end

        if levelsS == "space" then
          currentPipe.icon = "__underground-pipe-pack__/graphics/icons/space-exploration-compat/" .. datas.icon .. ".png"
          currentPipe.se_allow_in_space = true
        else
          currentPipe.icon = "__underground-pipe-pack__/graphics/icons/" .. datas.icon .. "-t" .. levelsS .. ".png"
          currentPipe.se_allow_in_space = false
        end

        currentPipe.icon_size = 32
        local fluidBox = util.table.deepcopy(currentPipe.fluid_box)
        fluidBox.pipe_covers = _G.tierpipecoverspictures(levelsS)
        fluidBox.pipe_connections = build_connections_table(directions, levelsN)
        currentPipe.fluid_box = fluidBox
        currentPipe.fast_replaceable_group = "pipe-to-ground"
        currentPipe.pictures = build_picture_table(types, variants, levelsS)
        pipes[#pipes + 1] = currentPipe
      end
    end
  end
end
data:extend(pipes)


if mods["boblogistics"] and settings.startup["bobmods-logistics-highpipes"] and settings.startup["bobmods-logistics-highpipes"].value == true then
  bobmods.logistics.set_pipe_height("one-to-one-left-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-one-forward-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-one-reverse-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-one-right-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-two-perpendicular-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-two-perpendicular-secondary-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-two-parallel-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-two-parallel-secondary-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-two-L-FL-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-two-L-FR-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-two-L-RR-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-two-L-RL-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-three-left-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-three-forward-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-three-reverse-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-three-right-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("one-to-four-t2-pipe", 2)


  bobmods.logistics.set_pipe_height("one-to-one-left-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-one-forward-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-one-reverse-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-one-right-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-two-perpendicular-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-two-perpendicular-secondary-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-two-parallel-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-two-parallel-secondary-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-two-L-FL-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-two-L-FR-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-two-L-RR-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-two-L-RL-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-three-left-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-three-forward-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-three-reverse-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-three-right-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("one-to-four-t3-pipe", 4)
end
