return {
    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "SudaRead" }
    },
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            opts.section.header.val = {
                [[                                  __]],
                [[     ___     ___    ___   __  __ /\_\    ___ ___]],
                [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
                [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
                [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }
            opts.config.layout[3].val = 2
        end,
    }
}
