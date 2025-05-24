vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

require("general")

-- Make background transparent
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })       -- Main text area
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })  -- Floating windows
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })  -- Borders of floats
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })        -- Popup menu (autocomplete)
