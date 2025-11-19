return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  keys = {
    { "<Leader>gb", "<Cmd>Gitsigns blame<CR>", desc = "Blame" },
    { "<Leader>gd", "<Cmd>Gitsigns diffthis<CR>", desc = "Diff" },
    { "<Leader>gD", "<Cmd>Gitsigns diffthis ~<CR>", desc = "Diff ~" },
  },
  opts = {},
}
