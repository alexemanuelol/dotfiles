local modes = { "n", "i", "v" }
local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }

for _, mode in ipairs(modes) do
  for _, key in ipairs(keys) do
    vim.api.nvim_set_keymap(mode, key, "<Nop>", { noremap = true, silent = true })
  end
end
