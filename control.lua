local modInit = require('init')
script.on_init(modInit.mod_init)
script.on_configuration_changed(modInit.mod_init)

local advancedPiping = require('tables')

local function checkForCorrections(entity)
    if global.correctTable.correctableNames[entity.name] then -- or entity.type == "pipe" then
        --game.print("It is a correctable type" .. entityGiven.unit_number)
        local matchFound = false
        for names, dataTable in pairs(global.correctTable.entityData) do
            for k2, aPosition in pairs(dataTable.positions) do
                if (entity.position.x == aPosition.x) and (entity.position.y == aPosition.y) then
                    --game.print("Found a matching entity position " .. entity.unit_number)
                    entity =
                        entity.surface.create_entity {
                        name = names,
                        position = aPosition,
                        direction = entity.direction,
                        force = entity.force,
                        fast_replace = true,
                        spill = false
                    }
                    entity.surface.create_entity {
                        name = 'flying-text',
                        position = aPosition,
                        text = 'Corrected',
                        color = {g = 1}
                    }
                    matchFound = true
                    global.correctTable.entityData[names].positions[k2] = nil
                    if not next(global.correctTable.entityData[names].positions) then
                        global.correctTable.entityData[names] = nil
                    end
                    if not next(global.correctTable.entityData) then
                        entity.surface.create_entity {
                            name = 'flying-text',
                            position = entity.position,
                            text = 'All Corrections Complete',
                            color = {r = 1}
                        }
                        global.correctTable.correctMode = false
                    end
                    break
                end
            end
            if matchFound then
                break
            end
        end
        if matchFound then
            return true
        else
            return false
        end
    end
end

local function RotateUnderground(oldPipe, surface)
    if not advancedPiping.getRotatedPipe[oldPipe.name] then
        return
    end
    local oldPipeFluid = oldPipe.fluidbox[1]
    local newPipe =
        surface.create_entity {
        name = advancedPiping.getRotatedPipe[oldPipe.name],
        position = oldPipe.position,
        direction = oldPipe.direction,
        force = oldPipe.force,
        fast_replace = true,
        spill = false
    }
    newPipe.fluidbox[1] = oldPipeFluid
end

local function onRobotBuilt(event)
    if global.correctTable.correctMode then
        checkForCorrections(event.created_entity)
    end
end
script.on_event(defines.events.on_robot_built_entity, onRobotBuilt)

local function removeEntry(entity)
    local matchFound = false
    for names, dataTable in pairs(global.correctTable.entityData) do
        for k1, aPosition in pairs(dataTable.positions) do
            if (entity.position.x == aPosition.x) and (entity.position.y == aPosition.y) then
                global.correctTable.entityData[names].positions[k1] = nil
                if #global.correctTable.entityData[names].positions == 0 then
                    global.correctTable.entityData[names] = nil
                end
                if not next(global.correctTable.entityData) then
                    entity.surface.create_entity {
                        name = 'flying-text',
                        position = entity.position,
                        text = 'All Corrections Complete',
                        color = {r = 1}
                    }
                    global.correctTable.correctMode = false
                end
                matchFound = true
                break
            end
        end
        if matchFound then
            break
        end
    end
end

-- Handle both pre_ghost deconstruction and pre_item mine
local function onPrePlayerMinedItem(event)
    if global.correctTable.correctMode then
        if event.ghost or (event.entity and event.entity.type == 'entity-ghost') then
            removeEntry(event.entity or event.ghost)
        end
    end
end
script.on_event({defines.events.on_pre_ghost_deconstructed, defines.events.on_pre_player_mined_item}, onPrePlayerMinedItem)

local function onBuilt(event)
    local correctionMade = false
    if global.correctTable.correctMode then
        --game.print("Correct mode is on")
        correctionMade = checkForCorrections(event.created_entity)
    end
    if not correctionMade then
        if event.ghost or (event.created_entity and event.created_entity.type == 'entity-ghost') then
            local ghostEntity = event.created_entity
            if advancedPiping.correctBluePrintTable[ghostEntity.ghost_name] then -- or (ghostEntity.ghost_type == "pipe" and string.match(ghostEntity.ghost_name, "%-clamped%-")) then
                local correctEntity = advancedPiping.correctBluePrintTable[ghostEntity.ghost_name] or game.entity_prototypes[ghostEntity.ghost_name].mineable_properties.products[1].name
                if correctEntity then
                    local ghostName = ghostEntity.ghost_name
                    ghostEntity.surface.create_entity {
                        name = 'entity-ghost',
                        inner_name = correctEntity,
                        position = ghostEntity.position,
                        direction = ghostEntity.direction,
                        force = ghostEntity.force,
                        fast_replace = true,
                        spill = false
                    }.surface.create_entity {
                        name = 'flying-text',
                        position = ghostEntity.position,
                        text = 'Set for Correction',
                        color = {g = 1}
                    }
                    global.correctTable.correctMode = true
                    --if global.correctTable.correctableNames[correctEntity] then
                    local dataExists = false
                    if global.correctTable.entityData[ghostName] then
                        local positionTable = ghostEntity.position
                        --{x = ghostEntity.position.x, y = ghostEntity.position.y}
                        global.correctTable.entityData[ghostName].positions[#global.correctTable.entityData[ghostName].positions + 1] = positionTable
                        dataExists = true
                    end
                    if not dataExists then
                        local positionTable = ghostEntity.position
                        global.correctTable.entityData[ghostEntity.ghost_name] = {
                            positions = {
                                positionTable
                            }
                        }
                    end
                    ghostEntity.destroy()
                end
            end
        end
    end
end
script.on_event(defines.events.on_built_entity, onBuilt)

local function rotateUndergroundPipe(event)
    local player = game.players[event.player_index]
    local selection = player.selected
    if selection and selection.force == player.force then
        local researched = player.force.technologies['advanced-underground-piping'].researched
        if (selection.type == 'pipe-to-ground' or (selection.type == 'entity-ghost' and selection.ghost_type == 'pipe-to-ground')) and researched then
            RotateUnderground(selection, player.surface)
        end
    end
end
script.on_event('rotate-underground-pipe', rotateUndergroundPipe)

local function showUndergroundSprites(event)
    local player = game.players[event.player_index]
    if player.force.technologies['advanced-underground-piping'].researched then
        local filter = {
            area = {{player.position.x - 80, player.position.y - 50}, {player.position.x + 80, player.position.y + 50}},
            type = {'pipe-to-ground', 'pump'},
            force = player.force
        }
        for _, entity in pairs(player.surface.find_entities_filtered(filter)) do
            if entity.type == 'pipe-to-ground' or (entity.type == 'pump' and entity.name == 'underground-mini-pump') then
                local neighborCounter = 0
                local maxNeighbors = advancedPiping.pipetable[entity.name] or 2
                for _, entities in pairs(entity.neighbours) do
                    for _, neighbour in pairs(entities) do
                        neighborCounter = neighborCounter + 1
                        if (entity.position.x - neighbour.position.x) < -1.5 then
                            local distancex = neighbour.position.x - entity.position.x
                            for i = 1, distancex - 1, 1 do
                                player.surface.create_entity {
                                    name = 'underground-pipe-marker-horizontal',
                                    position = {entity.position.x + i, entity.position.y}
                                }
                            end
                        end
                        if (entity.position.y - neighbour.position.y) < -1.5 then
                            local distancey = neighbour.position.y - entity.position.y
                            for i = 1, distancey - 1, 1 do
                                player.surface.create_entity {
                                    name = 'underground-pipe-marker-vertical',
                                    position = {entity.position.x, entity.position.y + i}
                                }
                            end
                        end
                    end
                    if (maxNeighbors == neighborCounter) then
                        entity.surface.create_entity {
                            name = 'pipe-marker-box-good',
                            position = entity.position
                        }
                    elseif (neighborCounter < maxNeighbors) then
                        entity.surface.create_entity {
                            name = 'pipe-marker-box-bad',
                            position = entity.position
                        }
                    end
                end
            end
        end
    end
end
if modInit.noUgSprites then
    script.on_event('show-underground-sprites', showUndergroundSprites)
end

local function get_pipe_table()
    return advancedPiping.pipetable
end
local function get_ignored_pipes()
    return advancedPiping.ignore
end
remote.add_interface(script.mod_name, {get_pipe_table = get_pipe_table, get_ignored_pipes = get_ignored_pipes})
