afh_walkable_mask = {layers={floor=true, item=true, object=true, rail=true, water_tile=true, is_lower_object=true}}
afh_normal_mask = {layers={item=true, meltable=true, floor=true, car=true, water_tile=true, transport_belt=true, is_lower_object=true}}
underground_collision_mask = _G.mods["space-age"] and {layers={lava_tile=true, empty_space=true}} or {layers={}}
afh_t1_connector_mask = {"afh_t1"}
afh_t2_connector_mask = {"afh_t2"}
afh_t3_connector_mask = {"afh_t3"}

require("prototypes.entities.pipecovers")
require("prototypes.entities.underground-pipes")
require("prototypes.entities.underground-buildings")
require("prototypes.entities.pipes-to-ground")
--require("prototypes.entities.valves")
require("prototypes.groups")
--require("prototypes.items.items-valves")
require("prototypes.items.items-underground-buildings")
require("prototypes.items.items-t1")
require("prototypes.items.items-t2")
require("prototypes.items.items-t3")
require("prototypes.items.items-intermediary")
require("prototypes.recipes.recipes-underground-buildings")
require("prototypes.recipes.recipes-t1")
require("prototypes.recipes.recipes-t2")
require("prototypes.recipes.recipes-t3")
--require("prototypes.recipes.recipes-valves")
require("prototypes.recipes.recipes-intermediary")
require("prototypes.controls")
require("prototypes.technology")
if _G.mods["no-pipe-touching"] then else
    require("prototypes.entities.multi-pipes")
    require("prototypes.recipes.recipes-multi-pipes")
    require("prototypes.items.items-multi-pipes")
end