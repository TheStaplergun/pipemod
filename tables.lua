local data = {}

data.getRotatedPipe = {
        -- One to One pipes
        ["one-to-one-forward-pipe"] = "one-to-one-right-pipe",
        ["one-to-one-right-pipe"] = "one-to-one-reverse-pipe",
        ["one-to-one-reverse-pipe"] = "one-to-one-left-pipe",
        ["one-to-one-left-pipe"] = "one-to-one-forward-pipe",
        -- One to Two pipes
        ["one-to-two-parallel-pipe"] = "one-to-two-perpendicular-pipe",
        ["one-to-two-perpendicular-pipe"] = "one-to-two-parallel-pipe",
        ["one-to-two-L-FL-pipe"] = "one-to-two-L-FR-pipe",
        ["one-to-two-L-FR-pipe"] = "one-to-two-L-RR-pipe",
        ["one-to-two-L-RR-pipe"] = "one-to-two-L-RL-pipe",
        ["one-to-two-L-RL-pipe"] = "one-to-two-L-FL-pipe",
        -- One to Three pipes
        ["one-to-three-forward-pipe"] = "one-to-three-right-pipe",
        ["one-to-three-right-pipe"] = "one-to-three-reverse-pipe",
        ["one-to-three-reverse-pipe"] = "one-to-three-left-pipe",
        ["one-to-three-left-pipe"] = "one-to-three-forward-pipe",
        -- One to One t2 pipes
        ["one-to-one-forward-t2-pipe"] = "one-to-one-right-t2-pipe",
        ["one-to-one-right-t2-pipe"] = "one-to-one-reverse-t2-pipe",
        ["one-to-one-reverse-t2-pipe"] = "one-to-one-left-t2-pipe",
        ["one-to-one-left-t2-pipe"] = "one-to-one-forward-t2-pipe",
        -- One to Two t2 pipes
        ["one-to-two-parallel-t2-pipe"] = "one-to-two-perpendicular-t2-pipe",
        ["one-to-two-perpendicular-t2-pipe"] = "one-to-two-parallel-t2-pipe",
        ["one-to-two-L-FL-t2-pipe"] = "one-to-two-L-FR-t2-pipe",
        ["one-to-two-L-FR-t2-pipe"] = "one-to-two-L-RR-t2-pipe",
        ["one-to-two-L-RR-t2-pipe"] = "one-to-two-L-RL-t2-pipe",
        ["one-to-two-L-RL-t2-pipe"] = "one-to-two-L-FL-t2-pipe",
        -- One to Three t2 pipes
        ["one-to-three-forward-t2-pipe"] = "one-to-three-right-t2-pipe",
        ["one-to-three-right-t2-pipe"] = "one-to-three-reverse-t2-pipe",
        ["one-to-three-reverse-t2-pipe"] = "one-to-three-left-t2-pipe",
        ["one-to-three-left-t2-pipe"] = "one-to-three-forward-t2-pipe",
        -- One to One t3 pipes
        ["one-to-one-forward-t3-pipe"] = "one-to-one-right-t3-pipe",
        ["one-to-one-right-t3-pipe"] = "one-to-one-reverse-t3-pipe",
        ["one-to-one-reverse-t3-pipe"] = "one-to-one-left-t3-pipe",
        ["one-to-one-left-t3-pipe"] = "one-to-one-forward-t3-pipe",
        -- One to Two t3 pipes
        ["one-to-two-parallel-t3-pipe"] = "one-to-two-perpendicular-t3-pipe",
        ["one-to-two-perpendicular-t3-pipe"] = "one-to-two-parallel-t3-pipe",
        ["one-to-two-L-FL-t3-pipe"] = "one-to-two-L-FR-t3-pipe",
        ["one-to-two-L-FR-t3-pipe"] = "one-to-two-L-RR-t3-pipe",
        ["one-to-two-L-RR-t3-pipe"] = "one-to-two-L-RL-t3-pipe",
        ["one-to-two-L-RL-t3-pipe"] = "one-to-two-L-FL-t3-pipe",
        -- One to Three t3 pipes
        ["one-to-three-forward-t3-pipe"] = "one-to-three-right-t3-pipe",
        ["one-to-three-right-t3-pipe"] = "one-to-three-reverse-t3-pipe",
        ["one-to-three-reverse-t3-pipe"] = "one-to-three-left-t3-pipe",
        ["one-to-three-left-t3-pipe"] = "one-to-three-forward-t3-pipe"
}

data.pipetable = {
        ['one-to-two-parallel-pipe'] = 3,
        ['one-to-two-perpendicular-pipe'] = 3,
        ['one-to-two-L-FL-pipe'] = 3,
        ['one-to-two-L-FR-pipe'] = 3,
        ['one-to-two-L-RR-pipe'] = 3,
        ['one-to-two-L-RL-pipe'] = 3,
        ['one-to-three-forward-pipe'] = 4,
        ['one-to-three-right-pipe'] = 4,
        ['one-to-three-reverse-pipe'] = 4,
        ['one-to-three-left-pipe'] = 4,
        ['underground-t-pipe'] = 3,
        ['one-to-four-pipe'] = 5,
        ['underground-cross-pipe'] = 4,
        --T2 pipes
        ['one-to-two-parallel-t2-pipe'] = 3,
        ['one-to-two-perpendicular-t2-pipe'] = 3,
        ['one-to-two-L-FL-t2-pipe'] = 3,
        ['one-to-two-L-FR-t2-pipe'] = 3,
        ['one-to-two-L-RR-t2-pipe'] = 3,
        ['one-to-two-L-RL-t2-pipe'] = 3,
        ['one-to-three-forward-t2-pipe'] = 4,
        ['one-to-three-right-t2-pipe'] = 4,
        ['one-to-three-reverse-t2-pipe'] = 4,
        ['one-to-three-left-t2-pipe'] = 4,
        ['underground-t-t2-pipe'] = 3,
        ['one-to-four-t2-pipe'] = 5,
        ['underground-cross-t2-pipe'] = 4,
        --T3 pipes
        ['one-to-two-parallel-t3-pipe'] = 3,
        ['one-to-two-perpendicular-t3-pipe'] = 3,
        ['one-to-two-L-FL-t3-pipe'] = 3,
        ['one-to-two-L-FR-t3-pipe'] = 3,
        ['one-to-two-L-RR-t3-pipe'] = 3,
        ['one-to-two-L-RL-t3-pipe'] = 3,
        ['one-to-three-forward-t3-pipe'] = 4,
        ['one-to-three-right-t3-pipe'] = 4,
        ['one-to-three-reverse-t3-pipe'] = 4,
        ['one-to-three-left-t3-pipe'] = 4,
        ['underground-t-t3-pipe'] = 3,
        ['one-to-four-t3-pipe'] = 5,
        ['underground-cross-t3-pipe'] = 4
    }

    data.correctBluePrintTable = {
        ['one-to-one-right-pipe'] = 'one-to-one-forward-pipe',
        ['one-to-one-reverse-pipe'] = 'one-to-one-forward-pipe',
        ['one-to-one-left-pipe'] = 'one-to-one-forward-pipe',
        ['one-to-two-L-FR-pipe'] = 'one-to-two-L-FL-pipe',
        ['one-to-two-L-RR-pipe'] = 'one-to-two-L-FL-pipe',
        ['one-to-two-L-RL-pipe'] = 'one-to-two-L-FL-pipe',
        ['one-to-two-parallel-pipe'] = 'one-to-two-perpendicular-pipe',
        ['one-to-three-right-pipe'] = 'one-to-three-forward-pipe',
        ['one-to-three-reverse-pipe'] = 'one-to-three-forward-pipe',
        ['one-to-three-left-pipe'] = 'one-to-three-forward-pipe',
        ['one-to-one-right-t2-pipe'] = 'one-to-one-forward-t2-pipe',
        ['one-to-one-reverse-t2-pipe'] = 'one-to-one-forward-t2-pipe',
        ['one-to-one-left-t2-pipe'] = 'one-to-one-forward-t2-pipe',
        ['one-to-two-L-FR-t2-pipe'] = 'one-to-two-L-FL-t2-pipe',
        ['one-to-two-L-RR-t2-pipe'] = 'one-to-two-L-FL-t2-pipe',
        ['one-to-two-L-RL-t2-pipe'] = 'one-to-two-L-FL-t2-pipe',
        ['one-to-two-perpendicular-t2-pipe'] = 'one-to-two-parallel-t2-pipe',
        ['one-to-three-right-t2-pipe'] = 'one-to-three-forward-t2-pipe',
        ['one-to-three-reverse-t2-pipe'] = 'one-to-three-forward-t2-pipe',
        ['one-to-three-left-t2-pipe'] = 'one-to-three-forward-t2-pipe',
        ['one-to-one-right-t3-pipe'] = 'one-to-one-forward-t3-pipe',
        ['one-to-one-reverse-t3-pipe'] = 'one-to-one-forward-t3-pipe',
        ['one-to-one-left-t3-pipe'] = 'one-to-one-forward-t3-pipe',
        ['one-to-two-L-FR-t3-pipe'] = 'one-to-two-L-FL-t3-pipe',
        ['one-to-two-L-RR-t3-pipe'] = 'one-to-two-L-FL-t3-pipe',
        ['one-to-two-L-RL-t3-pipe'] = 'one-to-two-L-FL-t3-pipe',
        ['one-to-two-perpendicular-t3-pipe'] = 'one-to-two-parallel-t3-pipe',
        ['one-to-three-right-t3-pipe'] = 'one-to-three-forward-t3-pipe',
        ['one-to-three-reverse-t3-pipe'] = 'one-to-three-forward-t3-pipe',
        ['one-to-three-left-t3-pipe'] = 'one-to-three-forward-t3-pipe'
    }
    data.clampedPipeName = {
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
        --[15] = "-clamped-NSEW",
    }
return data