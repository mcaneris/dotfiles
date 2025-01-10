return {
	{
		"stevearc/conform.nvim",
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				elixir = { "mix" },
				rust = { "rustfmt", lsp_format = "prefer" },
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
