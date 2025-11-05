return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  keys = {
    {
      "<leader>a",
      function()
        require("opencode").select()
      end,
      desc = "AI Select",
      mode = { "n", "x" },
    },
    {
      "<C-.>",
      function()
        require("opencode").toggle()
      end,
      desc = "AI",
      mode = { "n", "t" },
    },
  },
}
