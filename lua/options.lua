local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
---LSP
vim.diagnostic.config({
	virtual_lines = { current_line = true },
	virtual_text = false,
})

o.laststatus = 3
o.showmode = false
o.splitkeep = "screen"
o.termguicolors = true

-- Use system clipboard for all yank/delete/change/put
-- o.clipboard = "unnamedplus" 

o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.wrap = false

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "h"

-- Numbers
o.number = true
opt.relativenumber = true -- show relative numbers
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 300

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
