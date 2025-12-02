return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      auto_integrations = true,
      custom_highlights = function(colors)
        return { WinSeparator = { fg = colors.overlay0 } }
      end,
    },
  },
  { "folke/tokyonight.nvim" },
  { "sainnhe/gruvbox-material" },
  { "rebelot/kanagawa.nvim" },
}
