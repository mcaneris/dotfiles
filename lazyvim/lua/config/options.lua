-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.BASE_COLOR = "#1e1e2e"
vim.g.SELECTION_COLOR = "#303446"

vim.api.nvim_set_hl(0, "PMenu", { bg = vim.g.BASE_COLOR })
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = vim.g.BASE_COLOR })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = vim.g.BASE_COLOR })
