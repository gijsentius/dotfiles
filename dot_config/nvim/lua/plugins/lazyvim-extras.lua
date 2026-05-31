local extras = {
  "lazyvim.plugins.extras.dap.core",
  "lazyvim.plugins.extras.coding.mini-comment",
  "lazyvim.plugins.extras.coding.mini-surround",
  "lazyvim.plugins.extras.editor.harpoon2",
  "lazyvim.plugins.extras.editor.mini-files",
  "lazyvim.plugins.extras.editor.mini-move",
  "lazyvim.plugins.extras.editor.refactoring",
  "lazyvim.plugins.extras.editor.snacks_picker",
  "lazyvim.plugins.extras.editor.snacks_explorer",
  "lazyvim.plugins.extras.lang.cmake",
  "lazyvim.plugins.extras.lang.docker",
  "lazyvim.plugins.extras.lang.go",
  "lazyvim.plugins.extras.lang.helm",
  "lazyvim.plugins.extras.lang.json",
  "lazyvim.plugins.extras.lang.markdown",
  "lazyvim.plugins.extras.lang.python",
  "lazyvim.plugins.extras.lang.toml",
  "lazyvim.plugins.extras.lang.yaml",
  "lazyvim.plugins.extras.util.chezmoi",
  "lazyvim.plugins.extras.util.project",
}

if vim.fn.has("mac") == 1 then
  vim.list_extend(extras, {
    "lazyvim.plugins.extras.ai.claudecode",
    "lazyvim.plugins.extras.ai.copilot",
  })
end

return {
  {
    "LazyVim/LazyVim",
    opts = { extras = extras },
  },
}
