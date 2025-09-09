return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        blink_cmp = true,
        dap = true,
        dap_ui = true,
        gitsigns = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotest = true,
        overseer = true,
        semantic_tokens = true,
        snacks = true,
        treesitter = true,
        which_key = true,
        window_picker = true,
      },
      custom_highlights = function(colors)
        return { WinSeparator = { fg = colors.overlay0 } }
      end,
    },
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    priority = 1000,
    opts = {
      style = "light",
      transparent = false,
    },
  },
}
