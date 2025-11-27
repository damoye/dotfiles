return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "j-hui/fidget.nvim", opts = {} },
    "mason-org/mason.nvim",
  },
  config = function()
    vim.lsp.config("gopls", { settings = { gopls = { staticcheck = true, semanticTokens = true } } })
    vim.lsp.config("lua_ls", { settings = { Lua = { completion = { callSnippet = "Replace" } } } })
    vim.lsp.enable({ "gopls", "lua_ls", "vtsls" })
    vim.diagnostic.config({
      virtual_text = { source = "if_many" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚",
          [vim.diagnostic.severity.WARN] = "󰀪",
          [vim.diagnostic.severity.INFO] = "󰋽",
          [vim.diagnostic.severity.HINT] = "󰌶",
        },
      },
      severity_sort = true,
    })
  end,
}
