local valve_table =
{
  overflow = {
    ['10'] = 0.1,
    ['20'] = 0.2,
    ['30'] = 0.3,
    ['40'] = 0.4,
    ['50'] = 0.5,
    ['60'] = 0.6,
    ['70'] = 0.7,
    ['80'] = 0.8,
    ['90'] = 0.9,
    ['100'] = 0.99,
  },
  top_up = {
    ['10'] = -0.9,
    ['20'] = -0.8,
    ['30'] = -0.7,
    ['40'] = -0.6,
    ['50'] = -0.5,
    ['60'] = -0.4,
    ['70'] = -0.3,
    ['80'] = -0.2,
    ['90'] = -0.1,
  },
  mini_flow = {
    ['10'] = 0.1,
    ['20'] = 0.2,
    ['30'] = 0.3,
    ['40'] = 0.4,
    ['50'] = 0.5,
    ['60'] = 0.6,
    ['70'] = 0.7,
    ['80'] = 0.8,
    ['90'] = 0.9,
  },
}



pipe_elbow = util.table.deepcopy(data.raw["storage-tank"]["storage-tank"])
pipe_elbow.name = "pipe-elbow"
pipe_elbow.icon = "__Flow Control__/graphics/icon/pipe-elbow.png"
pipe_elbow.minable = data.raw["pipe"]["pipe"].minable
pipe_elbow.corpse = "small-remnants"
pipe_elbow.max_health = data.raw["pipe"]["pipe"].max_health
pipe_elbow.resistances = data.raw["pipe"]["pipe"].resistances
pipe_elbow.fast_replaceable_group = data.raw["pipe"]["pipe"].fast_replaceable_group
pipe_elbow.collision_box = data.raw["pipe"]["pipe"].collision_box
pipe_elbow.selection_box = data.raw["pipe"]["pipe"].selection_box
pipe_elbow.fluid_box =
{
  base_area = 1,
  pipe_covers = _G.pipecoverspictures(),
  pipe_connections =
  {
    { position = {1, 0} },
    { position = {0, 1} }
  },
}
pipe_elbow.two_direction_only = false
pipe_elbow.pictures =
{
  picture =
  {
    north = pipepictures().corner_down_right,
    east = pipepictures().corner_down_left,
    south = pipepictures().corner_up_left,
    west = pipepictures().corner_up_right
  },
  gas_flow = empty_sprite,
  fluid_background = empty_sprite,
  window_background = empty_sprite,
  flow_sprite = empty_sprite
}
pipe_elbow.circuit_wire_max_distance = 0
pipe_elbow.working_sound = nil
