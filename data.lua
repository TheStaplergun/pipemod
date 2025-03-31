--[[afh_space_only =
{
  "water-tile",
  "ground-tile",
  --"item-layer",
  --"object-layer",
  --"player-layer"
}
]]--

afh_walkable_mask = {layers={floor=true, item=true, object=true, rail=true, water_tile=true, is_lower_object=true}}
afh_normal_mask = {layers={item=true, meltable=true, floor=true, car=true, water_tile=true, transport_belt=true, is_lower_object=true}}
underground_collision_mask = {layers={lava_tile=true, empty_space=true}}
require("prototypes.entities.pipecovers")
require("prototypes.entities.underground-pipes")
require("prototypes.entities.underground-buildings")
require("prototypes.entities.pipes-to-ground")
require("prototypes.entities.pipes")
--require("prototypes.entities.valves")
require("prototypes.groups")
--require("prototypes.items.items-valves")
require("prototypes.items.items-t1")
require("prototypes.items.items-t2")
require("prototypes.items.items-t3")
require("prototypes.items.items-intermediary")
require("prototypes.recipes.recipes-t1")
require("prototypes.recipes.recipes-t2")
require("prototypes.recipes.recipes-t3")
--require("prototypes.recipes.recipes-valves")
require("prototypes.recipes.recipes-intermediary")
require("prototypes.technology")
require("prototypes.controls")
--[[if _G.mods["space-exploration"] then

  -- RECIPES

  require("prototypes.recipes.space-exploration-compat.recipes-space-pipes")
  require("prototypes.recipes.space-exploration-compat.recipes-space-valves")

  -- ITEMS

  require("prototypes.items.space-exploration-compat.items-space-intermediary")
  require("prototypes.items.space-exploration-compat.items-space-valves")
  require("prototypes.items.space-exploration-compat.items-space-pipes")

  --[[
    Entities are generated as part of a script and perform a check at that stage.
  ]]
--]]end
