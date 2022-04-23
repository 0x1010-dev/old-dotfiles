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
    }
}
