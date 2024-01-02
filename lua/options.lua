-- Line number
vim.o.number = true
vim.o.relativenumber = true

-- Indenting
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true

-- No word wrap
vim.o.wrap = false

-- Undo history
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
vim.o.undofile = true

-- Highlight search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Highlight cursorline
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

-- Spelling
vim.o.spelllang = "en_us"
vim.o.spell = true

-- Number of lines to keep above and below the cursor
vim.o.scrolloff = 6
vim.o.signcolumn = "yes:1"

-- Controls "CursorHold" and "CursorHoldI" delays
vim.o.updatetime = 200
