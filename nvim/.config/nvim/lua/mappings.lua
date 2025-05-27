local opts = { noremap = false, silent = true }

local modes = { "n", "i", "v" }
local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }

for _, mode in ipairs(modes) do
  for _, key in ipairs(keys) do
    vim.api.nvim_set_keymap(mode, key, "<Nop>", { noremap = true, silent = true })
  end
end

-- Yank & paste
vim.keymap.set("v", "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>p", [["+p]], opts)

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
