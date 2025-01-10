return {
	{
		"miroshQa/rittli.nvim",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{
				"<C-t>",
				function()
					require("rittli.terminal_tweaks").toggle_last_openned_terminal()
				end,
				mode = { "n", "t" },
			},
			{ "<Esc><Esc>", "<C-\\><C-n>", mode = "t" },
			{
				"<leader>r",
				function()
					require("rittli.core.telescope").tasks_picker()
				end,
				desc = "Pick the task",
			},
			{
				"<leader><leader>",
				function()
					require("telescope.builtin").buffers({
						path_display = { "tail" },
						sort_mru = true,
						ignore_current_buffer = true,
					})
				end,
			},
		},
		config = function()
			require("rittli").setup({})
		end,
	},
}
