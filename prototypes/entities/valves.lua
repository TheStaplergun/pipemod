local valve_table =
{
  ["overflow"] = {
    mine_and_place = "80-overflow-valve",
    percents = {
      ["10"] = 0.1,
      ["20"] = 0.2,
      ["30"] = 0.3,
      ["40"] = 0.4,
      ["50"] = 0.5,
      ["60"] = 0.6,
      ["70"] = 0.7,
      ["80"] = 0.8,
      ["90"] = 0.9,
      ["100"] = 0.99,
    }
  },
  ["top-up"] = {
    mine_and_place = "80-top-up-valve",
    percents = {
    ["10"] = -0.9,
    ["20"] = -0.8,
    ["30"] = -0.7,
    ["40"] = -0.6,
    ["50"] = -0.5,
    ["60"] = -0.4,
    ["70"] = -0.3,
    ["80"] = -0.2,
    ["90"] = -0.1,
    }
  },
  --[[["mini-flow"] = {
    mine_and_place = "50-mini-flow-valve",
    percents = {
      ["10"] = 0.1,
      ["20"] = 0.2,
      ["30"] = 0.3,
      ["40"] = 0.4,
      ["50"] = 0.5,
      ["60"] = 0.6,
      ["70"] = 0.7,
      ["80"] = 0.8,
      ["90"] = 0.9,
    }
  },]]--
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

for valve, datas in pairs(valve_table) do
  for percent, stat in pairs(datas.percents) do
    local current_valve = util.table.deepcopy(data.raw["storage-tank"]["storage-tank"])
    current_valve.name = percent .. "-" .. valve .. "-valve"
    current_valve.icon = "__base__/graphics/icons/pipe.png"
    current_valve.minable.result = datas.mine_and_place
    current_valve.placeable_by = {item = datas.mine_and_place, count = 1}
    current_valve.localised_name = {"valves.valve-name", percent.."% ", valve}
    current_valve.corpse = "small-remnants"
    current_valve.max_health = data.raw["pipe"]["pipe"].max_health
    current_valve.resistances = data.raw["pipe"]["pipe"].resistances
    current_valve.fast_replaceable_group = data.raw["pipe"]["pipe"].fast_replaceable_group
    current_valve.collision_box = data.raw["pipe"]["pipe"].collision_box
    current_valve.selection_box = data.raw["pipe"]["pipe"].selection_box
    current_valve.fluid_box =
    {
      base_area = 1,
      --base_level = stat,
      pipe_covers = _G.pipecoverspictures(),
      pipe_connections =
      {
        {
          position = {0, -1},
          type="output"
        },
        { position = {0, 1} }
      },
    }
    if valve == "mini-flow" then
      current_valve.fluid_box.height = stat
    else
      current_valve.fluid_box.base_level = stat
    end
    current_valve.two_direction_only = false
    current_valve.pictures =
    {
      picture =
      {
        north = _G.pipepictures().straight_vertical,
        east = _G.pipepictures().straight_horizontal,
        south = _G.pipepictures().straight_vertical,
        west = _G.pipepictures().straight_horizontal
      },
      gas_flow = empty_sprite,
      fluid_background = empty_sprite,
      window_background = empty_sprite,
      flow_sprite = empty_sprite
    }
    current_valve.circuit_wire_max_distance = 0
    current_valve.working_sound = nil
    valves_to_add[#valves_to_add + 1] = current_valve
  end
end
data:extend(valves_to_add)
