require("prototypes.entities.pipecovers")
require("prototypes.entities.underground-pipes-t1")
require("prototypes.entities.underground-pipes-t2")
require("prototypes.entities.underground-pipes-t3")
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

data:extend{
    {
        type = "custom-input",
        name = "rotate-underground-pipe",
        key_sequence = "CONTROL + R",
        consuming = "script-only"
    },
    {
        type = "custom-input",
        name = "minus-valve",
        key_sequence = "NUM -",
        consuming = "script-only"
    },
    {
        type = "custom-input",
        name = "plus-valve",
        key_sequence = "NUM +",
        consuming = "script-only"
    }
}
