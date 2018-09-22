data:extend(
  {
	  {
    type = "pump",
    name = "underground-mini-pump",
    icon = "__underground-pipe-pack__/graphics/icons/underground-mini-pump.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "underground-mini-pump"},
    max_health = 180,
    fast_replaceable_group = "pipe-to-ground",
    corpse = "small-remnants",
	base_render_layer = "transport-belt",
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
	collision_mask = {"water-tile"},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	selection_priority = 51,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    fluid_box =
    {
      base_area = 1,
      height = 1,
      pipe_covers = _G.pipecoverspictures(),
      pipe_connections =
      {
        {
			position = {0, -1},
			type="output",
			max_underground_distance = 11
		},
        {
			position = {0, 1},
			type="input",
			max_underground_distance = 11
		}
      }
    },
	underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.01 / 2.5
    },
    energy_usage = "45kW",
    pumping_speed = 200,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    animations =
    {
      north =
      {
        filename = "__underground-pipe-pack__/graphics/entity/minipump/underground-mini-pump.png",
        width = 68,
        height = 53,
		scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 1.0,
        --shift = util.by_pixel(8.000, 7.500),
        hr_version =
        {
          filename = "__underground-pipe-pack__/graphics/entity/minipump/hr-underground-mini-pump.png",
          width = 135,
          height = 105,
          scale = 0.25,
          line_length =8,
          frame_count =32,
          animation_speed = 1.0,
          --shift = util.by_pixel(8, 3.5) -- {0.515625, 0.21875}
        }
      },
      east =
      {
        filename = "__underground-pipe-pack__/graphics/entity/minipump/underground-mini-pump.png",
        width = 68,
        height = 53,
		scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 1.0,
        --shift = util.by_pixel(0, 4),
        hr_version =
        {
          filename = "__underground-pipe-pack__/graphics/entity/minipump/hr-underground-mini-pump.png",
          width = 135,
          height = 105,
          scale = 0.25,
          line_length =8,
          frame_count =32,
          animation_speed = 1.0,
          --shift = util.by_pixel(-0.5, 1.75) --{-0.03125, 0.109375}
        }
      },

      south =
      {
        filename = "__underground-pipe-pack__/graphics/entity/minipump/underground-mini-pump.png",
        width = 68,
        height = 53,
		scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 1.0,
        --shift = util.by_pixel(13.5, 0.5),
        hr_version =
        {
          filename = "__underground-pipe-pack__/graphics/entity/minipump/hr-underground-mini-pump.png",
          width = 135,
          height = 105,
          scale = 0.25,
          line_length =8,
          frame_count =32,
          animation_speed = 1.0,
          --shift = util.by_pixel(12.5, -8) -- {0.75, -0.5}
        }
      },
      west =
      {
        filename = "__underground-pipe-pack__/graphics/entity/minipump/underground-mini-pump.png",
        width = 68,
        height = 53,
		scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 1.0,
        --shift = util.by_pixel(0.5, -0.5),
        hr_version =
        {
          filename = "__underground-pipe-pack__/graphics/entity/minipump/hr-underground-mini-pump.png",
          width = 135,
          height = 105,
          scale = 0.25,
          line_length =8,
          frame_count =32,
          animation_speed = 1.0,
          --shift = util.by_pixel(-0.25, 1.25) -- {-0.015625, 0.078125}
        }
      }
    },
  },
})