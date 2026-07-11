local pipe = util.table.deepcopy(data.raw["pipe"]["pipe"])

pipe.name = "4-to-4-pipe"
pipe.icon = "__underground-pipe-pack__/graphics/icons/four-to-four-t1.png"
pipe.icon_size = 32
pipe.minable = {mining_time = 0.5, result = "4-to-4-pipe"}
pipe.fluid_box = {
  volume = 100,
  pipe_covers = _G.pipecoverspictures(),
  pipe_connections = {
    {
      direction = defines.direction.north,
      position = {0, 0},
      hide_connection_info = true,
    },
    {
      direction = defines.direction.east,
      position = {0, 0},
      hide_connection_info = true,
    },
    {
      direction = defines.direction.south,
      position = {0, 0},
      hide_connection_info = true,
    },
    {
      direction = defines.direction.west,
      position = {0, 0},
      hide_connection_info = true,
    },
    {
      connection_type = "underground",
      direction = defines.direction.north,
      position = {0, 0},
      max_underground_distance = 11,
      underground_collision_mask = underground_collision_mask,
      hide_connection_info = true,
    },
    {
      connection_type = "underground",
      direction = defines.direction.east,
      position = {0, 0},
      max_underground_distance = 11,
      underground_collision_mask = underground_collision_mask,
      hide_connection_info = true,
    },
    {
      connection_type = "underground",
      direction = defines.direction.south,
      position = {0, 0},
      max_underground_distance = 11,
      underground_collision_mask = underground_collision_mask,
      hide_connection_info = true,
    },
    {
      connection_type = "underground",
      direction = defines.direction.west,
      position = {0, 0},
      max_underground_distance = 11,
      underground_collision_mask = underground_collision_mask,
      hide_connection_info = true,
    },
  },
}

data:extend({pipe})
