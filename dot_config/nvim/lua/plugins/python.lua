-- Switch to basedpyright (strict superset of pyright with better type inference)
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

return {
  -- basedpyright: better type inference and diagnostics than pyright
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                autoImportCompletions = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
              -- enable all fixable rules for code actions
              fixAll = true,
              organizeImports = true,
            },
          },
        },
      },
      setup = {
        ruff = function()
          Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
            client.server_capabilities.hoverProvider = false
          end)
        end,
        basedpyright = function(_, opts)
          -- suppress the "Failed to parse pyproject.toml" warning that fires on
          -- uv-specific fields (e.g. [tool.uv.scripts]) which basedpyright's
          -- settings discovery doesn't recognise
          opts.handlers = vim.tbl_extend("force", opts.handlers or {}, {
            ["window/showMessage"] = function(err, result, ctx, config)
              if result and result.message and result.message:find("Failed to parse") then
                return
              end
              vim.lsp.handlers["window/showMessage"](err, result, ctx, config)
            end,
          })
        end,
      },
    },
  },

  -- DAP: debugpy for Python debugging (PyCharm-style debug panel)
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mfussenegger/nvim-dap-python",
        keys = {
          { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug Method", ft = "python" },
          { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug Class", ft = "python" },
        },
        config = function()
          -- use debugpy from mason
          local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
          require("dap-python").setup(mason_path)
        end,
      },
    },
  },

  -- neotest: test runner panel (PyCharm's test tab)
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "nvim-neotest/neotest-python" },
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
          -- picks up the active venv from venv-selector
          python = function()
            local venv = vim.fn.getenv("VIRTUAL_ENV")
            if venv ~= vim.NIL and venv ~= "" then
              return venv .. "/bin/python"
            end
            return "python"
          end,
        },
      },
    },
  },

  -- venv-selector: auto-activate venv on project open (like JetBrains)
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      settings = {
        search = {
          -- auto-activate when a .venv exists in the project root
          auto_activate = true,
        },
      },
    },
  },

  -- blink.cmp: auto brackets for Python function calls
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
      },
    },
  },
}
