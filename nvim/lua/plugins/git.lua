return {
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    keys = { { "<Leader>gb", "<Cmd>BlameToggle<CR>", desc = "Git Blame" } },
    opts = { blame_options = { "-w" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    keys = {
      { "<Leader>gd", "<Cmd>Gitsigns diffthis<CR>", desc = "Git Diff" },
      { "<Leader>gD", "<Cmd>Gitsigns diffthis ~<CR>", desc = "Git Diff ~" },
    },
    opts = {},
  },
}
