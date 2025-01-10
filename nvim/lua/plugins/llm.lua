return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			auto_refresh = true,
			suggestion = { enabled = false, auto_trigger = true },
			panel = { enabled = false },
			filetypes = {
				rust = true,
				markdown = true,
				help = true,
			},
		},
		config = function(_, opts)
			require("copilot").setup(opts)
		end,
	},
}
