local pipeData = require("prototypes.pipe-definitions")

local SPACE_DISTANCE = 14

local base_ug_distance = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance)
local space_pipe_area = 100

if mods["space-exploration"] then
  space_pipe_area = data.raw["pipe"]["se-space-pipe"].fluid_box.base_area
end

local function update_underground_distances(entity, newDistance)
  log("Updating " .. entity.name .. " to have fluid connections at distance " .. newDistance)
  for _,connection in pairs(entity.fluid_box.pipe_connections) do
    if connection.max_underground_distance then
      connection.max_underground_distance = newDistance
    end
  end
end

for types, sets in pairs(pipeData.pipeNames) do
  for _ , datas in pairs(sets) do
    for variants, directions in pairs(datas.variant) do
      for levelsS , levelsN in pairs(pipeData.levels) do
        local currentName
        local newDistance = base_ug_distance + 1
        if levelsS == "1" then
          currentName = types .. variants ..  "pipe"
        elseif levelsS == "space" then
          currentName = types .. variants ..  "space-pipe"
          newDistance = SPACE_DISTANCE + 2
        else
          currentName = types .. variants .. "t" .. levelsS .. "-pipe"
          newDistance = newDistance * levelsN
        end

        local pipe = data.raw["pipe-to-ground"][currentName]
        update_underground_distances(pipe, newDistance)
        if levelsS == "space" then
          pipe.fluid_box.base_area = space_pipe_area
        end
      end
    end
  end
end

for name, properties in pairs(pipeData.undergroundNames) do
  for levelsS , levelsN in pairs(pipeData.levels) do
    local currentName
    local newDistance = base_ug_distance + 1
    if levelsS == "1" then
      currentName = name .. "-pipe"
    elseif levelsS == "space" then
      currentName = name .. "-space-pipe"
      newDistance = SPACE_DISTANCE
    else
      currentName = name .. "-t" .. levelsS .. "-pipe"
      newDistance = newDistance * levelsN
    end

    local pipe = data.raw["pipe-to-ground"][currentName]
    update_underground_distances(pipe, newDistance)
    if levelsS == "space" then
      pipe.fluid_box.base_area = space_pipe_area
    end
  end
end

update_underground_distances(data.raw["pipe"]["4-to-4-pipe"], base_ug_distance + 1)
update_underground_distances(data.raw["pump"]["underground-mini-pump"], base_ug_distance * 3 + 1)

if mods["space-exploration"] then
  update_underground_distances(data.raw["pump"]["underground-space-pump"], SPACE_DISTANCE + 2)
end
