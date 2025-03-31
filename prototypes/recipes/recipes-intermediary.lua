data:extend({
  -- Couplers
  {
    type = "recipe",
    name = "small-pipe-coupler",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
    },
	enabled = false,
    results = {{type="item", name="small-pipe-coupler", amount=1}}
  },
  {
    type = "recipe",
    name = "medium-pipe-coupler",
    ingredients =
    {
      {type = "item", name = "small-pipe-coupler", amount = 1},
      {type = "item", name = "iron-plate", amount = 1},
    },
	enabled = false,
    results = {{type="item", name="medium-pipe-coupler", amount=1}}
  },
  {
    type = "recipe",
    name = "large-pipe-coupler",
    ingredients =
    {
      {type = "item", name = "medium-pipe-coupler", amount = 1},
      {type = "item", name = "steel-plate", amount = 1},
    },
	enabled = false,
    results = {{type="item", name="large-pipe-coupler", amount=1}}
  },

  --Swivel Joint

  {
    type = "recipe",
    name = "swivel-joint",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
      {type = "item", name = "iron-gear-wheel", amount = 1},
    },
	enabled = false,
    results = {{type="item", name="swivel-joint", amount=1}}
  },

  -- Segments

  {
    type = "recipe",
    name = "underground-pipe-segment-t1",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
    },
	enabled = false,
    results = {{type="item", name="underground-pipe-segment-t1", amount=1}}
  },
  {
    type = "recipe",
    name = "underground-pipe-segment-t2",
    ingredients =
    {
      {type = "item", name = "underground-pipe-segment-t1", amount = 1},
      {type = "item", name = "iron-plate", amount = 2},
    },
	enabled = false,
    results = {{type="item", name="underground-pipe-segment-t2", amount=1}}
  },
  {
    type = "recipe",
    name = "underground-pipe-segment-t3",
    ingredients =
    {
      {type = "item", name = "underground-pipe-segment-t2", amount = 1},
      {type = "item", name = "steel-plate", amount = 2},
    },
	enabled = false,
    results = {{type="item", name="underground-pipe-segment-t3", amount=1}}
  },
})
