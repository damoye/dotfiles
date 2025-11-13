local function term_nav(dir)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
      vim.cmd.wincmd(dir)
    end)
  end
end
return {
  "folke/snacks.nvim",
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = {
      win = {
        keys = {
          nav_h = { "<C-h>", term_nav("h"), desc = "Left", expr = true, mode = "t" },
          nav_j = { "<C-j>", term_nav("j"), desc = "Down", expr = true, mode = "t" },
          nav_k = { "<C-k>", term_nav("k"), desc = "Up", expr = true, mode = "t" },
          nav_l = { "<C-l>", term_nav("l"), desc = "Right", expr = true, mode = "t" },
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<c-/>", function() Snacks.terminal() end, mode = {"n", "t"}, desc = "Terminal" },
    { "gr", function() Snacks.picker.lsp_references() end, desc = "References"},
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Implementations"},
    {
      "gR",
      function()
        Snacks.picker.lsp_references({
          filter = {
            filter = function(item)
              local suffix = "_test.go"
              return item.file:sub(-#suffix) ~= suffix
            end,
          },
        })
      end,
      desc = "References exclude test",
    },
    { "<Leader>ff", function() Snacks.picker.files({ root = false }) end, desc = "Files" },
    { "<Leader>fr", function() Snacks.picker.recent({ filter = { cwd = true }}) end, desc = "Recent" },
    { "<Leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config" },
    { "<Leader>fR", function() Snacks.picker.resume() end, desc = "Resume" },

    { "<Leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<Leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },

    { "<Leader>n", function() Snacks.picker.notifications() end, desc = "Notifications" },

    { "<Leader>sg", function() Snacks.picker.grep({ root = false }) end, desc = "Grep" },
    { "<Leader>sG", function() Snacks.picker.grep({ root = false, exclude = {"*_test.go"} }) end, desc = "Grep exclude test" },
    { "<Leader>sw", function() Snacks.picker.grep_word({ root = false }) end, desc = "Word", mode = { "n", "x" } },
    { "<Leader>sW", function() Snacks.picker.grep_word({ root = false, exclude = {"*_test.go"} }) end, desc = "Word exclude test", mode = { "n", "x" } },
    { "<Leader>sh", function() Snacks.picker.help() end, desc = "Helps" },
    { "<Leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },

    { "<Leader>uc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<Leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.toggle.indent():map("<Leader>ug")
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<Leader>uw")
      end,
    })
  end,
}
