return {
    colorscheme = pcall(require, "nightfox") and "nightfox" or "default_theme",
    lsp = require "user.lsp",
    ["which-key"] = require "user.which-key",

    polish = function()
        require "user.options"
        require "user.autocmds"
    end
}
