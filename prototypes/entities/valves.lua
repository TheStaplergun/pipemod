local valve_table =
{
  ["overflow"] = {
    mine_and_place = "80-overflow-valve",
    mine_and_place_space = "80-overflow-space-valve",
    percents = {
      ["10"] = {
        threshold = 0.1,
      },
      ["20"] = {
        threshold = 0.2,
      },
      ["30"] = {
        threshold = 0.3,
      },
      ["40"] = {
        threshold = 0.4,
      },
      ["50"] = {
        threshold = 0.5,
      },
      ["60"] = {
        threshold = 0.6,
      },
      ["70"] = {
        threshold = 0.7,
      },
      ["80"] = {
        threshold = 0.8,
      },
      ["90"] = {
        threshold = 0.9,
      },
    }
  },
  ["top-up"] = {
    mine_and_place = "80-top-up-valve",
    mine_and_place_space = "80-top-up-space-valve",
    percents = {
      ["10"] = {
        threshold = 0.1,
      },
      ["20"] = {
        threshold = 0.2,
      },
      ["30"] = {
        threshold = 0.3,
      },
      ["40"] = {
        threshold = 0.4,
      },
      ["50"] = {
        threshold = 0.5,
      },
      ["60"] = {
        threshold = 0.6,
      },
      ["70"] = {
        threshold = 0.7,
      },
      ["80"] = {
        threshold = 0.8,
      },
      ["90"] = {
        threshold = 0.9,
      },
    }
  },
  [""] = {
    mine_and_place = "check-valve",
    mine_and_place_space = "check-space-valve",
    percents = {
      ["check"] =
      {
        threshold = 1,
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
  local animations = {
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
        },
      },
    }
  }
return animations

end
local function build_valve_picture_with_percent(percent, valve)
  local file_path = "__underground-pipe-pack__/graphics/entity/valves/"
  local animations = {
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
        },
        {
          filename = file_path .. valve .. "/" .. percent .. ".png",
          priority = "extra-high",
          width = 38,
          height = 28,
          scale = 0.5,
          shift = util.by_pixel(0, -6),
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
        },
        {
          filename = file_path .. valve .. "/" .. percent .. ".png",
          priority = "extra-high",
          width = 38,
          height = 28,
          scale = 0.5,
          shift = util.by_pixel(-6, -7),
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
        },
        {
          filename = file_path .. valve .. "/" .. percent .. ".png",
          priority = "extra-high",
          width = 38,
          height = 28,
          scale = 0.5,
          shift = util.by_pixel(0, -12),
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
        },
        {
          filename = file_path .. valve .. "/" .. percent .. ".png",
          priority = "extra-high",
          width = 38,
          height = 28,
          scale = 0.5,
          shift = util.by_pixel(6, -7),
        }
      },
    }
  }
return animations

end

local types =
{
  [1] = ""
}

if mods["space-exploration"] then
  types[2] = "-space"
end
local max_flow = 6000/60
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
      current_valve.type = "valve"
      local volume_to_set = data.raw["pipe"]["pipe"].fluid_box.volume
      if percent == "check" then
        current_valve.mode = "one-way"
      else
        current_valve.mode = valve
      end
      if valve == "overflow" then
        current_valve.flow_rate = max_flow - (stat.threshold * max_flow)
      else
        current_valve.flow_rate = stat.threshold * max_flow
      end
      current_valve.threshold = stat.threshold
      current_valve.fluid_box =
      {
        --base_area = stat.base_size,
        volume = volume_to_set,
        pipe_covers = _G.pipecoverspictures(),
        pipe_connections =
        {
          {
            direction = defines.direction.north,
            position = {0, 0},
            flow_direction="output"
          },
          {
            direction = defines.direction.south,
            position = {0, 0},
            flow_direction="input-output"
          }
        },
      }
      current_valve.two_direction_only = false
      if percent == "check" then
        current_valve.animations = build_valve_picture(percent, type)
      else
        current_valve.animations = build_valve_picture_with_percent(percent, valve, type)
      end
      current_valve.pictures.gas_flow = empty_sprite
      current_valve.pictures.fluid_background = empty_sprite
      current_valve.pictures.window_background = empty_sprite
      current_valve.pictures.flow_sprite = empty_sprite
      --}
      --current_valve.circuit_wire_max_distance = 0
      current_valve.working_sound = nil
      valves_to_add[#valves_to_add + 1] = current_valve
    end
  end
end
data:extend(valves_to_add)
