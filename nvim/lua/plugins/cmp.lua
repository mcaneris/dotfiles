return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			{
				"garymjr/nvim-snippets",
				opts = { friendly_snippets = true },
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			{
				"zbirenbaum/copilot-cmp",
				opts = {},
				config = function(_, opts)
					local copilot_cmp = require("copilot_cmp")
					copilot_cmp.setup(opts)
				end,
			},
		},
		opts = function()
			local cmp = require("cmp")

			local kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				Copilot = "A",
				TypeParameter = "󰅲",
			}

			return {
				auto_brackets = {},
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "snippets" },
					{ name = "path" },
					{ name = "buffer" },
				}),
				window = {
					completion = {
						border = "single",
					},
					documentation = {
						border = "single",
					},
				},
				view = {
					-- entries = { name = "custom", selection_order = "near_cursor" },
				},
				experimental = {
					ghost_text = true,
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(_entry, vim_item)
						-- Highlights
						vim.api.nvim_set_hl(0, "Pmenu", { bg = vim.g.BASE_COLOR })
						vim.api.nvim_set_hl(0, "PmenuSel", { bg = vim.g.SELECTION_COLOR })
						vim.print(vim_item.menu)

						-- Kind Icons
						-- This concatenates the icons with the name of the item kind
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

						local strings = vim.split(vim_item.kind, "%s", { trimempty = true })

						vim_item.kind = " " .. (strings[1] or "") .. " "

						return vim_item
					end,
				},
				mapping = {
					["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				},
			}
		end,
	},
}
