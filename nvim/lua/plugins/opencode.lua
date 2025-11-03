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
      desc = "Execute opencode action…",
      mode = { "n", "x" },
    },
    {
      "<C-.>",
      function()
        require("opencode").toggle()
      end,
      desc = "Toggle opencode",
      mode = { "n", "t" },
    },
    {
      "<S-C-u>",
      function()
        require("opencode").command("session.half.page.up")
      end,
      desc = "opencode half page up",
      mode = { "n", "t" },
    },
    {
      "<S-C-d>",
      function()
        require("opencode").command("session.half.page.down")
      end,
      desc = "opencode half page down",
      mode = { "n", "t" },
    },
  },
}
