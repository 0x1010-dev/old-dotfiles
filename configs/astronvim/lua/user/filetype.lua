return {
    setup = function()
        vim.filetype.add {
            pattern = {
                ["[Dd]ockerfile%.*.*"] = "dockerfile",
            },
        }
    end
}


