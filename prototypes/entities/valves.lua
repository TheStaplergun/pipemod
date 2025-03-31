local valve_table =
{
  ["overflow"] = {
    mine_and_place = "80-overflow-valve",
    mine_and_place_space = "80-overflow-space-valve",
    percents = {
      ["10"] = {
        base_level = 0.1,
        base_size = 0.9,
      },
      ["20"] = {
        base_level = 0.2,
        base_size = 0.8,
      },
      ["30"] = {
        base_level = 0.3,
        base_size = 0.7,
      },
      ["40"] = {
        base_level = 0.4,
        base_size = 0.6,
      },
      ["50"] = {
        base_level = 0.5,
        base_size = 0.5,
      },
      ["60"] = {
        base_level = 0.6,
        base_size = 0.4,
      },
      ["70"] = {
        base_level = 0.7,
        base_size = 0.3,
      },
      ["80"] = {
        base_level = 0.8,
        base_size = 0.2,
      },
      ["90"] = {
        base_level = 0.9,
        base_size = 0.1,
      },
    }
  },
  ["top-up"] = {
    mine_and_place = "80-top-up-valve",
    mine_and_place_space = "80-top-up-space-valve",
    percents = {
      ["10"] = {
        base_level = -0.9,
        base_size = 0.9,
      },
      ["20"] = {
        base_level = -0.8,
        base_size = 0.8,
      },
      ["30"] = {
        base_level = -0.7,
        base_size = 0.7,
      },
      ["40"] = {
        base_level = -0.6,
        base_size = 0.6,
      },
      ["50"] = {
        base_level = -0.5,
        base_size = 0.5,
      },
      ["60"] = {
        base_level = -0.4,
        base_size = 0.4,
      },
      ["70"] = {
        base_level = -0.3,
        base_size = 0.3,
      },
      ["80"] = {
        base_level = -0.2,
        base_size = 0.2,
      },
      ["90"] = {
        base_level = -0.1,
        base_size = 0.1,
      },
    }
  },
  [""] = {
    mine_and_place = "check-valve",
    mine_and_place_space = "check-space-valve",
    percents = {
      ["check"] =
      {
        base_level = 0,
        base_size = 1
      }
    }
  },
}

local empty_sprite =
{
  filename = "__core__/graphics/empty.png",
  priority = "extra-high",
  width = 1,
  height = 1,
  frame_count = 1
}
local valves_to_add = {}

local function build_valve_picture(valve)
  local file_path = "__underground-pipe-pack__/graphics/entity/valves/"
  local pictures = {
    picture = {
      north = {
        layers = {
          _G.pipepictures().straight_vertical,
          {
            filename = file_path .. valve .. "/up-arrow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            --scale = 0.8,
            scale = 0.5,
            --shift = util.by_pixel(0, -5),
            hr_version = {
                filename = file_path .. valve .. "/up-arrow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                --shift = util.by_pixel(0, -5)
            }
          },
        }
      },
      east = {
        layers = {
          _G.pipepictures().straight_horizontal,
          {
            filename = file_path .. valve .. "/right-arrow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            --scale = 0.8,
            scale = 0.5,
            --shift = util.by_pixel(0, -5),
            hr_version = {
                filename = file_path .. valve .. "/right-arrow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                --shift = util.by_pixel(0, -5)
            }
          },
        }
      },
      south = {
        layers = {
          _G.pipepictures().straight_vertical,
          {
            filename = file_path .. valve .. "/down-arrow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            --scale = 0.8,
            scale = 0.5,
            --shift = util.by_pixel(0, -5),
            hr_version = {
                filename = file_path .. valve .. "/down-arrow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                --shift = util.by_pixel(0, -5)
            }
          },
        }
      },
      west = {
        layers = {
          _G.pipepictures().straight_horizontal,
          {
            filename = file_path .. valve .. "/left-arrow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            --scale = 0.8,
            scale = 0.5,
            --shift = util.by_pixel(0, -5),
            hr_version = {
                filename = file_path .. valve .. "/left-arrow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                --shift = util.by_pixel(0, -5)
            }
          },
        },
      }
    }
  }
return pictures

end
local function build_valve_picture_with_percent(percent, valve)
  local file_path = "__underground-pipe-pack__/graphics/entity/valves/"
  local pictures = {
    picture = {
      north = {
        layers = {
          _G.pipepictures().straight_vertical,
          {
            filename = file_path .. valve .. "/up-arrow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            --scale = 0.8,
            scale = 0.5,
            shift = util.by_pixel(0, -2),
            hr_version = {
                filename = file_path .. valve .. "/up-arrow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                shift = util.by_pixel(0, -2)
            }
          },
          {
            filename = file_path .. valve .. "/" .. percent .. ".png",
            priority = "extra-high",
            width = 38,
            height = 28,
            scale = 0.5,
            shift = util.by_pixel(0, -6),
            hr_version = {
                filename = file_path .. valve .. "/" .. percent .. ".png",
                priority = "extra-high",
                width = 38,
                height = 28,
                scale = 0.5,
                shift = util.by_pixel(0, -6)
            }
          }
        }
      },
      east = {
        layers = {
          _G.pipepictures().straight_horizontal,
          {
            filename = file_path .. valve .. "/right-arrow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            --scale = 0.8,
            scale = 0.5,
            --shift = util.by_pixel(0, -5),
            hr_version = {
                filename = file_path .. valve .. "/right-arrow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                --shift = util.by_pixel(0, -5)
            }
          },
          {
            filename = file_path .. valve .. "/" .. percent .. ".png",
            priority = "extra-high",
            width = 38,
            height = 28,
            scale = 0.5,
            shift = util.by_pixel(-6, -7),
            hr_version = {
                filename = file_path .. valve .. "/" .. percent .. ".png",
                priority = "extra-high",
                width = 38,
                height = 28,
                scale = 0.5,
                shift = util.by_pixel(-6, -7)
            }
          }
        }
      },
      south = {
        layers = {
          _G.pipepictures().straight_vertical,
          {
            filename = file_path .. valve .. "/down-arrow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            --scale = 0.8,
            scale = 0.5,
            --shift = util.by_pixel(0, -5),
            hr_version = {
                filename = file_path .. valve .. "/down-arrow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                --shift = util.by_pixel(0, -5)
            }
          },
          {
            filename = file_path .. valve .. "/" .. percent .. ".png",
            priority = "extra-high",
            width = 38,
            height = 28,
            scale = 0.5,
            shift = util.by_pixel(0, -12),
            hr_version = {
                filename = file_path .. valve .. "/" .. percent .. ".png",
                priority = "extra-high",
                width = 38,
                height = 28,
                scale = 0.5,
                shift = util.by_pixel(0, -12)
            }
          }
        }
      },
      west = {
        layers = {
          _G.pipepictures().straight_horizontal,
          {
            filename = file_path .. valve .. "/left-arrow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            --scale = 0.8,
            scale = 0.5,
            --shift = util.by_pixel(0, -5),
            hr_version = {
                filename = file_path .. valve .. "/left-arrow.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                --shift = util.by_pixel(0, -5)
            }
          },
          {
            filename = file_path .. valve .. "/" .. percent .. ".png",
            priority = "extra-high",
            width = 38,
            height = 28,
            scale = 0.5,
            shift = util.by_pixel(6, -7),
            hr_version = {
                filename = file_path .. valve .. "/" .. percent .. ".png",
                priority = "extra-high",
                width = 38,
                height = 28,
                scale = 0.5,
                shift = util.by_pixel(6, -7)
            }
          }
        },
      }
    }
  }
return pictures

end

local types =
{
  [1] = ""
}

if mods["space-exploration"] then
  types[2] = "-space"
end

for num, type in pairs(types) do
  for valve, datas in pairs(valve_table) do
    for percent, stat in pairs(datas.percents) do
      local current_valve = util.table.deepcopy(data.raw["storage-tank"]["storage-tank"])

      if num == 2 then
        current_valve.minable.result = datas.mine_and_place_space
        current_valve.placeable_by = {item = datas.mine_and_place_space, count = 1}
        if percent == "check" then
          current_valve.name = percent .. valve .. type .. "-valve"
          current_valve.localised_name = {"valves.check-valve-space-name"}
        else
          current_valve.name = percent ..  "-" .. valve .. type .. "-valve"
          current_valve.localised_name = {"valves.valve-name-space", percent .. "%", valve}
        end

      else

        current_valve.minable.result = datas.mine_and_place
        current_valve.placeable_by = {item = datas.mine_and_place, count = 1}
        if percent == "check" then
          current_valve.name = percent .. "-" .. valve .. "valve"
          current_valve.localised_name = {"valves.check-valve-name"}
        else
          current_valve.name = percent ..  "-" .. valve .. "-valve"
          current_valve.localised_name = {"valves.valve-name", percent .. "%", valve}
        end
      end

      current_valve.icon = "__base__/graphics/icons/pipe.png"
      current_valve.corpse = "small-remnants"
      current_valve.max_health = data.raw["pipe"]["pipe"].max_health
      current_valve.resistances = data.raw["pipe"]["pipe"].resistances
      current_valve.fast_replaceable_group = data.raw["pipe"]["pipe"].fast_replaceable_group
      current_valve.collision_box = data.raw["pipe"]["pipe"].collision_box
      current_valve.selection_box = data.raw["pipe"]["pipe"].selection_box
      current_valve.next_upgrade = nil
      current_valve.energy_usage = "0W"
      current_valve.energy_source = {type = "void"}
      current_valve.buffer_capacity = "0MJ"
      current_valve.input_flow_limit = "0W"
      current_valve.type = "pump"
      if valve == "overflow" then
        current_valve.pumping_speed = stat.base_size * 100
      else
        current_valve.pumping_speed = 100
      end
      local volume_to_set = nil
      if stat.base_level > 0 then
        volume_to_set = stat.base_level * 100
      else
        volume_to_set = 100
      end
      current_valve.fluid_box =
      {
        --base_area = stat.base_size,
        --base_level = stat.base_level,
        volume = volume_to_set,
        pipe_covers = _G.pipecoverspictures(),
        pipe_connections =
        {
          {
            direction = defines.direction.south,
            position = {0, 0},
            flow_direction="output"
          },
          {
            direction = defines.direction.north,
            position = {0, 0},
            flow_direction="input"
          }
        },
      }
      current_valve.two_direction_only = false
      if percent == "check" then
        current_valve.pictures = build_valve_picture(percent, type)
      else
        current_valve.pictures = build_valve_picture_with_percent(percent, valve, type)
      end
      current_valve.pictures.gas_flow = empty_sprite
      current_valve.pictures.fluid_background = empty_sprite
      current_valve.pictures.window_background = empty_sprite
      current_valve.pictures.flow_sprite = empty_sprite
      --}
      current_valve.circuit_wire_max_distance = 0
      current_valve.working_sound = nil
      valves_to_add[#valves_to_add + 1] = current_valve
    end
  end
end
data:extend(valves_to_add)
