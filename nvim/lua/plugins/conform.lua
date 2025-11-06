return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = { lua = { "stylua" } },
    format_on_save = function()
      if vim.g.autoformat then
        return { timeout_ms = 5000, lsp_format = "fallback" }
      end
    end,
  },
  config = function(_, opts)
    require("conform").setup(opts)
    vim.g.autoformat = true
    Snacks.toggle({
      name = "Auto Format",
      get = function()
        return vim.g.autoformat
      end,
      set = function(state)
        vim.g.autoformat = state
      end,
    }):map("<Leader>uf")
  end,
}
