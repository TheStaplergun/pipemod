require("prototypes.entities.pipecovers-t1")
require("prototypes.entities.pipecovers-t2")
require("prototypes.entities.pipecovers-t3")
require("prototypes.entities.underground-pipes-t1")
require("prototypes.entities.underground-pipes-t2")
require("prototypes.entities.underground-pipes-t3")
require("prototypes.entities.underground-buildings")
require("prototypes.entities.pipes-to-ground-t1")
require("prototypes.entities.pipes-to-ground-t2")
require("prototypes.entities.pipes-to-ground-t3")
require("prototypes.entities.pipes")
require("prototypes.groups")
require("prototypes.items.items-t1")
require("prototypes.items.items-t2")
require("prototypes.items.items-t3")
require("prototypes.items.items-intermediary")
require("prototypes.recipes.recipes-t1")
require("prototypes.recipes.recipes-t2")
require("prototypes.recipes.recipes-t3")
require("prototypes.recipes.recipes-intermediary")
require("prototypes.technology")

data:extend{
    {
        type = "custom-input",
        name = "rotate-underground-pipe",
        key_sequence = "CONTROL + R",
        consuming = "script-only"
    }
}