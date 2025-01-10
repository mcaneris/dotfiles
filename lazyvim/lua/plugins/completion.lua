return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = { border = "rounded", scrollbar = false },
        documentation = { window = { border = "rounded" } },
      },
      keymap = {
        preset = "enter",
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
      },
    },
  },
}
