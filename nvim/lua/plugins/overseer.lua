return {
  "stevearc/overseer.nvim",
  dependencies = { "nvim-lualine/lualine.nvim" },
  keys = {
    { "<Leader>ow", "<Cmd>OverseerToggle<CR>", desc = "Overseer Toggle" },
    { "<Leader>oo", "<Cmd>OverseerRun<CR>", desc = "Overseer Run" },
    { "<Leader>ot", "<Cmd>OverseerTaskAction<CR>", desc = "Overseer Task action" },
    { "<Leader>ob", "<Cmd>OverseerRun gobuild<CR>", desc = "Go Build" },
    { "<Leader>or", "<Cmd>OverseerRun run<CR>", desc = "Run" },
  },
  opts = {
    templates = { "user.gobuild", "user.run", "builtin" },
    task_list = {
      bindings = {
        ["<C-q>"] = false,
        ["<C-h>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-l>"] = false,
        K = "IncreaseDetail",
        J = "DecreaseDetail",
        ["<C-p>"] = "ScrollOutputUp",
        ["<C-n>"] = "ScrollOutputDown",
      },
    },
  },
  config = function(_, opts)
    require("overseer").setup(opts)
    local lualine = require("lualine")
    local config = lualine.get_config()
    table.insert(config.sections.lualine_x, "overseer")
    lualine.setup(config)
  end,
}
