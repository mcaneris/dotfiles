return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      components = {
        -- Only show the name of the root directory rather than the full path
        -- i.e. `nvim` instead of `/home/user/nvim`
        name = function(config, node, state)
          local result = require("neo-tree.sources.filesystem.components").name(config, node, state)

          if node:get_depth() == 1 and node.type ~= "message" then
            result.text = vim.fn.fnamemodify(node.path, ":t")
          end

          return result
        end,
      },
    },
    buffers = {
      follow_current_file = { enabled = true, leave_dirs_open = true },
    },
    window = {
      position = "float",
      popup = {
        title = function(_) -- format the text that appears at the top of a popup window
          -- return "Neo-tree " .. state.name:gsub("^%l", string.upper)
          return ""
        end,
        -- you can also specify border here, if you want a different setting from
        -- the global popup_border_style.
      },
    },
    popup_border_style = "rounded",
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
