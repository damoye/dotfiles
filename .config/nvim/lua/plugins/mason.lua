return {
  "mason-org/mason.nvim",
  config = function()
    require("mason").setup()
    local mr = require("mason-registry")
    mr.refresh(function()
      local ensure_installed = {
        "basedpyright",
        "delve",
        "golangci-lint",
        "gopls",
        "gotestsum",
        "lua-language-server",
        "ruff",
        "shfmt",
        "stylua",
        "tree-sitter-cli",
        "vtsls",
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
