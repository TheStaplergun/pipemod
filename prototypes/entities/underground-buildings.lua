require "circuit_connector_definitions"
local base_ug_distance = util.table.deepcopy(data.raw['pipe-to-ground']['pipe-to-ground'].fluid_box.pipe_connections[2].max_underground_distance)

local blue_color = {0, 0.831, 1, 0.5}
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
            collision_mask = {'water-tile'},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            selection_priority = 51,
            se_allow_in_space = false,
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
                base_area = 1,
                height = 1,
                pipe_covers = _G.pipecoverspictures(),
                pipe_connections = {
                    {
                        position = {0, -1},
                        type = 'output',
                        max_underground_distance = (base_ug_distance + 1) * 3
                    },
                    {
                        position = {0, 1},
                        type = 'input',
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
                            filename = '__underground-pipe-pack__/graphics/entity/minipump/lr-minipump-north.png',
                            width = 48,
                            height = 48,
                            line_length = 8,
                            frame_count = 64,
                            animation_speed = 1.0,
                            shift = {0, 0.1875},
                            hr_version = {
                                filename = '__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-north.png',
                                width = 96,
                                height = 96,
                                scale = 0.5,
                                line_length = 8,
                                frame_count = 64,
                                animation_speed = 1.0,
                                shift = {0, 0.1875}
                            }
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
                            filename = '__underground-pipe-pack__/graphics/entity/shadows/lr-minipump-shadow.png',
                            priority = 'high',
                            width = 48,
                            height = 48,
                            shift = {0, 0.1875},
                            draw_as_shadow = true,
                            repeat_count = 64,
                            hr_version = {
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
                },
                east = {
                    layers = {
                        {
                            filename = '__underground-pipe-pack__/graphics/entity/minipump/lr-minipump-east.png',
                            width = 48,
                            height = 48,
                            line_length = 8,
                            frame_count = 64,
                            animation_speed = 1.0,
                            shift = {0, 0.1875},
                            hr_version = {
                                filename = '__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-east.png',
                                width = 96,
                                height = 96,
                                scale = 0.5,
                                line_length = 8,
                                frame_count = 64,
                                animation_speed = 1.0,
                                shift = {0, 0.1875}
                            }
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
                            filename = '__underground-pipe-pack__/graphics/entity/shadows/lr-minipump-shadow.png',
                            priority = 'high',
                            width = 48,
                            height = 48,
                            shift = {0, 0.1875},
                            draw_as_shadow = true,
                            repeat_count = 64,
                            hr_version = {
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
                },
                south = {
                    layers = {
                        {
                            filename = '__underground-pipe-pack__/graphics/entity/minipump/lr-minipump-south.png',
                            width = 48,
                            height = 48,
                            line_length = 8,
                            frame_count = 64,
                            animation_speed = 1.0,
                            shift = {0, 0.1875},
                            hr_version = {
                                filename = '__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-south.png',
                                width = 96,
                                height = 96,
                                scale = 0.5,
                                line_length = 8,
                                frame_count = 64,
                                animation_speed = 1.0,
                                shift = {0, 0.1875}
                            }
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
                            filename = '__underground-pipe-pack__/graphics/entity/shadows/lr-minipump-shadow.png',
                            priority = 'high',
                            width = 48,
                            height = 48,
                            shift = {0, 0.1875},
                            draw_as_shadow = true,
                            repeat_count = 64,
                            hr_version = {
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
                },
                west = {
                    layers = {
                        {
                            filename = '__underground-pipe-pack__/graphics/entity/minipump/lr-minipump-west.png',
                            width = 48,
                            height = 48,
                            line_length = 8,
                            frame_count = 64,
                            animation_speed = 1.0,
                            shift = {0, 0.1875},
                            hr_version = {
                                filename = '__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-west.png',
                                width = 96,
                                height = 96,
                                scale = 0.5,
                                line_length = 8,
                                frame_count = 64,
                                animation_speed = 1.0,
                                shift = {0, 0.1875}
                            }
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
                            filename = '__underground-pipe-pack__/graphics/entity/shadows/lr-minipump-shadow.png',
                            priority = 'high',
                            width = 48,
                            height = 48,
                            shift = {0, 0.1875},
                            draw_as_shadow = true,
                            repeat_count = 64,
                            hr_version = {
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
    }
)

if mods["space-exploration"] then
  data.raw['pump']['underground-mini-pump'].collision_mask = afh_ground_only
  local space_pump = util.table.deepcopy(data.raw['pump']['underground-mini-pump'])
  space_pump.name = "underground-space-pump"
  for _, connection in pairs(space_pump.fluid_box.pipe_connections) do
    connection.max_underground_distance = 16
  end
  space_pump.minable.result = "underground-space-pump"
  space_pump.collision_mask = afh_space_only
  space_pump.se_allow_in_space = true
  data:extend{space_pump}
end

if mods["boblogistics"] and settings.startup["bobmods-logistics-highpipes"] and settings.startup["bobmods-logistics-highpipes"].value == true then
  bobmods.logistics.set_pump_height("underground-mini-pump", 4)
  bobmods.logistics.set_pumping_speed("underground-mini-pump", 4)
end

