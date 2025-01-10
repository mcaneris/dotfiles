return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			integrations = {
        blink_cmp = true,
				diffview = true,
				fidget = true,
				lsp_trouble = true,
				neogit = true,
				neotree = true,
				noice = true,
				notify = true,
				snacks = true,
				treesitter = true,
				which_key = true,
			},
			color_overrides = {
				mocha = {
					mantle = "#1e1e2e",
					crust = "#1e1e2e",
				},
			},
		},
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme("catppuccin")

      -- Set some colors as global variables for refering elsewhere
      vim.g.BASE_COLOR = "#1e1e2e"
      vim.g.SELECTION_COLOR = "#303446"
    end,
	},
}
