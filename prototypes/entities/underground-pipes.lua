local pipeData = require("prototypes.pipe-definitions")

local Color = require('__stdlib__/stdlib/utils/color')

local north = {position = {0, -1}}
local south = {position = {0, 1}}
local west = {position = {-1, 0}}
local east = {position = {1, 0}}

local direction_table = {
    ['NS'] = {north, south},
    ['ES'] = {east, south},
    ['ESW'] = {east, south, west},
    ['NSEW'] = {north, south, east, west}
}
local base_ug_distance = 10
local function build_connections_table(directions, level)
  local connections_table = {}
  local max_distance
  for _, datas in pairs(direction_table[directions]) do
    if level == "space" then
      max_distance = base_ug_distance
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

local colors_table = {
    [1] = Color.from_rgb(255,191,0,255/2),
    [2] = Color.from_rgb(227,38,45,255/2),
    [3] = Color.from_rgb(38,173,227,255/2),
    --[4] = Color.from_rgb(75,0,130,255),
    --[5] = Color.from_rgb(5,73,53,255)
}

if mods["space-exploration"] then
    colors_table["space"] = Color.from_rgb(255,255,255,255/2)
end

local file_path = "__underground-pipe-pack__/graphics/entity/underground-cap/"
local a_file_path = "__underground-pipe-pack__/graphics/entity/arrows/"

local function build_picture_table(variants, color)
    local picture_table = {}
    for direction, variant in pairs(variants) do
        picture_table[direction] =
        {
            layers = {
                {
                    filename = file_path .. "underground-metal.png",
                    priority = "high",
                    width = 48,
                    height = 48,
                    shift = {0,0.1875},
                    hr_version =
                    {
                        filename = file_path .. "hr-ug-" .. variant .. ".png",
                        priority = "extra-high",
                        width = 96,
                        height = 96,
                        shift = {0,0.1875},
                        scale = 0.5
                    }
                },
                {
                    filename = a_file_path .. "hr-ug-arrow-" .. variant .. ".png",
                    priority = "high",
                    width = 96,
                    height = 96,
                    shift = {0,0.1875},
                    scale = 0.5,
                    apply_runtime_tint = true,
                    tint = color,
                    hr_version =
                    {
                        filename = a_file_path .. "hr-ug-arrow-" .. variant .. ".png",
                        priority = "extra-high",
                        width = 96,
                        height = 96,
                        shift = {0,0.1875},
                        apply_runtime_tint = true,
                        tint = color,
                        scale = 0.5
                    }
                },
                {
                    filename = file_path .. "hr-underground-metal-mask.png",
                    priority = "high",
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    shift = {0,0.1875},
                    apply_runtime_tint = true,
                    tint = color,
                    hr_version =
                    {
                        filename = file_path .. "hr-underground-metal-mask.png",
                        priority = "extra-high",
                        width = 96,
                        height = 96,
                        scale = 0.5,
                        apply_runtime_tint = true,
                        tint = color,
                        shift = {0,0.1875},
                    }
                },
                {
                    filename = "__underground-pipe-pack__/graphics/entity/shadows/lr-minipump-shadow.png",
                    priority = "high",
                    width = 48,
                    height = 48,
                    shift = {0,0.1875},
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__underground-pipe-pack__/graphics/entity/shadows/hr-minipump-shadow.png",
                        priority = "high",
                        width = 96,
                        height = 96,
                        scale = 0.5,
                        shift = {0,0.1875},
                        draw_as_shadow = true,
                    }
                }
            }
        }
    end
    return picture_table
end

local pipes = {}
for name, properties in pairs(pipeData.undergroundNames) do
    for levelsS, levelsN in pairs(pipeData.levels) do
        local current_pipe = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
        if levelsS == "1" then
            current_pipe.name = name .. "-pipe"
            current_pipe.minable.result = name .. "-pipe"
        elseif levelsS == "space" then
            current_pipe.name = name .. "-space-pipe"
            current_pipe.minable.result = name .. "-space-pipe"
        else
            current_pipe.name = name .. "-t" .. levelsS .. "-pipe"
            current_pipe.minable.result = name .. "-t" .. levelsS .. "-pipe"
        end

        if levelsS == "space" then
            current_pipe.collision_mask = afh_space_only
            current_pipe.icon = "__underground-pipe-pack__/graphics/icons/space-exploration-compat/" .. name .. ".png"
            current_pipe.se_allow_in_space = true
        else
            current_pipe.collision_mask = afh_ground_only
            current_pipe.icon = "__underground-pipe-pack__/graphics/icons/" .. name .. "-t" .. levelsS .. ".png"
            current_pipe.se_allow_in_space = false
        end

        current_pipe.icon_size = 32
        current_pipe.selection_priority = 51

        local fluid_box = util.table.deepcopy(current_pipe.fluid_box)
        fluid_box.pipe_connections = build_connections_table(properties.directions, levelsS)
        fluid_box.pipe_covers = nil
        current_pipe.fluid_box = fluid_box

        current_pipe.fast_replaceable_group = "pipe-to-ground"
        current_pipe.next_upgrade = nil
        current_pipe.pictures = build_picture_table(properties.picture_variants, colors_table[levelsN])
        current_pipe.draw_fluid_icon_override = true
        pipes[#pipes + 1] = current_pipe
    end
end
data:extend(pipes)


if  mods["boblogistics"] and settings.startup["bobmods-logistics-highpipes"] and settings.startup["bobmods-logistics-highpipes"].value == true then
  bobmods.logistics.set_pipe_height("underground-L-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("underground-i-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("underground-t-t2-pipe", 2)
  bobmods.logistics.set_pipe_height("underground-cross-t2-pipe", 2)

  bobmods.logistics.set_pipe_height("underground-L-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("underground-i-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("underground-t-t3-pipe", 4)
  bobmods.logistics.set_pipe_height("underground-cross-t3-pipe", 4)
end
