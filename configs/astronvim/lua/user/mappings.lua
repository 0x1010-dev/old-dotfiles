return {
    setup = function()
        local wk = require('which-key')

        -- suda.vim
        wk.register({
            W = { "<cmd>SudaWrite<cr>", "Sudo Save" }
        }, { prefix = "<leader>" })
    end
}
