return -- add pyright to lspconfig
{
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    inlay_hints = { enabled = true },
    ---@type lspconfig.options
    servers = {
      pyright = {},
      clangd = {
        cmd = {
          "clangd",
          "--clang-tidy",
          "--background-index",
          "--pch-storage=memory",
          "--header-insertion=iwyu",
        },
        single_file_support = true,
        filetypes = {
          "c",
          "cpp",
          "objc",
          "objcpp",
          "cuda",
          "cuda-cpp",
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
