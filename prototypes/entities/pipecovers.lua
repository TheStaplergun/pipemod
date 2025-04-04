_G.tierpipecoverspictures = function(level)
  return {
    north =
    {
      layers =
      {
        {
          filename = "__underground-pipe-pack__/graphics/entity/level-" .. level .. "/pipe-covers/hr-pipe-cover-north.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    east =
    {
      layers =
      {
        {
          filename = "__underground-pipe-pack__/graphics/entity/level-" .. level .. "/pipe-covers/hr-pipe-cover-east.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    south =
    {
      layers =
      {
        {
          filename = "__underground-pipe-pack__/graphics/entity/level-" .. level .. "/pipe-covers/hr-pipe-cover-south.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    west =
    {
      layers =
      {
        {
          filename = "__underground-pipe-pack__/graphics/entity/level-" .. level .. "/pipe-covers/hr-pipe-cover-west.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }
end
