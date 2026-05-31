-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Remove Harpoon's <leader>h / <leader>H so helm-schemas can use <leader>h group.
-- Must run after VeryLazy so all plugin keymaps are already registered.
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
    pcall(vim.keymap.del, "n", "<leader>h")
    pcall(vim.keymap.del, "n", "<leader>H")
  end,
})


