vim.g.have_nerd_font = true
vim.g.snacks_animate = true
vim.g.lazyvim_pickrer = "telescope" -- Use telescope as picker

vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.swapfile = false

vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.cursorline = false -- Disable highlighting of the current line

vim.opt.nu = true -- set line numbers -- set line numbers
vim.opt.relativenumber = true -- use relative line numbers

vim.opt.wrap = false

vim.opt.cmdheight = 0 -- Hide command line
vim.opt.laststatus = 0 -- Hide status line

vim.opt.incsearch = true -- incremental search
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.diagnostic.config({
	virtual_text = false,
	float = { enabled = true, border = "single" },
	jump = { float = true },
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})
