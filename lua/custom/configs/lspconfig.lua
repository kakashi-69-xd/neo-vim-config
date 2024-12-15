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
  on_attach=on_attach,
  capabilities=require("cmp_nvim_lsp").default_capabilities(),
  filetypes={"zig"},
}

