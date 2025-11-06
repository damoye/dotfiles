return {
  "brianhuster/live-preview.nvim",
  ft = { "markdown" },
  config = function()
    Snacks.toggle({
      name = "Preview",
      get = require("live-preview").is_running,
      set = function(state)
        if state then
          vim.cmd("LivePreview start")
        else
          vim.cmd("LivePreview close")
        end
      end,
    }):map("<Leader>p")
  end,
}
