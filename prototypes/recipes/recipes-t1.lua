data:extend({
  -- ONE TO ONE PIPES
  {
    type = "recipe",
    name = "one-to-one-forward-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "small-pipe-coupler", amount = 1},
      {type = "item", name = "underground-pipe-segment-t1", amount = 5}
    },
	enabled = false,
    results = {{type="item", name="one-to-one-forward-pipe", amount=1}}
  },
  -- ONE TO TWO PIPES
  {
    type = "recipe",
    name = "one-to-two-perpendicular-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "small-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-t1", amount = 10},
    },
	enabled = false,
    results = {{type="item", name="one-to-two-perpendicular-pipe", amount=1}}
  },
  --[[{
    type = "recipe",
    name = "one-to-two-L-FL-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", 1},
      {type = "item", name = "swivel-joint", 1},
      {type = "item", name = "small-pipe-coupler", 2},
      {type = "item", name = "underground-pipe-segment-t1", 10},
    },
	enabled = false,
    results = {{type="item", name="one-to-two-L-FL-pipe", amount=1}}
  },]]--


  -- ONE TO THREE PIPES
  {
    type = "recipe",
    name = "one-to-three-forward-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "small-pipe-coupler", amount = 3},
      {type = "item", name = "underground-pipe-segment-t1", amount = 15},
    },
	enabled = false,
    results = {{type="item", name="one-to-three-forward-pipe", amount=1}}
  },

  -- ONE TO FOUR PIPE
  {
    type = "recipe",
    name = "one-to-four-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "small-pipe-coupler", amount = 4},
      {type = "item", name = "underground-pipe-segment-t1", amount = 20},
    },
	enabled = false,
    results = {{type="item", name="one-to-four-pipe", amount=1}}
  },
  -- UNDERGROUND I PIPES
  {
    type = "recipe",
    name = "underground-i-pipe",
    ingredients =
    {
      {type = "item", name = "small-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-t1", amount = 10},
    },
	enabled = false,
    results = {{type="item", name="underground-i-pipe", amount=1}}
  },
  -- UNDERGROUND L PIPES
  {
    type = "recipe",
    name = "underground-L-pipe",
    ingredients =
    {
      {type = "item", name = "small-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-t1", amount = 10},
    },
	enabled = false,
    results = {{type="item", name="underground-L-pipe", amount=1}}
  },
  -- UNDERGROUND T PIPES
  {
    type = "recipe",
    name = "underground-t-pipe",
    ingredients =
    {
      {type = "item", name = "small-pipe-coupler", amount = 3},
      {type = "item", name = "underground-pipe-segment-t1", amount = 15},
    },
	enabled = false,
    results = {{type="item", name="underground-t-pipe", amount=1}}
  },
  -- UNDERGROUND CROSS PIPES
  {
    type = "recipe",
    name = "underground-cross-pipe",
    ingredients =
    {
      {type = "item", name = "small-pipe-coupler", amount = 4},
      {type = "item", name = "underground-pipe-segment-t1", amount = 20},
    },
	enabled = false,
    results = {{type="item", name="underground-cross-pipe", amount=1}}
  },
})
