local telescope_builtin = require("telescope.builtin")
local wk = require("which-key")

-- which-key.nvim
wk.add({
	{ "<leader>f", group = "Search" },
	{ "<leader>g", group = "Git" },
	{ "<leader>b", group = "Buffer" },
	{ "<leader>h", group = "Help" },
	{ "<leader>t", group = "Test" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>w", group = "Window" },
})

-- Window
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Buffers
vim.keymap.set("n", "<leader>bl", telescope_builtin.buffers, { desc = "List Buffers" })

vim.keymap.set("n", "<leader>b?", function()
	wk.show({ global = false })
end, { desc = "Keymap (Buffer)" })

vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Delete Buffer
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer & Window" })

vim.keymap.set("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

-- Format Buffer
vim.keymap.set("n", "<leader>bf", function()
	require("conform").format({ async = true })
end, { desc = "Format Buffer" })

-- Search
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Grep" })

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Help
-- List Help Tags
vim.keymap.set("n", "<leader>hl", telescope_builtin.help_tags, { desc = "List Help Tags" })

-- Show Diagnostics
vim.keymap.set("n", "<leader>hd", function()
	vim.diagnostic.open_float({ scope = "cursor", border = "single" })
end, { desc = "Show Diagnostics" })

-- Neotree
vim.keymap.set("n", "e", "<cmd>Neotree toggle<cr>", { desc = "Explore" })

-- Telescope

-- Terminal
vim.keymap.set("n", "<leader>T", function()
	Snacks.terminal()
end, { desc = "Terminal (cwd)" })

-- Snacks
vim.keymap.set("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })

-- Git
vim.keymap.set("n", "<leader>gb", function()
	Snacks.git.blame_line()
end, { desc = "Git Blame Line" })

-- Jump

vim.keymap.set("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })

vim.keymap.set("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Previous Reference" })

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Previous Diagnostic" })
