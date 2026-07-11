local advanced_piping = require("tables")
local Event = require("lib/event")
local Table = require("lib/table")

local function get_player(event)
  if not event.player_index then
    return nil
  end

  local player = game.get_player(event.player_index)
  if player and player.valid then
    return player
  end
end

local function capture_entity_state(entity)
  local is_ghost = entity.type == "entity-ghost"
  local quality = entity.quality
  local state = {
    is_ghost = is_ghost,
    name = is_ghost and entity.ghost_name or entity.name,
    position = entity.position,
    direction = entity.direction,
    force = entity.force,
    surface = entity.surface,
    quality = quality and quality.name or nil,
    tags = is_ghost and Table.deepcopy(entity.tags or {}) or nil,
    fluids = {},
  }

  if not is_ghost then
    state.last_user = entity.last_user

    if entity.health and entity.prototype.max_health and entity.prototype.max_health > 0 then
      state.health_ratio = entity.health / entity.prototype.max_health
    end

    for index = 1, entity.fluids_count do
      local fluid = entity.get_fluid(index)
      if fluid then
        state.fluids[index] = fluid
      end
    end
  end

  return state
end

local function create_from_state(state, name, player, raise_built)
  return state.surface.create_entity({
    name = state.is_ghost and "entity-ghost" or name,
    inner_name = state.is_ghost and name or nil,
    position = state.position,
    direction = state.direction,
    force = state.force,
    quality = state.quality,
    tags = state.is_ghost and state.tags or nil,
    fast_replace = true,
    create_build_effect_smoke = false,
    spill = false,
    player = player,
    raise_built = raise_built,
  })
end

local function restore_entity_state(entity, state)
  if not entity or not entity.valid or state.is_ghost then
    return
  end

  for index, fluid in pairs(state.fluids) do
    entity.set_fluid(index, fluid)
  end

  if state.health_ratio and entity.health and entity.prototype.max_health then
    entity.health = math.min(entity.prototype.max_health, entity.prototype.max_health * state.health_ratio)
  end

  if state.last_user and state.last_user.valid then
    entity.last_user = state.last_user
  end
end

local function replace_entity(old_entity, new_name, player)
  if not old_entity or not old_entity.valid or not new_name then
    return nil
  end

  local state = capture_entity_state(old_entity)
  if state.name == new_name then
    return old_entity
  end

  local destroyed = old_entity.destroy({
    raise_destroy = true,
    player = player,
  })

  if not destroyed then
    return nil
  end

  local new_entity = create_from_state(state, new_name, player, true)
  if new_entity and new_entity.valid then
    restore_entity_state(new_entity, state)
    return new_entity
  end

  -- A failed replacement should not silently delete the player's entity.
  local restored_entity = create_from_state(state, state.name, player, true)
  if restored_entity and restored_entity.valid then
    restore_entity_state(restored_entity, state)
  end

  return nil
end

local function rotate_underground_pipe(event)
  local player = get_player(event)
  if not player then
    return
  end

  local selection = player.selected
  if not selection or not selection.valid or selection.force ~= player.force then
    return
  end

  local is_pipe = selection.type == "pipe-to-ground"
  local is_pipe_ghost = selection.type == "entity-ghost" and selection.ghost_type == "pipe-to-ground"
  if not is_pipe and not is_pipe_ghost then
    return
  end

  local current_name = is_pipe_ghost and selection.ghost_name or selection.name
  local reverse = event.input_name == "reverse-rotate-underground-pipe"
  local rotation_table = reverse and advanced_piping.getReverseRotatedPipe or advanced_piping.getRotatedPipe
  replace_entity(selection, rotation_table[current_name], player)
end

Event.register("rotate-underground-pipe", rotate_underground_pipe)
Event.register("reverse-rotate-underground-pipe", rotate_underground_pipe)

local function adjust_valve(event, direction)
  local player = get_player(event)
  if not player then
    return
  end

  local selection = player.selected
  if not selection or not selection.valid or selection.force ~= player.force or selection.type ~= "valve" then
    return
  end

  local valve = advanced_piping.adjustable_valve_table[selection.name]
  if not valve then
    return
  end

  local next_name = direction == "next" and valve.next_valve or valve.previous_valve
  replace_entity(selection, next_name, player)
end

Event.register("plus-valve", function(event)
  adjust_valve(event, "next")
end)

Event.register("minus-valve", function(event)
  adjust_valve(event, "previous")
end)

local function get_pipe_table()
  return advanced_piping.pipetable
end

local function get_ignored_pipes()
  return advanced_piping.ignore
end

remote.add_interface(script.mod_name, {
  get_pipe_table = get_pipe_table,
  get_ignored_pipes = get_ignored_pipes,
})
