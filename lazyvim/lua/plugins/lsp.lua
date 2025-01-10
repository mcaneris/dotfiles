return {
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
        -- Lua
        lua_ls = {},

        -- Rust
        rust_analyzer = {
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
  },
}
