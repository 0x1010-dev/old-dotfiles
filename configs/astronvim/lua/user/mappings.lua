return {
    setup = function()
        local map = vim.keymap.set

        -- suda.vim
        map("n", "<leader>W", ":SudaWrite<CR>")
    end
}
