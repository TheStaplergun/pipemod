local modInit = require('init')
script.on_init(modInit.mod_init)
script.on_configuration_changed(modInit.mod_init)

local advancedPiping = require('tables')

local function RotateUnderground(oldPipe, player)
    if not advancedPiping.getRotatedPipe[oldPipe.name] then
        return
    end
    local oldPipeFluid = oldPipe.fluidbox[1]
    local newPipe =
        oldPipe.surface.create_entity {
        name = advancedPiping.getRotatedPipe[oldPipe.name],
        position = oldPipe.position,
        direction = oldPipe.direction,
        force = oldPipe.force,
        fast_replace = true,
        spill = false
    }
    newPipe.fluidbox[1] = oldPipeFluid
    newPipe.last_user = player
    if oldPipe then
        oldPipe.destroy()
    end
end

local function rotateUndergroundPipe(event)
    local player = game.players[event.player_index]
    local selection = player.selected
    if selection and selection.force == player.force then
        local researched = player.force.technologies['advanced-underground-piping'].researched
        if (selection.type == 'pipe-to-ground' or (selection.type == 'entity-ghost' and selection.ghost_type == 'pipe-to-ground')) and researched then
            RotateUnderground(selection, player)
        end
    end
end
script.on_event('rotate-underground-pipe', rotateUndergroundPipe)

local function plus_valve(event)
    local player = game.players[event.player_index]
    local selection = player.selected
    if selection and selection.force == player.force then
        local valve_table = advancedPiping.adjustable_valve_table
        if valve_table[selection.name] and valve_table[selection.name].next_valve then
            local old_valve_fluid = selection.fluidbox[1]
            local new_valve =
                selection.surface.create_entity {
                name = valve_table[selection.name].next_valve,
                position = selection.position,
                direction = selection.direction,
                force = selection.force,
                fast_replace = true,
                spill = false
            }
            new_valve.fluidbox[1] = old_valve_fluid
            new_valve.last_user = player
            if selection then
                selection.destroy()
            end
        end
    end
end
script.on_event('plus-valve', plus_valve)

local function minus_valve(event)
    local player = game.players[event.player_index]
    local selection = player.selected
    if selection and selection.force == player.force then
        local valve_table = advancedPiping.adjustable_valve_table
        if valve_table[selection.name] and valve_table[selection.name].previous_valve then
            local old_valve_fluid = selection.fluidbox[1]
            local new_valve =
                selection.surface.create_entity {
                name = valve_table[selection.name].previous_valve,
                position = selection.position,
                direction = selection.direction,
                force = selection.force,
                fast_replace = true,
                spill = false
            }
            new_valve.fluidbox[1] = old_valve_fluid
            new_valve.last_user = player
            if selection then
                selection.destroy()
            end
        end
    end
end
script.on_event('minus-valve', minus_valve)

-- Cheat Mode HAX
local function on_player_pipette(event)
    if event.used_cheat_mode and event.item and advancedPiping.correctBluePrintTable[event.item.name] then
        local player = game.players[event.player_index]
        player.cursor_stack.set_stack(advancedPiping.correctBluePrintTable[event.item.name])
    end
end
script.on_event(defines.events.on_player_pipette, on_player_pipette)

local function get_pipe_table()
    return advancedPiping.pipetable
end
local function get_ignored_pipes()
    return advancedPiping.ignore
end
remote.add_interface(script.mod_name, {get_pipe_table = get_pipe_table, get_ignored_pipes = get_ignored_pipes})
