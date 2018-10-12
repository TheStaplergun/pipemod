data:extend(
  {
    -- ONE TO ONE PIPES
    {
      type = "item",
      name = "80-overflow-valve",
      icon = "__base__/graphics/icons/pipe.png",
      icon_size = 32,
      flags = {"goes-to-quickbar"},
      subgroup = "pipes-to-ground",
      order = "c-a",
      place_result = "80-overflow-valve",
      stack_size = 50
    },
    -- ONE TO TWO PIPES
    {
      type = "item",
      name = "80-top-up-valve",
      icon = "__base__/graphics/icons/pipe.png",
      icon_size = 32,
      flags = {"goes-to-quickbar"},
      subgroup = "pipes-to-ground",
      order = "c-b",
      place_result = "80-top-up-valve",
      stack_size = 50
    },
    --[[{
      type = "item",
      name = "50-mini-flow-valve",
      icon = "__base__/graphics/icons/pipe.png",
      icon_size = 32,
      flags = {"goes-to-quickbar"},
      subgroup = "pipes-to-ground",
      order = "c-c",
      place_result = "50-mini-flow-valve",
      stack_size = 50
    },]]--
  }
)
