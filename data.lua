
afh_space_only =
{
  "water-tile",
  "ground-tile"
}

afh_ground_only =
{
  "water-tile",

}

require("prototypes.entities.pipecovers")
require("prototypes.entities.underground-pipes")
require("prototypes.entities.underground-buildings")
require("prototypes.entities.pipes-to-ground")
require("prototypes.entities.pipes")
require("prototypes.entities.valves")
require("prototypes.groups")
require("prototypes.items.items-valves")
require("prototypes.items.items-t1")
require("prototypes.items.items-t2")
require("prototypes.items.items-t3")
require("prototypes.items.items-intermediary")
require("prototypes.recipes.recipes-t1")
require("prototypes.recipes.recipes-t2")
require("prototypes.recipes.recipes-t3")
require("prototypes.recipes.recipes-valves")
require("prototypes.recipes.recipes-intermediary")
require("prototypes.technology")
require("prototypes.controls")

if _G.mods["space-exploration"] then
  local collision_mask_util_extended = require("collision-mask-util.collision-mask-util-extended")

  local collision_mask_empty_space_tile = get_make_named_collision_mask("empty-space-tile")
  table.insert(afh_ground_only, collision_mask_empty_space_tile)

  local collision_mask_space_tile = get_make_named_collision_mask("space-tile")
  table.insert(afh_space_only, collision_mask_space_tile)
  table.insert(afh_space_only, collision_mask_empty_space_tile)
  
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
end
