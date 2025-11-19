return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "rafamadriz/friendly-snippets" },
  event = "InsertEnter",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { ["<C-Enter>"] = { "show" } },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      trigger = { prefetch_on_insert = false },
    },
    cmdline = { enabled = false },
    signature = { enabled = true, window = { border = "single" } },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
  },
}
