return -- add pyright to lspconfig
{
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      pyright = {},
      angularls = {},
      clangd = {},
      cmake = {},
      tsserver = {},
      bashls = {},
      html = {},
      cssls = {},
      tailwindcss = {},
      jsonls = {},
      lua_ls = {},
    },
  },
}
