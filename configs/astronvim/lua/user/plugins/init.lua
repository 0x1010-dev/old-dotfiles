return {
    {
        "lambdalisue/suda.vim",
        cmd = {
            "SudaRead",
            "SudaWrite"
        }
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup(require "user.plugins.nightfox")
        end
    },
    {
        "wfxr/minimap.vim",
        -- cmd = {
        --     "Minimap",
        --     "MinimapClose",
        --     "MinimapToggle"
        -- },
        setup = function()
            vim.g.minimap_auto_start = 1
            vim.g.minimap_auto_start_win_enter = 1
        end
    }
}
