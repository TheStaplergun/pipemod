local north = {position = {0, -1}}
local south = {position = {0, 1}}
local west = {position = {-1, 0}}
local east = {position = {1, 0}}

local nameTable = {
    ['EW'] = {
        locale = '[East, West]',
        positions = {east, west}
    },
    ['NW'] = {
        locale = '[North, West]',
        positions = {north, west}
    },
    ['NE'] = {
        locale = '[North, East]',
        positions = {north, east}
    },
    ['NEW'] = {
        locale = '[North, East, West]',
        positions = {north, east, west}
    },
    ['SW'] = {
        locale = '[South, West]',
        positions = {south, west}
    },
    ['SE'] = {
        locale = '[South, East]',
        positions = {south, east}
    },
    ['SEW'] = {
        locale = '[South, East, West]',
        positions = {south, east, west}
    },
    ['NS'] = {
        locale = '[North, South]',
        positions = {north, south}
    },
    ['NSW'] = {
        locale = '[North, South, West]',
        positions = {north, south, west}
    },
    ['NSE'] = {
        locale = '[North, South, East]',
        positions = {north, south, east}
    }
}

local dontChange = {
    gas_flow = true,
    fluid_background = true,
    window_background = true,
    flow_sprite = true
}

local pipeEntities = {}
for i, pipe in pairs(data.raw['pipe']) do
    for name, pipeData in pairs(nameTable) do
        if not pipe.clamped and not string.find(pipe.name, 'dummy%-') then
            local currentEntity = util.table.deepcopy(pipe)

            currentEntity.name = pipe.name .. '-clamped-' .. name
            currentEntity.clamped = true
            currentEntity.localised_name = {'advanced-pipe.clamped-name', pipe.name, pipeData.locale}
            currentEntity.placeable_by = {item = pipe.name, count = pipe.minable and pipe.minable.count or 1}
            currentEntity.icons = {
                {
                    icon = currentEntity.icon or data.raw['pipe']['pipe'].icon,
                    icon_size = 32
                },
                {
                    icon = '__underground-pipe-pack__/graphics/icons/lock.png',
                    icon_size = 32
                }
            }
            currentEntity.flags = {'placeable-neutral', 'player-creation', 'fast-replaceable-no-build-while-moving'}
            currentEntity.fluid_box.pipe_connections = pipeData.positions

            for pictureName, _ in pairs(currentEntity.pictures) do
                if not dontChange[pictureName] then
                    local currentLayerData = currentEntity.pictures[pictureName]
                    currentEntity.pictures[pictureName] = {
                        layers = {
                            currentLayerData,
                            {
                                filename = '__underground-pipe-pack__/graphics/icons/lock.png',
                                priority = 'extra-high',
                                width = 32,
                                height = 32,
                                scale = 0.8,
                                shift = util.by_pixel(0, -5),
                                hr_version = {
                                    filename = '__underground-pipe-pack__/graphics/icons/hr-lock.png',
                                    priority = 'extra-high',
                                    width = 64,
                                    height = 64,
                                    scale = 0.4,
                                    shift = util.by_pixel(0, -5)
                                }
                            }
                        }
                    }
                end
            end
            pipeEntities[#pipeEntities + 1] = currentEntity
        end
    end
end
data:extend(
  pipeEntities,
{
    type = 'selection-tool',
    name = 'picker-pipe-clamper',
    icon = '__PickerPipeTools__/graphics/icons/hr-lock.png',
    icon_size = 64,
    flags = {'hidden'},
    subgroup = 'tool',
    order = 'c[selection-tool]-a[pipe-cleaner]',
    stack_size = 1,
    stackable = false,
    selection_color = {r = 1, g = 0, b = 0},
    alt_selection_color = {r = 0, g = 1, b = 0},
    selection_mode = {'same-force', 'buildable-type', 'items-to-place'},
    alt_selection_mode = {'same-force', 'buildable-type', 'items-to-place'},
    selection_cursor_box_type = 'copy',
    alt_selection_cursor_box_type = 'copy',
    always_include_tiles = false,
    show_in_library = true
})
