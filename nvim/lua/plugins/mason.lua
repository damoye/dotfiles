return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
    local mr = require("mason-registry")
    mr.refresh(function()
      local ensure_installed = {
        "gopls",
        "delve",
        "lua-language-server",
        "stylua",
        "shfmt",
      }
      for _, tool in ipairs(ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)
  end,
}
