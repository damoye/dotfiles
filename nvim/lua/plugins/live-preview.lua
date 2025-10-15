return {
  "brianhuster/live-preview.nvim",
  ft = { "markdown" },
  keys = {
    { "<Leader>ps", "<cmd>LivePreview start<cr>", desc = "Preview Start" },
    { "<Leader>pc", "<cmd>LivePreview close<cr>", desc = "Preview Close" },
    { "<Leader>pp", "<cmd>LivePreview pick<cr>", desc = "Preview Pick" },
  },
  dependencies = {
    "folke/snacks.nvim",
  },
}
