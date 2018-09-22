local north = {position = {0, -1}}
local south = {position = {0, 1}}
local west = {position = {-1, 0}}
local east = {position = {1, 0}}

local nameTable = {
    ['ew'] = {
        locale = '[East, West]',
        positions = {east, west}
    },
    ['nw'] = {
        locale = '[North, West]',
        positions = {north, west}
    },
    ['ne'] = {
        locale = '[North, East]',
        positions = {north, east}
    },
    ['new'] = {
        locale = '[North, East, West]',
        positions = {north, east, west}
    },
    ['sw'] = {
        locale = '[South, West]',
        positions = {south, west}
    },
    ['se'] = {
        locale = '[South, East]',
        positions = {south, east}
    },
    ['sew'] = {
        locale = '[South, East, West]',
        positions = {south, east, west}
    },
    ['ns'] = {
        locale = '[North, South]',
        positions = {north, south}
    },
    ['nsw'] = {
        locale = '[North, South, West]',
        positions = {north, south, west}
    },
    ['nse'] = {
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
data:extend(pipeEntities)
