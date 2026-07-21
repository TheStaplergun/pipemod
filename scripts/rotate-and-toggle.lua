local advancedPiping = require('tables')

local Player = require('lib/player')
local Event = require('lib/event')
local Position = require('lib/position')

local function RotateUnderground(old_pipe, player, reverse)
    local is_ghost = old_pipe.type == 'entity-ghost'
    local old_name = is_ghost and old_pipe.ghost_name or old_pipe.name
    local new_name = reverse and advancedPiping.getReverseRotatedPipe[old_name] or advancedPiping.getRotatedPipe[old_name]
    if not new_name then
        return
    end

    old_pipe.surface.create_entity {
            name = is_ghost and 'entity-ghost' or new_name,
            inner_name = is_ghost and new_name or nil,
            position = old_pipe.position,
            direction = old_pipe.direction,
            force = old_pipe.force,
            fast_replace = true,
            create_build_effect_smoke = false,
            spill = false,
            player = player,
            raise_built = true
        }
end

local function rotateUndergroundPipe(event)
    local reverse = event.input_name == 'reverse-rotate-underground-pipe' and true or false
    local player,_ = Player.get(event.player_index)
    local selection = player.selected
    if selection and selection.force == player.force then

        if (selection.type == 'pipe-to-ground' or (selection.type == 'entity-ghost' and selection.ghost_type == 'pipe-to-ground')) then

            RotateUnderground(selection, player, reverse)
        end
    end
end
Event.register('rotate-underground-pipe', rotateUndergroundPipe)
Event.register('reverse-rotate-underground-pipe', rotateUndergroundPipe)

local function plus_valve(event)
    local player,_ = Player.get(event.player_index)
    local selection = player.selected
    if selection and selection.force == player.force then
        local valve_table = advancedPiping.adjustable_valve_table
        if valve_table[selection.name] and valve_table[selection.name].next_valve then
            local old_valve_fluid = selection.fluidbox[1]
            local event_data = {
                entity = selection,
                player_index = player.index,
            }
            script.raise_event(defines.events.script_raised_destroy, event_data)
            local new_valve =
                selection.surface.create_entity {
                name = valve_table[selection.name].next_valve,
                position = selection.position,
                direction = selection.direction,
                force = selection.force,
                fast_replace = true,
                create_build_effect_smoke = false,
                spill = false
            }
            --new_valve.fluidbox[1] = old_valve_fluid
            new_valve.last_user = player
            event_data = {
                created_entity = new_valve,
                entity = new_valve,
                player_index = player.index,
            }
            script.raise_event(defines.events.script_raised_built, event_data)
            if selection then
                selection.destroy()
            end
        end
    end
end
Event.register('plus-valve', plus_valve)

local function minus_valve(event)
    local player,_ = Player.get(event.player_index)
    local selection = player.selected
    if selection and selection.force == player.force then
        local valve_table = advancedPiping.adjustable_valve_table
        if valve_table[selection.name] and valve_table[selection.name].previous_valve then
            local old_valve_fluid = selection.fluidbox[1]
            local event_data = {
                entity = selection,
                player_index = player.index,
            }
            script.raise_event(defines.events.script_raised_destroy, event_data)
            local new_valve =
                selection.surface.create_entity {
                name = valve_table[selection.name].previous_valve,
                position = selection.position,
                direction = selection.direction,
                force = selection.force,
                fast_replace = true,
                create_build_effect_smoke = false,
                spill = false
            }
            --new_valve.fluidbox[1] = old_valve_fluid
            new_valve.last_user = player
            event_data = {
                created_entity = new_valve,
                entity = new_valve,
                player_index = player.index,
            }
            script.raise_event(defines.events.script_raised_built, event_data)
            if selection then
                selection.destroy()
            end
        end
    end
end
Event.register('minus-valve', minus_valve)

local function get_pipe_table()
    return advancedPiping.pipetable
end
local function get_ignored_pipes()
    return advancedPiping.ignore
end
remote.add_interface(script.mod_name, {get_pipe_table = get_pipe_table, get_ignored_pipes = get_ignored_pipes})
