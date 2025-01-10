return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		opts = {
			servers = {
				lua_ls = {},
				rust_analyzer = {
					on_attach = function(_, _) end,
					settings = {
						["rust-analyzer"] = {
							rustfmt = {
								extraArgs = { "+nightly" },
							},
							check = {
								command = "clippy",
								workspace = true,
							},
							cargo = {
								allTargets = true,
								allFeatures = true,
								loadOutDirsFromCheck = true,
								buildScripts = {
									enable = true,
								},
							},
							checkOnSave = true,
							diagnostics = {
								enable = true,
							},
							inlayHints = {
								closureCaptureHints = { enable = true },
								closureReturnTypeHints = { enable = true },
								lifetimeElisionHints = { enable = true, useParameterNames = true },
								expressionAdjustmentHints = { enable = true },
								discriminantHints = { enable = true },
								bindingModeHints = { enable = true },
								genericParameterHints = {
									enable = true,
									lifetime = { enable = true },
									const = { enable = true },
									type = { enable = true },
								},
								implicitDrops = { enable = false },
							},
							files = {
								excludeDirs = {
									".direnv",
									".git",
									".github",
									".gitlab",
									"bin",
									"node_modules",
									"target",
									"venv",
									".venv",
								},
							},
							procMacro = {
								enable = true,
								ignored = {
									["async-trait"] = {},
									["napi-derive"] = { "napi" },
									["async-recursion"] = { "async_recursion" },
								},
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			local lspconfig_defaults = require("lspconfig").util.default_config

			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)

			-- This is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.lsp.inlay_hint.enable(true, { 0 })
					vim.api.nvim_set_hl(0, "LspInlayHint", { bg = vim.g.BASE_COLOR, fg = "#7f849c", italic = true })

					vim.keymap.set("n", "<leader>lI", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { 0 })
					end, { desc = "Toggle Inlay Hints" })

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})

			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("cmp_nvim_lsp").default_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
