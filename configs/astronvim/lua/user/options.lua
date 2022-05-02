-- indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- filetypes
vim.filetype.add {
    pattern = {
        ["[Dd]ockerfile%.*.*"] = "dockerfile"
    }
}
