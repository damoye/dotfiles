return {
  "milanglacier/minuet-ai.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lualine/lualine.nvim",
  },
  event = "InsertEnter",
  opts = {
    virtualtext = {
      -- auto_trigger_ft = { "*" },
      keymap = {
        accept = "<A-y>",
        accept_line = "<A-Y>",
        prev = "<A-p>",
        next = "<A-n>",
        dismiss = "<A-e>",
      },
    },
    provider = "openai_fim_compatible",
    request_timeout = 10,
    provider_options = {
      openai_fim_compatible = {
        model = "qwen-coder-turbo-latest",
        end_point = "https://dashscope.aliyuncs.com/compatible-mode/v1/completions",
        api_key = "DASHSCOPE_API_KEY",
        name = "Qianwen",
        stream = false,
        template = {
          prompt = function(context_before_cursor, context_after_cursor)
            return "<|fim_prefix|>"
              .. require("minuet.utils").add_language_comment()
              .. "\n"
              .. context_before_cursor
              .. "<|fim_suffix|>"
              .. context_after_cursor
              .. "<|fim_middle|>"
          end,
          suffix = false,
        },
        optional = { max_tokens = 256, stop = { "\n\n" } },
      },
    },
  },
  config = function(_, opts)
    require("minuet").setup(opts)
    local lualine = require("lualine")
    local config = lualine.get_config()
    table.insert(config.sections.lualine_x, require("minuet.lualine"))
    lualine.setup(config)
  end,
}
