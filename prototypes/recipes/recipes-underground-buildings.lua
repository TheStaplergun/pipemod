local recipes = {
    -- UNDERGROUND BUILDINGS
    {
      type = "recipe",
      name = "underground-mini-pump",
      ingredients =
      {
        {type = "item", name = "engine-unit", amount = 1},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "item", name = "small-pipe-coupler", amount = 2},
        {type = "item", name = "underground-pipe-segment-t1", amount = 10},
      },
      enabled = false,
      results = {{type="item", name="underground-mini-pump", amount=1}}
    },
    {
      type = "recipe",
      name = "underground-mini-pump-t2",
      ingredients =
      {
        {type = "item", name = "engine-unit", amount = 1},
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "medium-pipe-coupler", amount = 2},
        {type = "item", name = "underground-pipe-segment-t2", amount = 10},
      },
      enabled = false,
      results = {{type="item", name="underground-mini-pump-t2", amount=1}}
    },
    {
      type = "recipe",
      name = "underground-mini-pump-t3",
      ingredients =
      {
        {type = "item", name = "electric-engine-unit", amount = 1},
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "large-pipe-coupler", amount = 2},
        {type = "item", name = "underground-pipe-segment-t3", amount = 10},
      },
      enabled = false,
      results = {{type="item", name="underground-mini-pump-t3", amount=1}}
    }
}
--[[
local t4_pump_recipe = nil
if _G.mods["space-age"] then
  t4_pump_recipe = {
    {
      type = "recipe",
      name = "underground-mini-pump-t4",
      ingredients =
      {
        {type = "item", name = "electric-engine-unit", amount = 1},
        {type = "item", name = "tungsten-plate", amount = 1},
        {type = "item", name = "large-pipe-coupler", amount = 2},
        {type = "item", name = "underground-pipe-segment-t4", amount = 10},
      },
      enabled = false,
      results = {{type="item", name="underground-mini-pump-t4", amount=1}}
    }
  }
else
  t4_pump_recipe = {
    {
      type = "recipe",
      name = "underground-mini-pump-t4",
      ingredients =
      {
        {type = "item", name = "electric-engine-unit", amount = 1},
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "large-pipe-coupler", amount = 2},
        {type = "item", name = "underground-pipe-segment-t4", amount = 10},
      },
      enabled = false,
      results = {{type="item", name="underground-mini-pump-t4", amount=1}}
    }
  }
end
]]--
data:extend(recipes)
--data:extend(t4_pump_recipe)
