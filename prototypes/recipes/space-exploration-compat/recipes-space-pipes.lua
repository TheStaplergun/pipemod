data:extend({
  {
    type = "recipe",
    name = "underground-pipe-segment-space",
    ingredients =
    {
      {"underground-pipe-segment-t1", 1},
      {"copper-cable", 2 },
      {"se-heavy-girder", 1},
      {"plastic-bar", 1 },
      {"glass", 1 },
    },
    enabled = false,
    result = "underground-pipe-segment-space"
  },
})

data:extend({
  {
    type = 'recipe',
    name = 'space-pipe-coupler',
    ingredients =
    {
      {'small-pipe-coupler', 1},
      {"copper-cable", 2 },
      {"se-heavy-girder", 1},
      {"plastic-bar", 1 },
    },
    enabled = false,
    result = 'space-pipe-coupler'
},
})


data:extend({
  -- ONE TO ONE PIPES
  {
    type = "recipe",
    name = "one-to-one-forward-space-pipe",
    ingredients =
    {
      {"se-space-pipe", 1},
      {"swivel-joint", 1},
      {"space-pipe-coupler", 1},
      {"underground-pipe-segment-space", 5}
    },
    enabled = false,
    result = "one-to-one-forward-space-pipe"
  },
  -- ONE TO TWO PIPES
  {
    type = "recipe",
    name = "one-to-two-perpendicular-space-pipe",
    ingredients =
    {
      {"se-space-pipe", 1},
      {"swivel-joint", 1},
      {"space-pipe-coupler", 2},
      {"underground-pipe-segment-space", 10},
    },
    enabled = false,
    result = "one-to-two-perpendicular-space-pipe"
  },
  --[[{
    type = "recipe",
    name = "one-to-two-L-FL-space-pipe",
    ingredients =
    {
      {"se-space-pipe", 1},
      {"swivel-joint", 1},
      {"space-pipe-coupler", 2},
      {"underground-pipe-segment-space", 10},
    },
    enabled = false,
    result = "one-to-two-L-FL-space-pipe"
  },]]--


  -- ONE TO THREE PIPES
  {
    type = "recipe",
    name = "one-to-three-forward-space-pipe",
    ingredients =
    {
      {"se-space-pipe", 1},
      {"swivel-joint", 1},
      {"space-pipe-coupler", 3},
      {"underground-pipe-segment-space", 15},
    },
    enabled = false,
    result = "one-to-three-forward-space-pipe"
  },

  -- ONE TO FOUR PIPE
  {
    type = "recipe",
    name = "one-to-four-space-pipe",
    ingredients =
    {
      {"se-space-pipe", 1},
      {"space-pipe-coupler", 4},
      {"underground-pipe-segment-space", 20},
    },
    enabled = false,
    result = "one-to-four-space-pipe"
  },
  -- UNDERGROUND I PIPES
  {
    type = "recipe",
    name = "underground-i-space-pipe",
    ingredients =
    {
      {"space-pipe-coupler", 2},
      {"underground-pipe-segment-space", 10},
    },
    enabled = false,
    result = "underground-i-space-pipe"
  },
  -- UNDERGROUND L PIPES
  {
    type = "recipe",
    name = "underground-L-space-pipe",
    ingredients =
    {
      {"space-pipe-coupler", 2},
      {"underground-pipe-segment-space", 10},
    },
    enabled = false,
    result = "underground-L-space-pipe"
  },
  -- UNDERGROUND T PIPES
  {
    type = "recipe",
    name = "underground-t-space-pipe",
    ingredients =
    {
      {"space-pipe-coupler", 3},
      {"underground-pipe-segment-space", 15},
    },
    enabled = false,
    result = "underground-t-space-pipe"
  },
  -- UNDERGROUND CROSS PIPES
  {
    type = "recipe",
    name = "underground-cross-space-pipe",
    ingredients =
    {
      {"space-pipe-coupler", 4},
      {"underground-pipe-segment-space", 20},
    },
    enabled = false,
    result = "underground-cross-space-pipe"
  },
  -- UNDERGROUND BUILDINGS
  {
    type = "recipe",
    name = "underground-space-pump",
    ingredients =
    {
      {"engine-unit", 1},
      {"se-heavy-girder", 1},
      {"space-pipe-coupler", 2},
      {"underground-pipe-segment-space", 10},
    },
    enabled = false,
    result = "underground-space-pump"
  },
})
