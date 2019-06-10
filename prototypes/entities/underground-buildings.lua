local levels = {
  [1] = '-t1',
  [2] = '-t2',
  [3] = '-t3'
}

local base_ug_distance = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance)

local underground_pumps = {
  'underground-mini-pump'
}

for level_int , tier in pairs(levels) do
  local new_pump = util.table.deepcopy(data.raw['pump']['pump'])
  new_pump.name = 'underground-mini-pump' .. tier
  new_pump.icon = "__underground-pipe-pack__/graphics/icons/underground-mini-pump" .. tier .. ".png"
  new_pump.minable.result = 'underground-mini-pump' .. tier
  new_pump.fast_replaceable_group = "pipe-to-ground"
  new_pump.collision_box = {{-0.29, -0.29}, {0.29, 0.29}}
	new_pump.collision_mask = {"water-tile"}
  new_pump.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
  new_pump.selection_priority = 51
  new_pump.fluid_box.pipe_connections =
  {
    {
      position = {0, -1},
      type="output",
      max_underground_distance = (base_ug_distance + 1) * level_int
    },
    {
      position = {0, 1},
      type="input",
      max_underground_distance = (base_ug_distance + 1) * level_int
    }
  }
  new_pump.energy_usage = 30 + ( 15 * level_int ) .. "kW"
end

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
			    max_underground_distance = 33
        },
        {
          position = {0, 1},
          type="input",
          max_underground_distance = 33
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
        filename = "__underground-pipe-pack__/graphics/entity/minipump/lr-minipump-north.png",
        width = 48,
        height = 48,
        line_length =8,
        frame_count =64,
        animation_speed = 1.0,
        shift = {0,0.1875},
        hr_version =
        {
          filename = "__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-north.png",
          width = 96,
          height = 96,
          scale = 0.5,
          line_length =8,
          frame_count =64,
          animation_speed = 1.0,
          shift = {0,0.1875},
        }
      },
      east =
      {
        filename = "__underground-pipe-pack__/graphics/entity/minipump/lr-minipump-east.png",
        width = 48,
        height = 48,
        line_length =8,
        frame_count =64,
        animation_speed = 1.0,
        shift = {0,0.1875},
        hr_version =
        {
          filename = "__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-east.png",
          width = 96,
          height = 96,
          scale = 0.5,
          line_length =8,
          frame_count =64,
          animation_speed = 1.0,
          shift = {0,0.1875},
        }
      },

      south =
      {
        filename = "__underground-pipe-pack__/graphics/entity/minipump/lr-minipump-south.png",
        width = 48,
        height = 48,
        line_length =8,
        frame_count =64,
        animation_speed = 1.0,
        shift = {0,0.1875},
        hr_version =
        {
          filename = "__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-south.png",
          width = 96,
          height = 96,
          scale = 0.5,
          line_length =8,
          frame_count =64,
          animation_speed = 1.0,
          shift = {0,0.1875},
        }
      },
      west =
      {
        filename = "__underground-pipe-pack__/graphics/entity/minipump/lr-minipump-west.png",
        width = 48,
        height = 48,
        line_length =8,
        frame_count =64,
        animation_speed = 1.0,
        shift = {0,0.1875},
        hr_version =
        {
          filename = "__underground-pipe-pack__/graphics/entity/minipump/hr-minipump-west.png",
          width = 96,
          height = 96,
          scale = 0.5,
          line_length =8,
          frame_count =64,
          animation_speed = 1.0,
          shift = {0,0.1875},
        }
      }
    },
  },
})
