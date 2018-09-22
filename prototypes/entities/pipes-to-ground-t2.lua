data:extend(
{
  -- ONE TO ONE PIPES
  {
    type = "pipe-to-ground",
    name = "one-to-one-forward-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-1.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-one-forward-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = 22
        },
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-forward-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-forward-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-forward-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-forward-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-forward-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-forward-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-forward-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-forward-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  {
    type = "pipe-to-ground",
    name = "one-to-one-right-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-1.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-one-forward-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {-1, 0},
          max_underground_distance = 22
        },
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-right-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-right-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-right-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-right-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-right-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-right-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-right-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-right-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  {
    type = "pipe-to-ground",
    name = "one-to-one-reverse-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-1.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-one-forward-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, -1},
          max_underground_distance = 22
        },
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-reverse-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-reverse-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-reverse-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-reverse-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-reverse-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-reverse-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-reverse-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-reverse-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  {
    type = "pipe-to-ground",
    name = "one-to-one-left-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-1.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-one-forward-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {1, 0},
          max_underground_distance = 22
        },
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-left-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-left-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-left-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-left-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-left-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-left-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-one-left-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-one-left-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  -- ONE TO TWO PIPES
  {
    type = "pipe-to-ground",
    name = "one-to-two-parallel-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-2-parallel-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-two-perpendicular-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, -1},
          max_underground_distance = 22
        },
        {
          position = {0, 1},
          max_underground_distance = 22
        },
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-parallel-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-parallel-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-parallel-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-parallel-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-parallel-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-parallel-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-parallel-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-parallel-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  {
    type = "pipe-to-ground",
    name = "one-to-two-perpendicular-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-2-parallel-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-two-perpendicular-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {1, 0},
          max_underground_distance = 22
        },
        {
          position = {-1, 0},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-perpendicular-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-perpendicular-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-perpendicular-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-perpendicular-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-perpendicular-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-perpendicular-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-perpendicular-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-perpendicular-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },

  {
    type = "pipe-to-ground",
    name = "one-to-two-L-FL-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-2-L-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-two-L-FL-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {1, 0},
          max_underground_distance = 22
        },
        {
          position = {0, 1},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-FL-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-FL-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-FL-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-FL-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-FL-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-FL-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-FL-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-FL-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },

  {
    type = "pipe-to-ground",
    name = "one-to-two-L-FR-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-2-L-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-two-L-FL-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {-1, 0},
          max_underground_distance = 22
        },
        {
          position = {0, 1},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-FR-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-FR-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-FR-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-FR-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-FR-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-FR-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-FR-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-FR-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  {
    type = "pipe-to-ground",
    name = "one-to-two-L-RR-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-2-L-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-two-L-FL-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {-1, 0},
          max_underground_distance = 22
        },
        {
          position = {0, -1},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-RR-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-RR-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-RR-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-RR-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-RR-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-RR-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-RR-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-RR-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  {
    type = "pipe-to-ground",
    name = "one-to-two-L-RL-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-2-L-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-two-L-FL-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {1, 0},
          max_underground_distance = 22
        },
        {
          position = {0, -1},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-RL-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-RL-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-RL-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-RL-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-RL-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-RL-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-two-L-RL-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-two-L-RL-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  -- ONE TO THREE PIPES
  {
    type = "pipe-to-ground",
    name = "one-to-three-forward-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-3-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-three-forward-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = 22
        },
        {
          position = {1, 0},
          max_underground_distance = 22
        },
        {
          position = {-1, 0},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-forward-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-forward-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-forward-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-forward-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-forward-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-forward-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-forward-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-forward-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
    {
    type = "pipe-to-ground",
    name = "one-to-three-right-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-3-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-three-forward-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = 22
        },
        {
          position = {0, -1},
          max_underground_distance = 22
        },
        {
          position = {-1, 0},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-right-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-right-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-right-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-right-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-right-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-right-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-right-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-right-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
    {
    type = "pipe-to-ground",
    name = "one-to-three-reverse-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-3-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-three-forward-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {1, 0},
          max_underground_distance = 22
        },
        {
          position = {0, -1},
          max_underground_distance = 22
        },
        {
          position = {-1, 0},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-reverse-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-reverse-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-reverse-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-reverse-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-reverse-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-reverse-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-reverse-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-reverse-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
    {
    type = "pipe-to-ground",
    name = "one-to-three-left-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-3-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-three-forward-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {1, 0},
          max_underground_distance = 22
        },
        {
          position = {0, -1},
          max_underground_distance = 22
        },
        {
          position = {0, 1},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-left-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-left-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-left-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-left-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-left-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-left-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-three-left-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-three-left-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
  -- THE LONELY FOURWAY
  {
    type = "pipe-to-ground",
    name = "one-to-four-t2-pipe",
    icon = "__underground-pipe-pack__/graphics/icons/1-to-4-t2.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "one-to-four-t2-pipe"},
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
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = _G.pipecoverspicturest2(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, -1},
          max_underground_distance = 22
        },
        {
          position = {0, 1},
          max_underground_distance = 22
        },
        {
          position = {1, 0},
          max_underground_distance = 22
        },
        {
          position = {-1, 0},
          max_underground_distance = 22
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
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-four-pipe-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-four-pipe-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-four-pipe-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-four-pipe-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-four-pipe-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-four-pipe-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__underground-pipe-pack__/graphics/entity/level-2/one-to-four-pipe-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__underground-pipe-pack__/graphics/entity/level-2/hr-one-to-four-pipe-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      }
    }
  },
})