return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = { { "<leader>?", "<cmd>WhichKey<cr>", desc = "WhichKey" } },
  opts = {
    preset = "helix",
    spec = {
      { "<Leader>c", group = "Code" },
      { "<Leader>d", group = "Debug" },
      { "<Leader>f", group = "Find" },
      { "<Leader>g", group = "Git" },
      { "<Leader>o", group = "Overseer" },
      { "<Leader>s", group = "Search" },
      { "<Leader>t", group = "Test" },
      { "<Leader>u", group = "UI" },
    },
  },
}
