local on_attach=require("plugins.configs.lspconfig").on_attach;
local capabilities=require("plugins.configs.lspconfig").capabilities;
local lspconfig=require("lspconfig");
local configs=require("plugins.configs.lspconfig");


lspconfig.clangd.setup({
  on_attach=on_attach,
  capabilities=capabilities,
  filetypes={"c","cpp"},
  cmd={"clangd"}
});

lspconfig.denols.setup({
  on_attach=on_attach,
  capabilities=capabilities,
  filetypes={"javascript","typescript","javascriptreact","typescriptreact","javascript.jsx","typescript.tsx"},
  cmd={"deno","lsp"}
});

-- Zig Language Server
lspconfig.zls.setup {
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }
    -- Key mappings
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  vim.filetype.add {
    extension = { zig="zig" },
  }
}

