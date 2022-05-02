-- disable inline diagnostics on insert mode
vim.api.nvim_create_augroup("diag", {})
vim.api.nvim_create_autocmd("InsertEnter", {
    desc = "Turn off inline diagnostics on insert mode.",
    group = "diag",
    pattern = "*",
    callback = function()
        vim.diagnostic.config({
            virtual_text = false
        })
    end
})
vim.api.nvim_create_autocmd("InsertLeave", {
    desc = "Turn on inline diagnostics on normal mode.",
    group = "diag",
    pattern = "*",
    callback = function()
        vim.diagnostic.config({
            virtual_text = true
        })
    end
})
