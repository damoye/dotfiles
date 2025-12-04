return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    keys = {
      { "<Leader>gd", "<Cmd>Gitsigns diffthis<CR>", desc = "Diff" },
      { "<Leader>gD", "<Cmd>Gitsigns diffthis ~<CR>", desc = "Diff ~" },
    },
    opts = {},
  },
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<Leader>gb", "<Cmd>BlameToggle<CR>", desc = "Blame" },
    },
    opts = {
      blame_options = { "-w" },
    },
  },
}
