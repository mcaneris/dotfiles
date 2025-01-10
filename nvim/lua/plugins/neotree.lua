return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = false,
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		buffers = {
			follow_current_file = { enabled = true, leave_dirs_open = true },
		},
		window = {
			width = 30,
			mappings = {
				["<leader>e"] = "close_window",
			},
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function(_)
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
}
