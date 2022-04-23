return function()
    local set = vim.opt

    -- indentation
    set.tabstop = 4
    set.shiftwidth = 4
    set.expandtab = true

    -- filetypes
    require("user.filetype").setup()

    -- mappings
    require("user.mappings").setup()
end
