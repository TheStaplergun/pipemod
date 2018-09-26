local north = {position = {0, -1}}
local south = {position = {0, 1}}
local west = {position = {-1, 0}}
local east = {position = {1, 0}}

local directionTable = {
  ['N'] = {
    positions = {north}
  },
  ['S'] = {
    positions = {south}
  },
  ['E'] = {
    positions = {east}
  },
  ['W'] = {
    positions = {west}
  },
  ['EW'] = {
      positions = {east, west}
  },
  ['NW'] = {
      positions = {north, west}
  },
  ['NE'] = {
      positions = {north, east}
  },
  ['NEW'] = {
      positions = {north, east, west}
  },
  ['SW'] = {
      positions = {south, west}
  },
  ['SE'] = {
      positions = {south, east}
  },
  ['SEW'] = {
      positions = {south, east, west}
  },
  ['NS'] = {
      positions = {north, south}
  },
  ['NSW'] = {
      positions = {north, south, west}
  },
  ['NSE'] = {
      positions = {north, south, east}
  },
  ['NSEW'] = {
    positions = {north, south, east, west}
  }
}
local base_ug_distance = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box)
local function setUGDistance(directions, level)
  local ugConnectionsTable = {}
  for _, data in pairs(directionTable[directions].positions) do
    ugConnectionsTable[#ugConnectionsTable + 1] = {
      util.table.deepcopy(data),
      max_underground_distance = 11 * level
    }
  end
  return ugConnectionsTable
end

local namesTable = {
  ["one-to-one"] = {
    {
      icon = "one-to-one",
      variant = {
      ["-forward"] = "S",
      ["-left"] = "E",
      ["-reverse"] = "N",
      ["-right"] = "W"
      }
    }
  },
  ["one-to-two"] = {
    {
      icon = "one-to-two-parallel",
      variant = {
      ["-perpendicular"] = "EW",
      ["-parallel"] = "NS",
      }
    },
    {
      icon = "one-to-two-l",
      variant = {
        ["-L-FL"] = "SE",
        ["-L-FR"] = "SW",
        ["-L-RR"] = "NW",
        ["-L-RL"] = "NE"
      }
    }
  },
  ["one-to-three"] = {
    {
      icon = "one-to-three",
      variant = {
      ["-forward"] = "SEW",
      ["-left"] = "NSE",
      ["-reverse"] = "NEW",
      ["-right"] = "NSW"
      }
    }
  },
  ["one-to-four"] = {
    icon = "one-to-four",
    variant = {["-"] = "NSEW"}
  }
}

local directionsTable = {
  "up",
  "down",
  "left",
  "right"
}

local levelsTable = {
  ["1"] = 1,
  ["2"] = 2,
  ["3"] = 3
}

local pipes ={}
for types, data in pairs(namesTable) do
  for variations, directions in pairs(data) do
    for levelsS , levelsN in pairs(levelsTable) do
      local currentPipe = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
      local currentName = types .. variations .. "pipe"
      currentPipe.name = currentName
      currentPipe.icon = types ..
    end
  end
end
