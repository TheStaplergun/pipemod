local pipeNamesTable = {
  ["one-to-one"] = {
    {
      icon = "one-to-one",
      mine_and_place = "-forward",
      variant = {
      ["-forward-"] = "S",
      ["-left-"] = "E",
      ["-reverse-"] = "N",
      ["-right-"] = "W"
      }
    }
  },
  ["one-to-two"] = {
    {
      icon = "one-to-two-parallel",
      mine_and_place = "-perpendicular",
      variant = {
      ["-perpendicular-"] = "EW",
      ["-parallel-"] = "NS",
      ["-perpendicular-secondary-"] = "EW",
      ["-parallel-secondary-"] = "NS",
      ["-L-FL-"] = "SE",
      ["-L-FR-"] = "SW",
      ["-L-RR-"] = "NW",
      ["-L-RL-"] = "NE"
      }
    },
    --[[{
      icon = "one-to-two-L",
      mine_and_place = "-L-FL",
      variant = {
        ["-L-FL-"] = "SE",
        ["-L-FR-"] = "SW",
        ["-L-RR-"] = "NW",
        ["-L-RL-"] = "NE"
      }
    }]]--
  },
  ["one-to-three"] = {
    {
      icon = "one-to-three",
      mine_and_place = "-forward",
      variant = {
      ["-forward-"] = "SEW",
      ["-left-"] = "NSE",
      ["-reverse-"] = "NEW",
      ["-right-"] = "NSW"
      }
    }
  },
  ["one-to-four"] = {
    {
      icon = "one-to-four",
      mine_and_place = "",
      variant = {
        ["-"] = "NSEW"
      }
    }
  }
}

local undergroundNamesTable = {
    ["underground-i"] = {
        directions = 'NS',
        picture_variants = {
            up = 'NS',
            right = 'EW',
            down = 'NS',
            left = 'EW'
        }
    },
    ["underground-L"] = {
        directions = 'ES',
        picture_variants = {
            up = 'ES',
            down = 'NW',
            right = 'SW',
            left = 'NE'
        }
    },
    ["underground-t"] = {
        directions = 'ESW',
        picture_variants = {
            up = 'ESW',
            right = 'NSW',
            down = 'NEW',
            left = 'NES'
        }
    },
    ["underground-cross"] = {
        directions = 'NSEW',
        picture_variants = {
            up = 'NESW',
            down = 'NESW',
            left = 'NESW',
            right = 'NESW'
        }
    },
}

-- Table gets built in reverse so that we can use the current pipe tier for the next pipes next_upgrade
local levelsTable = {}

if mods["space-exploration"] then
  levelsTable["space"] = 4
end

levelsTable["3"] = 3
levelsTable["2"] = 2
levelsTable["1"] = 1

return {
  pipeNames = pipeNamesTable,
  undergroundNames = undergroundNamesTable,
  levels = levelsTable,
}
