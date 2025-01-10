return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      color_overrides = {
        mocha = {
          mantle = "#1e1e2e",
          crust = "#1e1e2e",
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = {
        fill = { bg = vim.g.BASE_COLOR },
        background = { bg = vim.g.BASE_COLOR },
        diagnostic = { bg = vim.g.BASE_COLOR },
        hint = { bg = vim.g.BASE_COLOR },
        info = { bg = vim.g.BASE_COLOR },
        error = { bg = vim.g.BASE_COLOR },
        info_diagnostic = { bg = vim.g.BASE_COLOR },
        hint_diagnostic = { bg = vim.g.BASE_COLOR },
        error_diagnostic = { bg = vim.g.BASE_COLOR },
        modified = { bg = vim.g.BASE_COLOR },
        modified_visible = { bg = vim.g.BASE_COLOR },
        modified_selected = { bg = vim.g.BASE_COLOR },
        tab_close = { bg = vim.g.BASE_COLOR },
        separator = { bg = vim.g.BASE_COLOR, fg = vim.g.BASE_COLOR },
        separator_selected = { bg = vim.g.BASE_COLOR },
        close_button = { bg = vim.g.BASE_COLOR },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
