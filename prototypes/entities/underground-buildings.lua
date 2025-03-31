require("circuit_connector_definitions")
local base_ug_distance = util.table.deepcopy(data.raw['pipe-to-ground']['pipe-to-ground'].fluid_box.pipe_connections[2].max_underground_distance)
local levels_table = {
    ["3"] = {r=38,g=173,b=227,a=0.5},
    ["2"] = {r=227,g=38,b=45,a=0.5},
    ["1"] = {r=255,g=191,b=0,a=0.5},
    --[4] = Color.from_rgb(75,0,130,255),
    --[5] = Color.from_rgb(5,73,53,255)
}
local blue_color = {0, 0.831, 1, 0.5}
local mini_pumps = {}
local next_upgrade = nil
for level, color in pairs(levels_table) do
    local current_pump = util.table.deepcopy(data.raw["pump"]["pump"])
    if level == "1" then
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
    current_pump.energy_usage = 45 * level .. 'kW'
    current_pump.pumping_speed = 20 * level
    current_pump.npt_compat = {mod = "afh", tier = level}
    current_pump.collision_box = {{-0.29, -0.29}, {0.29, 0.2}}
    current_pump.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
    current_pump.circuit_connector = circuit_connector_definitions["underground-mini-pump"]
    --current_pump.circuit_wire_connection_points = circuit_connector_definitions["underground-mini-pump"].points
    --current_pump.circuit_connector_sprites = circuit_connector_definitions["underground-mini-pump"].sprites
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
                max_underground_distance = (base_ug_distance + 1) * tonumber(level)
            },
            {
                underground_collision_mask = underground_collision_mask,
                connection_type = "underground",
                direction = defines.direction.south,
                position = {0, 0},
                flow_direction = 'input',
                max_underground_distance = (base_ug_distance + 1) * tonumber(level)
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
--[[local blue_color = {0, 0.831, 1, 0.5}
data:extend(
    {
        {
            type = 'pump',
            name = 'underground-mini-pump',
            icon = '__underground-pipe-pack__/graphics/icons/underground-mini-pump.png',
            icon_size = 32,
            flags = {'placeable-neutral', 'player-creation'},
            minable = {mining_time = 1, result = 'underground-mini-pump'},
            max_health = 180,
            fast_replaceable_group = 'pipe-to-ground',
            corpse = 'small-remnants',
            base_render_layer = 'transport-belt',
            collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
            collision_mask = afh_walkable_mask,
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            selection_priority = 51,
            circuit_wire_connection_points = circuit_connector_definitions["underground-mini-pump"].points,
            circuit_connector_sprites = circuit_connector_definitions["underground-mini-pump"].sprites,
            circuit_wire_max_distance = inserter_circuit_wire_max_distance,
            resistances = {
                {
                    type = 'fire',
                    percent = 80
                },
                {
                    type = 'impact',
                    percent = 30
                }
            },
            fluid_box = {
                --base_area = 1,
                --height = 1,
                volume = 100,
                pipe_covers = _G.pipecoverspictures(),
                pipe_connections = {
                    {
                        underground_collision_mask = underground_collision_mask,
                        connection_type = "underground",
                        direction = defines.direction.north,
                        position = {0, 0},
                        flow_direction = 'output',
                        max_underground_distance = (base_ug_distance + 1) * 3
                    },
                    {
                        underground_collision_mask = underground_collision_mask,
                        connection_type = "underground",
                        direction = defines.direction.south,
                        position = {0, 0},
                        flow_direction = 'input',
                        max_underground_distance = (base_ug_distance + 1) * 3
                    }
                }
            },
            underground_sprite = {
                filename = '__core__/graphics/arrows/underground-lines.png',
                priority = 'extra-high-no-scale',
                width = 64,
                height = 64,
                scale = 0.5
            },
            energy_source = {
                type = 'electric',
                usage_priority = 'secondary-input',
                emissions = 0.01 / 2.5
            },
            energy_usage = '45kW',
            pumping_speed = 200,
            vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
            animations =
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
        }
    }
)

]]--