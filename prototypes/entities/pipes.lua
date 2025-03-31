local pipes = {}
local pipe = util.table.deepcopy(data.raw["pipe"]["pipe"])
pipe.name = "4-to-4-pipe"
pipe.minable = {hardness = 0.2, mining_time = 0.5, result = "4-to-4-pipe"}
pipe.underground_collision_mask = underground_collision_mask
pipe.fluid_box = {
  volume = 100,
  pipe_covers = _G.pipecoverspictures(),
  hide_connection_info = true,
  pipe_connections =
  {
    { 
      direction = defines.direction.north,
      position = {0, 0}
    },
    { 
      direction = defines.direction.east,
      position = {0, 0}
    },
    { 
      direction = defines.direction.south,
      position = {0, 0}
    },
    { 
      direction = defines.direction.west,
      position = {0, 0}
    },
    {
      underground_collision_mask = underground_collision_mask,
      connection_type = "underground",
      direction = defines.direction.north,
      position = {0, 0},
      max_underground_distance = 11
    },
    {
      underground_collision_mask = underground_collision_mask,
      connection_type = "underground",
      direction = defines.direction.east,
      position = {0, 0},
      max_underground_distance = 11
    },
    {
      underground_collision_mask = underground_collision_mask,
      connection_type = "underground",
      direction = defines.direction.south,
      position = {0, 0},
      max_underground_distance = 11
    },
    {
      underground_collision_mask = underground_collision_mask,
      connection_type = "underground",
      direction = defines.direction.west,
      position = {0, 0},
      max_underground_distance = 11
    },
  }
}
pipes[#pipes + 1] = pipe
data:extend(pipes)
--[[data:extend(
{
  {
    type = "pipe",
    name = "4-to-4-pipe",
    clamped = true,
    icon = "__underground-pipe-pack__/graphics/icons/four-to-four-t1.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "4-to-4-pipe"},
    max_health = 100,
    corpse = "small-remnants",
    se_allow_in_space = false,
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
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} },
		{
          position = {0, -1},
          max_underground_distance = 11
        },
        {
          position = {0, 1},
          max_underground_distance = 11
        },
        {
          position = {1, 0},
          max_underground_distance = 11
        },
        {
          position = {-1, 0},
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
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures = _G.pipepictures(),
    working_sound = sounds.pipe,

    horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
  },
})
]]--