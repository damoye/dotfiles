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
      require("nvim-treesitter-textobjects").setup(opts)

      local function map_move(key, method, query)
        local dir, pos = string.match(method, "[^_]+_([^_]+)_([^_]+)")
        dir = dir:sub(1, 1):upper() .. dir:sub(2)
        vim.keymap.set({ "n", "x", "o" }, key, function()
          require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
        end, { desc = table.concat({ dir, query, pos }, " ") })
      end
      map_move("]f", "goto_next_start", "@function.outer")
      map_move("]F", "goto_next_end", "@function.outer")
      map_move("[f", "goto_previous_start", "@function.outer")
      map_move("[F", "goto_previous_end", "@function.outer")
      map_move("]c", "goto_next_start", "@class.outer")
      map_move("]C", "goto_next_end", "@class.outer")
      map_move("[c", "goto_previous_start", "@class.outer")
      map_move("[C", "goto_previous_end", "@class.outer")

      local function map_select(key, query)
        vim.keymap.set({ "x", "o" }, key, function()
          require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
        end, { desc = query })
      end
      map_select("af", "@function.outer")
      map_select("if", "@function.inner")
      map_select("ac", "@class.outer")
      map_select("ic", "@class.inner")
    end,
  },
}
