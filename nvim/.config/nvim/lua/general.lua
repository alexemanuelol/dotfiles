-- Line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5         -- Minimum width of line number column
vim.opt.signcolumn = "yes"      -- For git signs, diagnostics, etc..
vim.opt.foldcolumn = "1"        -- For code folding indicators

-- Indentation
vim.opt.tabstop = 4         -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4      -- Number of spaces used for each level of indentation
vim.opt.softtabstop = 4     -- Number of spaces that a <Tab> feels like when editing
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.smarttab = true     -- Makes <Tab> in front of a line behave smarter
vim.opt.autoindent = true   -- Copy indent from current line when starting a new one
vim.opt.smartindent = true  -- Smart auto-indentation (mostly for C-like syntax)
vim.opt.cindent = false     -- C-style indent
vim.opt.breakindent = true  -- Indent wrapped lines
vim.opt.copyindent = true   -- Copy indentation from current line to the new line

-- Cursor
vim.opt.cursorline = true   -- Highlight current line
vim.opt.wrap = true         -- Wrap text
vim.opt.linebreak = true    -- Makes wrapped lines break at "nice" points, instead of mid-word

-- Search
vim.opt.hlsearch = true     -- Highlight search
vim.opt.incsearch = true    -- Show pattern as it was typed so far
vim.opt.ignorecase = true   -- Ignore case in searches
vim.opt.smartcase = true    -- Override ignorecase if search pattern contains an uppercase letter
vim.opt.showmatch = true    -- Show matching opening character ), ], }

-- Navigation
vim.opt.splitright = true   -- Splitting a window (:vsplit) will put the new window right of the current one
vim.opt.splitbelow = true   -- Splitting a window (:split) will put the new window below the current one
vim.opt.scrolloff = 2       -- Scroll margin

-- Other
vim.opt.mouse = ""          -- Disable mouse support completely, to force myself to stop using it
vim.opt.updatetime = 500    -- Time to wait before triggering certain events (ms)
vim.opt.autoread = true     -- If file changed outside vim, automatically read it again
-- vim.opt.columns = 120    -- Max columns
vim.opt.conceallevel = 2    -- Hide text like markdown syntax (e.g. **bold**)
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.foldmethod = "marker"

vim.opt.backspace = {       -- Enable backspace to delete over:
    "indent",
    "eol",
    "start"
}

vim.opt.list = false    -- Run :set (no)list to toggle
vim.opt.listchars = {   -- Show invisible characters
    eol = "↲",
    tab = "→ ",
    space = "·",
    trail = "•",
    extends = "»",      -- Visible when wrap = false
    precedes = "«",     -- Visible when wrap = false
    nbsp = "␣"          -- Shows for non-breaking space
}
