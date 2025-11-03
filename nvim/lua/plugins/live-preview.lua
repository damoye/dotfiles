return {
  "brianhuster/live-preview.nvim",
  ft = { "markdown" },
  keys = {
    {
      "<Leader>p",
      function()
        local lp = require("live-preview")
        if lp.is_running() then
          vim.cmd("LivePreview close")
        else
          vim.cmd("LivePreview start")
        end
      end,
      desc = "Preview Toggle",
    },
  },
}
