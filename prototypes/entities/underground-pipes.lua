local north = {direction=defines.direction.north, position = {0, 0}}
local south = {direction=defines.direction.south, position = {0, 0}}
local west = {direction=defines.direction.west, position = {0, 0}}
local east = {direction=defines.direction.east, position = {0, 0}}

local direction_table = {
    ['NS'] = {north, south},
    ['ES'] = {east, south},
    ['ESW'] = {east, south, west},
    ['NSEW'] = {north, south, east, west}
}
local base_ug_distance = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance)
local function build_connections_table(directions, level)
    local connections_table = {}
    local max_distance
    for _, datas in pairs(direction_table[directions]) do
        if level == "space" then
            max_distance = 14
        else
            max_distance = (base_ug_distance + 1) * level
        end
        connections_table[#connections_table + 1] = {
            underground_collision_mask = underground_collision_mask,
            connection_type = "underground",
            position = datas.position,
            direction = datas.direction,
            max_underground_distance = max_distance
        }
  end
  return connections_table
end

local names_table = {
    ["underground-i"] = {
        directions = 'NS',
        picture_variants = {
            north = 'NS',
            east = 'EW',
            south = 'NS',
            west = 'EW'
        }
    },
    ["underground-L"] = {
        directions = 'ES',
        picture_variants = {
            north = 'ES',
            south = 'NW',
            east = 'SW',
            west = 'NE'
        }
    },
    ["underground-t"] = {
        directions = 'ESW',
        picture_variants = {
            north = 'ESW',
            east = 'NSW',
            south = 'NEW',
            west = 'NES'
        }
    },
    ["underground-cross"] = {
        directions = 'NSEW',
        picture_variants = {
            north = 'NESW',
            south = 'NESW',
            west = 'NESW',
            east = 'NESW'
        }
    },
}

local levels_table = {
    ["3"] = {r=38,g=173,b=227,a=0.5},--util.color(),
    ["2"] = {r=227,g=38,b=45,a=0.5},--util.color(),
    ["1"] = {r=255,g=191,b=0,a=0.5}--util.color(),
    --[4] = Color.from_rgb(75,0,130,255),
    --[5] = Color.from_rgb(5,73,53,255)
}

local file_path = "__underground-pipe-pack__/graphics/entity/underground-cap/"
local a_file_path = "__underground-pipe-pack__/graphics/entity/arrows/"

local function build_picture_table(variants, color)
    local picture_table = {}
    for direction, variant in pairs(variants) do
        picture_table[direction] =
        {
            layers = {
                {
                    filename = file_path .. "hr-ug-" .. variant .. ".png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    shift = {0,0.1875},
                    scale = 0.5
                },
                {
                    filename = a_file_path .. "hr-ug-arrow-" .. variant .. ".png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    shift = {0,0.1875},
                    apply_runtime_tint = true,
                    tint = color,
                    scale = 0.5
                },
                {
                    filename = file_path .. "hr-underground-metal-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    apply_runtime_tint = true,
                    tint = color,
                    shift = {0,0.1875},
                },
                {
                    filename = "__underground-pipe-pack__/graphics/entity/shadows/hr-minipump-shadow.png",
                    priority = "high",
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    shift = {0,0.1875},
                    draw_as_shadow = true,
                },
            }
        }
    end
    return picture_table
end


local pipes = {}
for name, properties in pairs(names_table) do
    local next_upgrade = nil
    for level, color in pairs(levels_table) do
        local current_pipe = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
        if level == "1" then
            current_pipe.name = name .. "-pipe"
            current_pipe.minable.result = name .. "-pipe"
        elseif level == "space" then
            current_pipe.name = name .. "-space-pipe"
            current_pipe.minable.result = name .. "-space-pipe"
        else
            current_pipe.name = name .. "-t" .. level .. "-pipe"
            current_pipe.minable.result = name .. "-t" .. level .. "-pipe"
        end

        if level == "space" then
            current_pipe.collision_mask = afh_space_only
            current_pipe.icon = "__underground-pipe-pack__/graphics/icons/space-exploration-compat/" .. name .. ".png"
            current_pipe.se_allow_in_space = true
        else
            current_pipe.collision_mask = afh_walkable_mask
            current_pipe.icon = "__underground-pipe-pack__/graphics/icons/" .. name .. "-t" .. level .. ".png"
            current_pipe.se_allow_in_space = false
        end

        current_pipe.icon_size = 32
        current_pipe.selection_priority = 51

        local fluid_box = util.table.deepcopy(current_pipe.fluid_box)
        fluid_box.pipe_connections = build_connections_table(properties.directions, level)
        fluid_box.pipe_covers = nil
        fluid_box.hide_connection_info = true
        current_pipe.fluid_box = fluid_box
        current_pipe.fast_replaceable_group = "pipe-to-ground"

        if next_upgrade then
            current_pipe.next_upgrade = next_upgrade
        end
        next_upgrade = current_pipe.name

        current_pipe.pictures = build_picture_table(properties.picture_variants, color)
        current_pipe.draw_fluid_icon_override = true
        pipes[#pipes + 1] = current_pipe
    end
end
data:extend(pipes)