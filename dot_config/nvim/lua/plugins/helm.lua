return {

  { "gijsentius/helm-schemas.nvim", lazy = false, opts = {} },

  -- Helm filetype detection (sets ft=helm for files in templates/)
  { "towolf/vim-helm", ft = "helm", optional = true },

  -- Formatting: prettier for yaml
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = { formatters_by_ft = { yaml = { "prettier" } } },
  },

  -- Linting: yamllint on save
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        yaml = { "yamllint" },
        helm = { "yamllint" },
      },
    },
  },

}
