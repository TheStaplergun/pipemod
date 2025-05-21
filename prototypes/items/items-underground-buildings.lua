local tints = {
    blue = {r=38/255,g=173/255,b=227/255,a=1},
    red = {r=227/255,g=38/255,b=45/255,a=1},
    yellow = {r=255/255,g=191/255,b=0/255,a=1}
}

data:extend(
  {
    -- UNDERGROUND BUILDINGS
    {
      type = "item",
      name = "underground-mini-pump",
      icons = {
        {
          icon = "__underground-pipe-pack__/graphics/icons/underground-mini-pump.png",
          icon_size = 32,
        },
        {
          icon = "__underground-pipe-pack__/graphics/icons/hr-underground-metal-mask.png",
          icon_size = 96,
          scale = 1/2,
          tint = tints.yellow,
          floating = true
        },
      },
      --icon_size = 32,
      flags = nil,
      subgroup = "underground-buildings",
      order = "a-a",
      place_result = "underground-mini-pump",
      stack_size = 50
    },
    {
      type = "item",
      name = "underground-mini-pump-t2",
      icons = {
        {
          icon = "__underground-pipe-pack__/graphics/icons/underground-mini-pump.png",
          icon_size = 32,
        },
        {
          icon = "__underground-pipe-pack__/graphics/icons/hr-underground-metal-mask.png",
          icon_size = 96,
          scale = 1/2,
          tint = tints.red,
          floating = true
        },
      },
      --icon_size = 32,
      flags = nil,
      subgroup = "underground-buildings",
      order = "a-b",
      place_result = "underground-mini-pump-t2",
      stack_size = 50
    },
    {
      type = "item",
      name = "underground-mini-pump-t3",
      icons = {
        {
          icon = "__underground-pipe-pack__/graphics/icons/underground-mini-pump.png",
          icon_size = 32,
        },
        {
          icon = "__underground-pipe-pack__/graphics/icons/hr-underground-metal-mask.png",
          icon_size = 96,
          scale = 1/2,
          tint = tints.blue,
          floating = true
        },
      },
      --icon_size = 32,
      flags = nil,
      subgroup = "underground-buildings",
      order = "a-c",
      place_result = "underground-mini-pump-t3",
      stack_size = 50
    },
  }
)
