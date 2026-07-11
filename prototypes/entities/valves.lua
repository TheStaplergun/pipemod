local base_pipe = data.raw["pipe"]["pipe"]
local max_flow = 6000 / 60 -- Valve flow_rate is measured per tick.
local valves = {}
local valve_graphics_path = "__underground-pipe-pack__/graphics/entity/valves/"

local valve_definitions = {
  overflow = {
    item_name = "80-overflow-valve",
    icon = "__underground-pipe-pack__/graphics/icons/overflow-valve.png",
  },
  ["top-up"] = {
    item_name = "80-top-up-valve",
    icon = "__underground-pipe-pack__/graphics/icons/top-up-valve.png",
  },
}

local function build_valve_picture(valve_type)
  return {
    north = {
      layers = {
        _G.pipepictures().straight_vertical,
        {
          filename = valve_graphics_path .. valve_type .. "/up-arrow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
    },
    east = {
      layers = {
        _G.pipepictures().straight_horizontal,
        {
          filename = valve_graphics_path .. valve_type .. "/right-arrow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
    },
    south = {
      layers = {
        _G.pipepictures().straight_vertical,
        {
          filename = valve_graphics_path .. valve_type .. "/down-arrow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
    },
    west = {
      layers = {
        _G.pipepictures().straight_horizontal,
        {
          filename = valve_graphics_path .. valve_type .. "/left-arrow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
    },
  }
end

local function build_valve_picture_with_percent(percent, valve_type)
  local pictures = build_valve_picture(valve_type)
  local shifts = {
    north = util.by_pixel(0, -6),
    east = util.by_pixel(-6, -7),
    south = util.by_pixel(0, -12),
    west = util.by_pixel(6, -7),
  }

  for direction, picture in pairs(pictures) do
    picture.layers[#picture.layers + 1] = {
      filename = valve_graphics_path .. valve_type .. "/" .. percent .. ".png",
      priority = "extra-high",
      width = 38,
      height = 28,
      scale = 0.5,
      shift = shifts[direction],
    }
  end

  return pictures
end

local function copy_if_present(target, source, key)
  if source[key] ~= nil then
    target[key] = util.table.deepcopy(source[key])
  end
end

local function make_base_valve(name, item_name, icon)
  local valve = {
    type = "valve",
    name = name,
    icon = icon,
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {
      mining_time = base_pipe.minable and base_pipe.minable.mining_time or 0.1,
      result = item_name,
    },
    placeable_by = {item = item_name, count = 1},
    max_health = base_pipe.max_health,
    collision_box = util.table.deepcopy(base_pipe.collision_box),
    selection_box = util.table.deepcopy(base_pipe.selection_box),
    collision_mask = util.table.deepcopy(base_pipe.collision_mask),
    fast_replaceable_group = base_pipe.fast_replaceable_group,
    fluid_box = {
      volume = base_pipe.fluid_box.volume,
      pipe_covers = _G.pipecoverspictures(),
      pipe_connections = {
        {
          direction = defines.direction.north,
          position = {0, 0},
          flow_direction = "output",
        },
        {
          direction = defines.direction.south,
          position = {0, 0},
          flow_direction = "input-output",
        },
      },
    },
  }

  for _, key in ipairs({
    "corpse",
    "dying_explosion",
    "damaged_trigger_effect",
    "resistances",
    "impact_category",
    "build_sound",
    "mined_sound",
    "mining_sound",
    "rotated_sound",
    "open_sound",
    "close_sound",
  }) do
    copy_if_present(valve, base_pipe, key)
  end

  return valve
end

for valve_type, definition in pairs(valve_definitions) do
  for percent = 10, 90, 10 do
    local threshold = percent / 100
    local name = percent .. "-" .. valve_type .. "-valve"
    local valve = make_base_valve(name, definition.item_name, definition.icon)

    valve.localised_name = {"valves.valve-name", percent .. "%", valve_type}
    valve.mode = valve_type
    valve.threshold = threshold
    valve.flow_rate = valve_type == "overflow"
      and max_flow * (1 - threshold)
      or max_flow * threshold
    valve.animations = build_valve_picture_with_percent(tostring(percent), valve_type)

    valves[#valves + 1] = valve
  end
end

local check_valve = make_base_valve(
  "check-valve",
  "check-valve",
  "__underground-pipe-pack__/graphics/icons/check-valve.png"
)
check_valve.localised_name = {"valves.check-valve-name"}
check_valve.mode = "one-way"
check_valve.flow_rate = max_flow
check_valve.animations = build_valve_picture("check")
valves[#valves + 1] = check_valve

data:extend(valves)
