-- organize imports on write for golang
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function(args)
    local params = {
      textDocument = vim.lsp.util.make_text_document_params(args.buf),
      only = { "source.organizeImports" },
    }
    local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 5000)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = vim.lsp.get_client_by_id(cid).offset_encoding
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end,
})
