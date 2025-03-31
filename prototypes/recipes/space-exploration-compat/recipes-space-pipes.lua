data:extend({
  {
    type = "recipe",
    name = "underground-pipe-segment-space",
    ingredients =
    {
      {type = "item", name = "underground-pipe-segment-t1", amount = 1},
      {type = "item", name = "copper-cable", amount = 2 },
      {type = "item", name = "se-heavy-girder", amount = 1},
      {type = "item", name = "plastic-bar",amount =  1 },
      {type = "item", name = "glass", amount = 1 },
    },
    enabled = false,
    results = {{type="item", name="underground-pipe-segment-space", amount=1}}
  },
})

data:extend({
  {
    type = "recipe",
    name = "space-pipe-coupler",
    ingredients =
    {
      {type = "item", name = "small-pipe-coupler", amount = 1},
      {type = "item", name = "copper-cable", amount = 2 },
      {type = "item", name = "se-heavy-girder", amount = 1},
      {type = "item", name = "plastic-bar", amount = 1 },
    },
    enabled = false,
    results = {{type="item", name="space-pipe-coupler", amount=1}}
},
})


data:extend({
  -- ONE TO ONE PIPES
  {
    type = "recipe",
    name = "one-to-one-forward-space-pipe",
    ingredients =
    {
      {type = "item", name = "se-space-pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "space-pipe-coupler", amount = 1},
      {type = "item", name = "underground-pipe-segment-space", amount = 5}
    },
    enabled = false,
    results = {{type="item", name="one-to-one-forward-space-pipe", amount=1}}
  },
  -- ONE TO TWO PIPES
  {
    type = "recipe",
    name = "one-to-two-perpendicular-space-pipe",
    ingredients =
    {
      {type = "item", name = "se-space-pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "space-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-space", amount = 10},
    },
    enabled = false,
    results = {{type="item", name="one-to-two-perpendicular-space-pipe", amount=1}}
  },
  --[[{
    type = "recipe",
    name = "one-to-two-L-FL-space-pipe",
    ingredients =
    {
      {type = "item", name = "se-space-pipe", 1},
      {type = "item", name = "swivel-joint", 1},
      {type = "item", name = "space-pipe-coupler", 2},
      {type = "item", name = "underground-pipe-segment-space", 10},
    },
    enabled = false,
    results = {{type="item", name="one-to-two-L-FL-space-pipe", amount=1}}
  },]]--


  -- ONE TO THREE PIPES
  {
    type = "recipe",
    name = "one-to-three-forward-space-pipe",
    ingredients =
    {
      {type = "item", name = "se-space-pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "space-pipe-coupler", amount = 3},
      {type = "item", name = "underground-pipe-segment-space", amount = 15},
    },
    enabled = false,
    results = {{type="item", name="one-to-three-forward-space-pipe", amount=1}}
  },

  -- ONE TO FOUR PIPE
  {
    type = "recipe",
    name = "one-to-four-space-pipe",
    ingredients =
    {
      {type = "item", name = "se-space-pipe", amount = 1},
      {type = "item", name = "space-pipe-coupler", amount = 4},
      {type = "item", name = "underground-pipe-segment-space", amount = 20},
    },
    enabled = false,
    results = {{type="item", name="one-to-four-space-pipe", amount=1}}
  },
  -- UNDERGROUND I PIPES
  {
    type = "recipe",
    name = "underground-i-space-pipe",
    ingredients =
    {
      {type = "item", name = "space-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-space", amount = 10},
    },
    enabled = false,
    results = {{type="item", name="underground-i-space-pipe", amount=1}}
  },
  -- UNDERGROUND L PIPES
  {
    type = "recipe",
    name = "underground-L-space-pipe",
    ingredients =
    {
      {type = "item", name = "space-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-space", amount = 10},
    },
    enabled = false,
    results = {{type="item", name="underground-L-space-pipe", amount=1}}
  },
  -- UNDERGROUND T PIPES
  {
    type = "recipe",
    name = "underground-t-space-pipe",
    ingredients =
    {
      {type = "item", name = "space-pipe-coupler", amount = 3},
      {type = "item", name = "underground-pipe-segment-space", amount = 15},
    },
    enabled = false,
    results = {{type="item", name="underground-t-space-pipe", amount=1}}
  },
  -- UNDERGROUND CROSS PIPES
  {
    type = "recipe",
    name = "underground-cross-space-pipe",
    ingredients =
    {
      {type = "item", name = "space-pipe-coupler", amount = 4},
      {type = "item", name = "underground-pipe-segment-space", amount = 20},
    },
    enabled = false,
    results = {{type="item", name="underground-cross-space-pipe", amount=1}}
  },
  -- UNDERGROUND BUILDINGS
  {
    type = "recipe",
    name = "underground-space-pump",
    ingredients =
    {
      {type = "item", name = "engine-unit", amount = 1},
      {type = "item", name = "se-heavy-girder", amount = 1},
      {type = "item", name = "space-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-space", amount = 10},
    },
    enabled = false,
    results = {{type="item", name="underground-space-pump", amount=1}}
  },
})
