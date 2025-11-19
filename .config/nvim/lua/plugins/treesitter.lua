return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})
    local ensure_installed = { "bash", "go", "lua", "markdown_inline", "vim", "vimdoc" }
    ts.install(vim.tbl_filter(function(lang)
      return not vim.tbl_contains(ts.get_installed("parsers"), lang)
    end, ensure_installed))
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not vim.list_contains(ts.get_installed("parsers"), lang) then
          return
        end
        vim.treesitter.start()
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
