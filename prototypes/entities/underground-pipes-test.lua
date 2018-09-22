data:extend(
{
-- UNDERGROUND CROSS EXTENSION
{
  type = "pipe-to-ground",
  name = "underground-cross-pipe-test",
  icon = "__underground-pipe-pack__/graphics/icons/underground-cross.png",
  icon_size = 32,
  flags = {"placeable-neutral", "player-creation"},
  minable = {hardness = 0.2, mining_time = 0.5, result = "underground-cross-pipe-test"},
  max_health = 150,
  corpse = "small-remnants",
  resistances =
  {
    {
      type = "fire",
      percent = 80
    },
    {
      type = "impact",
      percent = 40
    }
},
fast_replaceable_group = "pipe-to-ground",
base_render_layer = "transport-belt",
  collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
collision_mask = {"water-tile"},
  selection_box = {{-1, -1}, {1, 1}},
selection_priority = 51,
  fluid_box =
  {
    base_area = 1,
    pipe_covers = _G.pipecoverspictures(),
    pipe_connections =
    {

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
    },
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
  pictures =
  {
    up =
    {
      filename = "__underground-pipe-pack__/graphics/entity/level-1/underground-cross-pipe.png",
      priority = "high",
      width = 64,
      height = 64, --, shift = {0.10, -0.04}
      hr_version =
      {
         filename = "__underground-pipe-pack__/graphics/entity/level-1/hr-underground-cross-pipe.png",
         priority = "extra-high",
         width = 128,
         height = 128,
         scale = 0.65
      }
    },
    down =
    {
      filename = "__underground-pipe-pack__/graphics/entity/level-1/underground-cross-pipe.png",
      priority = "high",
      width = 64,
      height = 64, --, shift = {0.05, 0}
      hr_version =
      {
         filename = "__underground-pipe-pack__/graphics/entity/level-1/hr-underground-cross-pipe.png",
         priority = "extra-high",
         width = 128,
         height = 128,
         scale = 0.65
      }
    },
    left =
    {
      filename = "__underground-pipe-pack__/graphics/entity/level-1/underground-cross-pipe.png",
      priority = "high",
      width = 64,
      height = 64, --, shift = {-0.12, 0.1}
      hr_version =
      {
         filename = "__underground-pipe-pack__/graphics/entity/level-1/hr-underground-cross-pipe.png",
         priority = "extra-high",
         width = 128,
         height = 128,
         scale = 0.65
      }
    },
    right =
    {
      filename = "__underground-pipe-pack__/graphics/entity/level-1/underground-cross-pipe.png",
      priority = "high",
      width = 64,
      height = 64, --, shift = {0.1, 0.1}
      hr_version =
      {
         filename = "__underground-pipe-pack__/graphics/entity/level-1/hr-underground-cross-pipe.png",
         priority = "extra-high",
         width = 128,
         height = 128,
         scale = 0.65
      }
    }
  }
},
})