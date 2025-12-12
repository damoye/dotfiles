return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function(_, opts)
      local TS = require("nvim-treesitter")
      TS.setup(opts)
      local installed = TS.get_installed("parsers")
      TS.install(vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, { "bash", "go", "lua", "markdown", "markdown_inline", "vim", "vimdoc" }))
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not vim.list_contains(TS.get_installed("parsers"), lang) then
            return
          end
          vim.treesitter.start(args.buf)
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = { move = { set_jumps = true } },
    config = function(_, opts)
      local TS = require("nvim-treesitter-textobjects")
      TS.setup(opts)

      local function map(key, method, query)
        local dir, pos = string.match(method, "[^_]+_([^_]+)_([^_]+)")
        dir = dir:sub(1, 1):upper() .. dir:sub(2)
        local obj = query:gsub("@", ""):gsub("%..*", "")
        local desc = dir .. " " .. obj .. " " .. pos
        vim.keymap.set({ "n", "x", "o" }, key, function()
          require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
        end, { desc = desc })
      end
      map("]m", "goto_next_start", "@function.outer")
      map("]M", "goto_next_end", "@function.outer")
      map("[m", "goto_previous_start", "@function.outer")
      map("[M", "goto_previous_end", "@function.outer")

      map("]c", "goto_next_start", "@class.outer")
      map("]C", "goto_next_end", "@class.outer")
      map("[c", "goto_previous_start", "@class.outer")
      map("[C", "goto_previous_end", "@class.outer")
    end,
  },
}
