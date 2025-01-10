-- ~/.config/nvim/lua/tasks/some_tasks.lua
local M = {}

M.is_available = function()
	return vim.fn.filereadable("Cargo.toml") == 1
end

M.tasks = {
	{
		name = "RUST: Cargo run",
		builder = function()
			return { cmd = { "cargo run" } }
		end,
	},
	{

		name = "RUST: Cargo nextest run",
		builder = function()
			return { cmd = { "cargo nextest run" } }
		end,
	},
}

return M
