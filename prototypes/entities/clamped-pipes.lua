--[[local empty_sprite =
{
  filename = "__core__/graphics/empty.png",
  priority = "extra-high",
  width = 1,
  height = 1,
  frame_count = 1
}]]--

local nameTable = {
  ["-clamped-EW"] = {
    positions = {
      { position = {1, 0} },
      { position = {-1, 0} },
    },
    --picture = "straight_horizontal",
  },
  ["-clamped-NW"] = {
    positions = {
      { position = {0, -1} },
      { position = {-1, 0} },
    },
    --picture = "corner_up_left",
  },
  ["-clamped-NE"] = {
    positions = {
      { position = {0, -1} },
      { position = {1, 0} },
    },
    --picture = "corner_up_right"
  },
  ["-clamped-NEW"] = {
    positions = {
      { position = {0, -1} },
      { position = {1, 0} },
      { position = {-1, 0} },
    },
    --picture = "t_up",
  },
  ["-clamped-SW"] = {
    positions = {
      { position = {0, 1} },
      { position = {-1, 0} },
    },
    --picture = "corner_down_left",
  },
  ["-clamped-SE"] = {
    positions = {
      { position = {0, 1} },
      { position = {1, 0} },
    },
    --picture = "corner_down_right",
  },
  ["-clamped-SEW"] = {
    positions = {
      { position = {0, 1} },
      { position = {1, 0} },
      { position = {-1, 0} },
    },
    --picture = "t_down",
  },
  ["-clamped-NS"] = {
    positions = {
      { position = {0, -1} },
      { position = {0, 1} },
    },
    --picture = "straight_vertical",
  },
  ["-clamped-NSW"] = {
    positions = {
      { position = {0, -1} },
      { position = {0, 1} },
      { position = {-1, 0} },
    },
    --picture = "t_left",
  },
  ["-clamped-NSE"] = {
    positions = {
      { position = {0, -1} },
      { position = {0, 1} },
      { position = {1, 0} },
    },
    --picture = "t_right",
  },
  --[[["-clamped-NSEW"] = {
    positions = {
      { position = {0, -1} },
      { position = {1, 0} },
      { position = {0, 1} },
      { position = {-1, 0} },
    },
    picture = "cross",
  },]]--
}

for i,pipe in pairs(data.raw["pipe"]) do
  for names, _ in pairs(nameTable) do
    local clampedName = pipe.name .. names
    if not string.match(pipe.name, "%-clamped%-") and not string.match(pipe.name, "dummy%-") and pipe.name ~= "4-to-4-pipe" then
      local currentEntity = util.table.deepcopy(data.raw["pipe"]["pipe"])
      --data.raw["pipe"][pipe.name]
      currentEntity.name = clampedName
      if pipe.localised_name then
      currentEntity.localised_name = pipe.localised_name .. " clamped"
      end
      currentEntity.icon = data.raw["pipe"][pipe.name].icon or util.table.deepcopy(data.raw["pipe"]["pipe"].icon)
      currentEntity.minable = data.raw["pipe"][pipe.name].minable
      currentEntity.flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"}
      currentEntity.corpse = "small-remnants"
      currentEntity.max_health = data.raw["pipe"][pipe.name].max_health
      currentEntity.resistances = data.raw["pipe"][pipe.name].resistances
      currentEntity.fast_replaceable_group = data.raw["pipe"][pipe.name].fast_replaceable_group
      currentEntity.collision_box = data.raw["pipe"][pipe.name].collision_box
      currentEntity.selection_box = data.raw["pipe"][pipe.name].selection_box
      --[[local currentFluidBox = util.table.deepcopy(pipe.fluid_box)
      local pipeCovers = currentFluidBox.pipe_covers or pipecoverspictures()]]--
      currentEntity.fluid_box = {
        base_area = 1,
        --pipe_covers = pipeCovers,
        pipe_connections = nameTable[names].positions
      }
      currentEntity.two_direction_only = false
      --[[local pictureSet = util.table.deepcopy(data.raw["pipe"][pipe.name].pictures)
      local currentPicture = pictureSet[nameTable[names].picture] ]]--
      local dontChange = {
        gas_flow = true,
        fluid_background = true,
        window_background = true,
        flow_sprite = true,
      }
      local pictureSet = util.table.deepcopy(data.raw["pipe"][pipe.name].pictures)
      for pictureName, pictureStuff in pairs(pictureSet) do
        if not dontChange[pictureName] then
          local currentLayerData = pictureSet[pictureName]
          pictureSet[pictureName] = {
            layers = {
              currentLayerData,
              {
                filename = "__underground-pipe-pack__/graphics/icons/lock.png",
                priority = "extra-high",
                width = 32,
                height = 32,
                scale = 0.8,
                shift = util.by_pixel(0, -5),
                hr_version =
                {
                  filename = "__underground-pipe-pack__/graphics/icons/hr-lock.png",
                  priority = "extra-high",
                  width = 64,
                  height = 64,
                  scale = 0.4,
                  shift = util.by_pixel(0, -5)
                }
              },
            }
          }
        end
      end
      currentEntity.pictures = pictureSet
      --[[currentEntity.pictures = {
        picture = {
          north = currentPicture,
          east = currentPicture,
          south = currentPicture,
          west = currentPicture,
        },
        gas_flow = empty_sprite,
        fluid_background = empty_sprite,
        window_background = empty_sprite,
        flow_sprite = empty_sprite
      }]]--
      currentEntity.circuit_wire_max_distance = 0
      currentEntity.working_sound = nil


      --[[currentRecipe = util.table.deepcopy(data.raw["recipe"]["pipe"])
      currentRecipe.name = clampedName
      currentRecipe.enabled = false
      currentRecipe.energy_required = 0.002
      currentRecipe.normal =
      {
        ingredients = {{"iron-plate", 1}},
        result = clampedName
      }
      currentRecipe.expensive =
      {
        ingredients = {{"iron-plate", 1}},
        result = clampedName
      }]]--

      local currentItem = util.table.deepcopy(data.raw["item"]["pipe"])
      currentItem.name = clampedName
      currentItem.flags = {"hidden"}
        --{icon = "__base__/graphics/icons/accumulator.png", tint = {r=1, g=0.8, b=1, a=1}}
      local setIcon = data.raw["pipe"][pipe.name].icon or util.table.deepcopy(data.raw["pipe"]["pipe"].icon)
      currentItem.icons = {
        {
          icon = setIcon,
          icon_size = 32
        },
        {
          icon = "__underground-pipe-pack__/graphics/icons/lock.png",
          icon_size = 32
        }
      }
      currentItem.place_result = clampedName


      data:extend{
        util.table.deepcopy(currentEntity),
        --util.table.deepcopy(currentRecipe),
        util.table.deepcopy(currentItem)
        --[[{
          type = "recipe",
          name = clampedName,
          enabled = false,
          energy_required = 0.5,
          ingredients =
          {
            {"iron-plate", 1},
          },
          results =
          {
            {clampedName, 1},
          },
          icon = pipe.icon,
          icon_size = 32,
      },
      {
        type = "item",
        name = clampedName,
        icon = pipe.icon,
      icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "pipes-to-ground",
        order = "c-a",
        place_result = clampedName,
        stack_size = 50
      }]]--
    }
    end
  end
end