return -- add pyright to lspconfig
{
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      pyright = {},
      angularls = {},
      clangd = {
        cmd = {
          "clangd",
          "--clang-tidy",
          "--background-index",
          "--pch-storage=memory",
          "--suggest-missing-includes",
          "--header-insertion=iwyu",
        },
        single_file_support = true,
        filetypes = {
          "c",
          "cpp",
          "objc",
          "objcpp",
          "cuda",
          --"proto"
        },
        init_options = {
          fallbackFlags = {
            "-std=c++20",
          },
          clangdFileStatus = true,
        },
      },
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
