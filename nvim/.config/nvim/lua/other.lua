
vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "red" })

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    callback = function()
        vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
    end
})
