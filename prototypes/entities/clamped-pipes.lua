local nameTable = {
  ["-clamped-EW"] = {
    positions = {
      { position = {1, 0} },
      { position = {-1, 0} },
    },
  },
  ["-clamped-NW"] = {
    positions = {
      { position = {0, -1} },
      { position = {-1, 0} },
    },
  },
  ["-clamped-NE"] = {
    positions = {
      { position = {0, -1} },
      { position = {1, 0} },
    },
  },
  ["-clamped-NEW"] = {
    positions = {
      { position = {0, -1} },
      { position = {1, 0} },
      { position = {-1, 0} },
    },
  },
  ["-clamped-SW"] = {
    positions = {
      { position = {0, 1} },
      { position = {-1, 0} },
    },
  },
  ["-clamped-SE"] = {
    positions = {
      { position = {0, 1} },
      { position = {1, 0} },
    },
  },
  ["-clamped-SEW"] = {
    positions = {
      { position = {0, 1} },
      { position = {1, 0} },
      { position = {-1, 0} },
    },
  },
  ["-clamped-NS"] = {
    positions = {
      { position = {0, -1} },
      { position = {0, 1} },
    },
  },
  ["-clamped-NSW"] = {
    positions = {
      { position = {0, -1} },
      { position = {0, 1} },
      { position = {-1, 0} },
    },
  },
  ["-clamped-NSE"] = {
    positions = {
      { position = {0, -1} },
      { position = {0, 1} },
      { position = {1, 0} },
    },
  },
}

for i,pipe in pairs(data.raw["pipe"]) do
  for names, _ in pairs(nameTable) do
    local clampedName = pipe.name .. names
    if not string.match(pipe.name, "%-clamped%-") and not string.match(pipe.name, "dummy%-") and pipe.name ~= "4-to-4-pipe" then
      local currentEntity = util.table.deepcopy(data.raw["pipe"]["pipe"])
      currentEntity.name = clampedName
      if pipe.localised_name then
        currentEntity.localised_name = pipe.localised_name .. " clamped"
      end
      currentEntity.icon = data.raw["pipe"][pipe.name].icon or data.raw["pipe"]["pipe"].icon
      currentEntity.minable = data.raw["pipe"][pipe.name].minable
      currentEntity.flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"}
      currentEntity.corpse = "small-remnants"
      currentEntity.max_health = data.raw["pipe"][pipe.name].max_health
      currentEntity.resistances = data.raw["pipe"][pipe.name].resistances
      currentEntity.fast_replaceable_group = data.raw["pipe"][pipe.name].fast_replaceable_group
      currentEntity.collision_box = data.raw["pipe"][pipe.name].collision_box
      currentEntity.selection_box = data.raw["pipe"][pipe.name].selection_box
      currentEntity.fluid_box = {
        base_area = 1,
        pipe_connections = nameTable[names].positions
      }
      currentEntity.two_direction_only = false
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
      currentEntity.circuit_wire_max_distance = 0
      currentEntity.working_sound = nil

      local currentItem = util.table.deepcopy(data.raw["item"]["pipe"])
      currentItem.name = clampedName
      currentItem.flags = {"hidden"}
        --{icon = "__base__/graphics/icons/accumulator.png", tint = {r=1, g=0.8, b=1, a=1}}
      local setIcon = data.raw["item"][pipe.name].icon or data.raw["item"]["pipe"].icon
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
        util.table.deepcopy(currentItem)
      }
    end
  end
end