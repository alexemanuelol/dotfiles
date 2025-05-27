local M = {}

function M.clean_trailing_spaces()
    local old_cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, old_cursor)
end

return M
