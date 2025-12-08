vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Go to the right window" })

vim.keymap.set("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease height" })
vim.keymap.set("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase height" })
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch, { desc = "Clear highlights" })
vim.keymap.set("n", "<Leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<C-s>", vim.cmd.write, { desc = "Save file" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "grC", vim.lsp.codelens.refresh, { desc = "Refresh & Display codelens" })
vim.keymap.set({ "n", "x" }, "grc", vim.lsp.codelens.run, { desc = "Run codelens" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover information" })

vim.keymap.set("n", "]e", function()
  vim.diagnostic.jump({ count = 1, severity = 1 })
end, { desc = "Next error" })
vim.keymap.set("n", "[e", function()
  vim.diagnostic.jump({ count = -1, severity = 1 })
end, { desc = "Prev error" })

vim.keymap.set("n", "<Leader>q", function()
  if vim.fn.getqflist({ winid = 0 }).winid == 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end, { desc = "Toggle Quickfix" })
