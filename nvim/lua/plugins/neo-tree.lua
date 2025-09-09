return {
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "echasnovski/mini.icons",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        opts = { hint = "floating-big-letter" },
      },
    },
    keys = { { "<Leader>e", "<Cmd>Neotree toggle<CR>", desc = "File Explorer" } },
    ---@module "neo-tree"
    ---@type neotree.Config
    opts = {
      filesystem = { follow_current_file = { enabled = true } },
    },
  },
}
