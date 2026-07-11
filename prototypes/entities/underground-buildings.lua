require("circuit_connector_definitions")
local base_ug_distance = util.table.deepcopy(data.raw['pipe-to-ground']['pipe-to-ground'].fluid_box.pipe_connections[2].max_underground_distance)
-- Descending order makes next_upgrade deterministic: tier 1 -> tier 2 -> tier 3.
local levels = {
    {number = 3, colour = {r = 38, g = 173, b = 227, a = 0.5}},
    {number = 2, colour = {r = 227, g = 38, b = 45, a = 0.5}},
    {number = 1, colour = {r = 255, g = 191, b = 0, a = 0.5}},
}
local blue_color = {0, 0.831, 1, 0.5}
local mini_pumps = {}
local next_upgrade = nil
for _, level_data in ipairs(levels) do
    local level = level_data.number
    local color = level_data.colour
    local current_pump = util.table.deepcopy(data.raw["pump"]["pump"])
    if level == 1 then
        current_pump.name = "underground-mini-pump"
    else
        current_pump.name = "underground-mini-pump-t" .. level
    end
    current_pump.icon = '__underground-pipe-pack__/graphics/icons/underground-mini-pump.png'
    current_pump.icon_size = 32
    --The name and the minable results are usually the same
    current_pump.minable.result = current_pump.name
    current_pump.placeable_by = {item = current_pump.name, count = 1}
    current_pump.collision_mask = afh_walkable_mask
    current_pump.base_render_layer = 'transport-belt'
    current_pump.selection_priority = 51
    current_pump.energy_usage = tostring(45 * level) .. "kW"
    current_pump.pumping_speed = 20 * level
    current_pump.npt_compat = {mod = "afh", tier = level}
    current_pump.collision_box = {{-0.29, -0.29}, {0.29, 0.2}}
    current_pump.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
    current_pump.circuit_connector = circuit_connector_definitions["underground-mini-pump"]
    current_pump.circuit_wire_max_distance = inserter_circuit_wire_max_distance
    if next_upgrade then
        current_pump.next_upgrade = next_upgrade
    end
    next_upgrade = current_pump.name
    current_pump.fluid_box = {
        volume = 400,
        pipe_covers = _G.pipecoverspictures(),
        pipe_connections = {
            {
                underground_collision_mask = underground_collision_mask,
                connection_type = "underground",
                direction = defines.direction.north,
                position = {0, 0},
                flow_direction = 'output',
                max_underground_distance = (base_ug_distance + 1) * level
            },
            {
                underground_collision_mask = underground_collision_mask,
                connection_type = "underground",
                direction = defines.direction.south,
                position = {0, 0},
                flow_direction = 'input',
                max_underground_distance = (base_ug_distance + 1) * level
            }
        }
    }
    current_pump.glass_pictures = nil
    current_pump.fluid_animation = nil
    current_pump.animations =
    {
        north = {
            layers = {
                {
                    filename = '__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-north.png',
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 64,
                    animation_speed = 1.0,
                    shift = {0, 0.1875}
                },
                {
                    filename = '__underground-pipe-pack__/graphics/entity/arrows/hr-ug-arrow-N.png',
                    priority = 'extra-high',
                    width = 96,
                    height = 96,
                    shift = {0, 0.1875},
                    apply_runtime_tint = true,
                    tint = blue_color,
                    repeat_count = 64,
                    scale = 0.5
                },
                {
                    filename = "__underground-pipe-pack__/graphics/entity/underground-cap/hr-underground-metal-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    apply_runtime_tint = true,
                    tint = color,
                    repeat_count = 64,
                    shift = {0,0.1875},
                },
                {
                    filename = '__underground-pipe-pack__/graphics/entity/shadows/hr-minipump-shadow.png',
                    priority = 'high',
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    shift = {0, 0.1875},
                    draw_as_shadow = true,
                    repeat_count = 64
                }
            }
        },
        east = {
            layers = {
                {
                    filename = '__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-east.png',
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 64,
                    animation_speed = 1.0,
                    shift = {0, 0.1875}
                },
                {
                    filename = '__underground-pipe-pack__/graphics/entity/arrows/hr-ug-arrow-E.png',
                    priority = 'extra-high',
                    width = 96,
                    height = 96,
                    shift = {0, 0.1875},
                    apply_runtime_tint = true,
                    tint = blue_color,
                    repeat_count = 64,
                    scale = 0.5
                },
                {
                    filename = "__underground-pipe-pack__/graphics/entity/underground-cap/hr-underground-metal-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    apply_runtime_tint = true,
                    tint = color,
                    repeat_count = 64,
                    shift = {0,0.1875},
                },
                {
                    filename = '__underground-pipe-pack__/graphics/entity/shadows/hr-minipump-shadow.png',
                    priority = 'high',
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    shift = {0, 0.1875},
                    draw_as_shadow = true,
                    repeat_count = 64
                }
            }
        },
        south = {
            layers = {
                {
                    filename = '__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-south.png',
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 64,
                    animation_speed = 1.0,
                    shift = {0, 0.1875}
                },
                {
                    filename = '__underground-pipe-pack__/graphics/entity/arrows/hr-ug-arrow-S.png',
                    priority = 'extra-high',
                    width = 96,
                    height = 96,
                    shift = {0, 0.1875},
                    apply_runtime_tint = true,
                    tint = blue_color,
                    repeat_count = 64,
                    scale = 0.5
                },
                {
                    filename = "__underground-pipe-pack__/graphics/entity/underground-cap/hr-underground-metal-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    apply_runtime_tint = true,
                    tint = color,
                    repeat_count = 64,
                    shift = {0,0.1875},
                },
                {
                    filename = '__underground-pipe-pack__/graphics/entity/shadows/hr-minipump-shadow.png',
                    priority = 'high',
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    shift = {0, 0.1875},
                    draw_as_shadow = true,
                    repeat_count = 64
                }
            }
        },
        west = {
            layers = {
                {
                    filename = '__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-west.png',
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    line_length = 8,
                    frame_count = 64,
                    animation_speed = 1.0,
                    shift = {0, 0.1875}
                },
                {
                    filename = '__underground-pipe-pack__/graphics/entity/arrows/hr-ug-arrow-W.png',
                    priority = 'extra-high',
                    width = 96,
                    height = 96,
                    shift = {0, 0.1875},
                    apply_runtime_tint = true,
                    tint = blue_color,
                    repeat_count = 64,
                    scale = 0.5
                },
                {
                    filename = "__underground-pipe-pack__/graphics/entity/underground-cap/hr-underground-metal-mask.png",
                    priority = "extra-high",
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    apply_runtime_tint = true,
                    tint = color,
                    repeat_count = 64,
                    shift = {0,0.1875},
                },
                {
                    filename = '__underground-pipe-pack__/graphics/entity/shadows/hr-minipump-shadow.png',
                    priority = 'high',
                    width = 96,
                    height = 96,
                    scale = 0.5,
                    shift = {0, 0.1875},
                    draw_as_shadow = true,
                    repeat_count = 64
                }
            }
        }
    }
    mini_pumps[#mini_pumps+1] = current_pump
end
data:extend(mini_pumps)
