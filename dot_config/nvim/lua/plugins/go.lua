return {
  -- gopls: enhanced settings on top of LazyVim defaults
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              -- completion
              usePlaceholders = true,
              completeUnimported = true,
              deepCompletion = true,
              -- analysis
              staticcheck = true,
              analyses = {
                nilness = true,
                shadow = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                fieldalignment = false, -- noisy, off by default
              },
              -- inlay hints (GoLand-style)
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              -- code lenses (run/test buttons in file)
              codelenses = {
                gc_details = true, -- show escape analysis
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              gofumpt = true,
              semanticTokens = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-node_modules" },
            },
          },
        },
      },
    },
  },

  -- neotest: test runner panel (GoLand's test tab)
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "fredrikaverpil/neotest-golang" },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          go_test_args = { "-v", "-race", "-count=1" },
          dap_go_enabled = true,
        },
      },
    },
  },

  -- conform: format on save with goimports + gofumpt
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },

  -- golangci-lint via nvim-lint
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
      },
    },
  },

  -- gomodifytags + impl code actions
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
      })
    end,
  },
}
