data:extend({
  -- ONE TO ONE PIPES
  {
    type = "recipe",
    name = "one-to-one-forward-t2-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "medium-pipe-coupler", amount = 1},
      {type = "item", name = "underground-pipe-segment-t2", amount = 5}
    },
	enabled = false,
    results = {{type="item", name="one-to-one-forward-t2-pipe", amount=1}}
  },
  -- ONE TO TWO PIPES
  {
    type = "recipe",
    name = "one-to-two-perpendicular-t2-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "medium-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-t2", amount = 10},
    },
	enabled = false,
    results = {{type="item", name="one-to-two-perpendicular-t2-pipe", amount=1}}
  },
  --[[{
    type = "recipe",
    name = "one-to-two-L-FL-t2-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", 1},
      {type = "item", name = "swivel-joint", 1},
      {type = "item", name = "medium-pipe-coupler", 2},
      {type = "item", name = "underground-pipe-segment-t2", 10},
    },
	enabled = false,
    results = {{type="item", name="one-to-two-L-FL-t2-pipe", amount=1}}
  },]]--


  -- ONE TO THREE PIPES
  {
    type = "recipe",
    name = "one-to-three-forward-t2-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "swivel-joint", amount = 1},
      {type = "item", name = "medium-pipe-coupler", amount = 3},
      {type = "item", name = "underground-pipe-segment-t2", amount = 15},
    },
	enabled = false,
    results = {{type="item", name="one-to-three-forward-t2-pipe", amount=1}}
  },

  -- ONE TO FOUR PIPE
  {
    type = "recipe",
    name = "one-to-four-t2-pipe",
    ingredients =
    {
      {type = "item", name = "pipe", amount = 1},
      {type = "item", name = "medium-pipe-coupler", amount = 4},
      {type = "item", name = "underground-pipe-segment-t2", amount = 20},
    },
	enabled = false,
    results = {{type="item", name="one-to-four-t2-pipe", amount=1}}
  },
  -- UNDERGROUND I PIPES
  {
    type = "recipe",
    name = "underground-i-t2-pipe",
    ingredients =
    {
      {type = "item", name = "medium-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-t2", amount = 10},
    },
	enabled = false,
    results = {{type="item", name="underground-i-t2-pipe", amount=1}}
  },
  -- UNDERGROUND L PIPES
  {
    type = "recipe",
    name = "underground-L-t2-pipe",
    ingredients =
    {
      {type = "item", name = "medium-pipe-coupler", amount = 2},
      {type = "item", name = "underground-pipe-segment-t2", amount = 10},
    },
	enabled = false,
    results = {{type="item", name="underground-L-t2-pipe", amount=1}}
  },
  -- UNDERGROUND T PIPES
  {
    type = "recipe",
    name = "underground-t-t2-pipe",
    ingredients =
    {
      {type = "item", name = "medium-pipe-coupler", amount = 3},
      {type = "item", name = "underground-pipe-segment-t2", amount = 15},
    },
	enabled = false,
    results = {{type="item", name="underground-t-t2-pipe", amount=1}}
  },
  -- UNDERGROUND CROSS PIPES
  {
    type = "recipe",
    name = "underground-cross-t2-pipe",
    ingredients =
    {
      {type = "item", name = "medium-pipe-coupler", amount = 4},
      {type = "item", name = "underground-pipe-segment-t2", amount = 20},
    },
	enabled = false,
    results = {{type="item", name="underground-cross-t2-pipe", amount=1}}
  },
})
