data:extend(
    {
        -- ONE TO ONE PIPES
        {
            type = 'recipe',
            name = "80-overflow-valve",
            ingredients = {
                {'pipe', 1},
            },
            enabled = true,
            result = "80-overflow-valve"
        },
        -- ONE TO TWO PIPES
        {
            type = 'recipe',
            name = "80-top-up-valve",
            ingredients = {
                {'pipe', 1},
            },
            enabled = true,
            result = "80-top-up-valve"
        },
        --[[{
            type = 'recipe',
            name = "50-mini-flow-valve",
            ingredients = {
                {'pipe', 1},
            },
            enabled = true,
            result = "50-mini-flow-valve"
        }]]
    }
)
