local clampedPipeName = {
    --1 =
    --2 =
    [3] = "-clamped-EW",
    --4 =
    [5] = "-clamped-NW",
    [6] = "-clamped-NE",
    [7] = "-clamped-NEW",
    --8 =
    [9] = "-clamped-SW",
    [10] = "-clamped-SE",
    [11] = "-clamped-SEW",
    [12] = "-clamped-NS",
    [13] = "-clamped-NSW",
    [14] = "-clamped-NSE",
    --[15] = "-clamped-nsew",
}

local function getEW(deltaX)
    return deltaX > 0 and 1 or 2
end

local function getNS(deltaY)
    return deltaY > 0 and 4 or 8
end



local function clampPipe(entity, player)
    local tableEntry = 0
    local neighborCount = 0
    for _, entities in pairs(entity.neighbours) do
        for _, neighbour in pairs(entities) do
            local deltaX = entity.position.x - neighbour.position.x
            local deltaY = entity.position.y - neighbour.position.y
            if deltaX ~= 0 and deltaY == 0 then
                --game.print("It's a x difference")
                tableEntry = tableEntry + getEW(deltaX)
                neighborCount = neighborCount + 1
            elseif deltaX == 0 and deltaY ~= 0 then
                --game.print("It's a y difference")
                tableEntry = tableEntry + getNS(deltaY)
                neighborCount = neighborCount + 1
            elseif deltaX ~=0 and deltaY ~= 0 then
                if math.abs(deltaX) > math.abs(deltaY) then
                    --game.print("They're both different but x is larger")
                    tableEntry = tableEntry + getEW(deltaX)
                elseif math.abs(deltaX) < math.abs(deltaY) then
                    --game.print("They're both different but y is larger")
                    tableEntry = tableEntry + getNS(deltaY)
                end
                neighborCount = neighborCount + 1
            end
        end
    end
    local entityPosition = entity.position
    if neighborCount > 1 and tableEntry < 15 then
        local new = entity.surface.create_entity {
            name = entity.name .. clampedPipeName[tableEntry],
            position = entityPosition,
            force = entity.force,
            fast_replace = true,
            spill = false
        }
        new.surface.create_entity {
            name = 'flying-text',
            position = entityPosition,
            text = {'advanced-pipe.clamped'},
            color = {g = 1}
        }
        new.last_user = player
        if entity then
            entity.destroy()
        end
    else
        entity.surface.create_entity {
            name = 'flying-text',
            position = entityPosition,
            text = {'advanced-pipe.fail'},
            color = {r = 1}
        }
    end
end

local function unClampPipe(entity, player)
    local entityPosition = entity.position
    local new = entity.surface.create_entity {
        name = entity.prototype.mineable_properties.products[1].name,
        position = entityPosition,
        force = entity.force,
        fast_replace = true,
        spill = false
    }
    new.surface.create_entity {
        name = 'flying-text',
        position = entityPosition,
        text = {'advanced-pipe.unclamped'},
        color = {g = 1}
    }
    new.last_user = player
    if entity then
        entity.destroy()
    end
end

local function lockPipe(event)
    if game.active_mods["clamp-pipe"] then
        return
    end
    local player = game.players[event.player_index]
    local selection = player.selected
    if selection and selection.type == 'pipe' and selection.force == player.force then
        local clamped = string.find(selection.name, '%-clamped%-')
        if not clamped and selection.name ~= '4-to-4-pipe' then
            clampPipe(selection, player)
        elseif clamped then
            unClampPipe(selection, player)
        end
    end
end
script.on_event('lock-pipe', lockPipe)