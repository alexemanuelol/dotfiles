local map = vim.keymap.set
local opts = { noremap = false, silent = true }

-- Disable arrow keys
local modes = { "n", "i", "v" }
local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
for _, mode in ipairs(modes) do
  for _, key in ipairs(keys) do
    map(mode, key, "<Nop>", { silent = true })
  end
end

map("n", "<Space>", "", {})     -- Clear mapping of space

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

map("v", "<Leader>y", [["+y]], opts)        -- Yank
map("n", "<Leader>p", [["+p]], opts)        -- Paste
map("n", "<Leader>N", ":enew<CR>", opts)    -- Create empty buffer

-- Navigate between windows (splits)
map("n", "<C-h>", ":wincmd h<CR>", opts)
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)

-- Resize windows (splits)
local resize_step = 4
map("n", "<M-C-h>", ":vertical resize -" .. resize_step .. "<CR>", opts)
map("n", "<M-C-j>", ":resize +" .. resize_step .. "<CR>", opts)
map("n", "<M-C-k>", ":resize -" .. resize_step .. "<CR>", opts)
map("n", "<M-C-l>", ":vertical resize +" .. resize_step .. "<CR>", opts)

-- Quickfix navigation
map("n", "<Leader>qn", ":cnext<CR>", opts)
map("n", "<Leader>qp", ":cprev<CR>", opts)

map("n", "<Leader>sl", ":set list!<CR>", opts)              -- Toggle list
map("n", "<Leader>sr", ":set relativenumber!<CR>", opts)    -- Toggle relative number
map("n", "<Leader>rt", ":retab!<CR>", opts)                 -- Replace tabs with spaces
map("n", "<Leader><Leader>", "za", opts)                    -- Toggle fold
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)              -- Clear highlights on search

-- Search & Replace
map("x", "<Leader>sr", 'y:%s%<C-r>"%%g<Left><Left>', { noremap = true })
map("x", "<Leader>sc", 'y:%s%<C-r>"%%gc<Left><Left><Left>', { noremap = true })

-- Change scroll step for Ctrl+E and Ctrl+Y
local scroll_step = 2
map("", "<C-e>", scroll_step .. "<C-e>", opts)
map("", "<C-y>", scroll_step .. "<C-y>", opts)

-- Move selected lines in visual mode
map("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Re-indent while in visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Replace visual selection without clobbering clipboard
map("v", "p", '"_dP', opts)

-- Remove trailing whitespace
map("n", "<Leader>dw", require("utils").clean_trailing_spaces, opts)

-- Create & close tabs
map("n", "<Leader>tn", ":tabnew<CR>", opts)      -- New tab
map("n", "<Leader>te", ":tabedit ", opts)        -- Edit file in new tab (awaits filename)
map("n", "<Leader>tc", ":tabclose<CR>", opts)    -- Close current tab
map("n", "<Leader>to", ":tabonly<CR>", opts)     -- Close all other tabs

-- Navigate tabs
map("n", "<Leader>tl", ":tabnext<CR>", opts)    -- Next tab
map("n", "<Leader>th", ":tabprev<CR>", opts)    -- Previous tab
map("n", "<Leader>t1", "1gt", opts)             -- Go to tab 1
map("n", "<Leader>t2", "2gt", opts)             -- Go to tab 2
map("n", "<Leader>t3", "3gt", opts)             -- Go to tab 3

-- Move current tab
map("n", "<Leader>tm", ":tabmove<Space>", opts) -- Move tab (waits for number)
