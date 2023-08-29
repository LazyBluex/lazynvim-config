local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

--   git add
--   git mod
--   git remove
--   error
--   warning

local diagnostics = {
  "diagnostics",
  -- Table of diagnostic sources, available sources are:
  --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
  -- or a function that returns a table as such:
  --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
  sources = { "nvim_diagnostic" },
  -- Displays diagnostics for the defined severity types
  sections = { "error", "warn", "info", "hint" },
  diagnostics_color = {
    -- Same values as the general color option can be used here.
    error = "DiagnosticError", -- Changes diagnostics' error color.
    warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
    info = "DiagnosticInfo", -- Changes diagnostics' info color.
    hint = "DiagnosticHint", -- Changes diagnostics' hint color.
  },
  -- symbols = { error = " ", warn = " " },
  symbols = {
    error = "❌ ",
    warn = "⚠️ ",
    info = "ℹ️ ",
    hint = "💡 ",
  },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

--lualine.setup({
--  options = {
--    icons_enabled = true,
--    theme = "sonokai",
--    component_separators = { left = "", right = "" },
--    section_separators = { left = "", right = "" },
--    disabled_filetypes = {},
--    always_divide_middle = true,
--  },
--})
--
local xmake_component = {
  function()
    local xmake = require("xmake").config
    if xmake.target == "" then
      return ""
    end
    return xmake.target .. "(" .. xmake.mode .. ")"
  end,
  --   color = utils.gen_hl("green", true, true),
  cond = function()
    return vim.o.columns > 100
  end,
  on_click = function()
    require("xmake.set").setting()
  end,
}

-- or you can return new options to override all the defaults
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      --[[add your custom lualine config here]]
      sections = {
        lualine_a = { mode },
        lualine_b = { branch, diff, diagnostics },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", filetype },
        lualine_y = { "progress", xmake_component },
        lualine_z = { location },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { location },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {
        "nvim-tree",
        "toggleterm",
        "fzf",
      },
    }
  end,
}
