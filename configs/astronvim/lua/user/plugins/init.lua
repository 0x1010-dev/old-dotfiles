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
        setup = function()
            vim.g.minimap_auto_start = 1
            vim.g.minimap_auto_start_win_enter = 1

            vim.api.nvim_create_autocmd('WinEnter', {
                pattern = "*",
                callback = function()
                    local mmwinnr = vim.fn.bufwinnr("-MINIMAP-")

                    if mmwinnr == -1 then
                        return
                    end

                    if vim.fn.winnr() == mmwinnr then
                        vim.api.nvim_command("wincmd t")
                    end
                end
            })
        end
    }
}
