-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- 前缀设置为空格 <leader>
--
-- -- vim.g.{name}:全局变量
-- vim.b.{name}: 缓冲区变量
-- vim.w.{name}: 窗口变量
-- vim.t.{name}: 选项卡变量
-- vim.v.{name}: 预定义变量
--
-- 前缀设置为空格 <leader>
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- map映射 noremap 表示非递归
-- n 表示在普通模式下生效
-- v 表示在可视模式下生效
-- i 表示在插入模式下生效
-- c 表示在命令行模式下生效
-- silent 静默执行 忽略执行命令后的回显
-- silent! 静默执行 同时  忽略执行错误
-- 保存本地变量  map('模式','按键','映射为XX',opt)
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- <C-x> 表示 同时按 Control + x
-- 普通模式 向上/向下 移动9行
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- 可视模式 连续 > 缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- <CR> 等于按下回车键
-- 普通模式 分屏
map("n", "sv", ":vsp<CR>", opt) -- 水平分屏
map("n", "sh", ":sp<CR>", opt) -- 垂直分屏
map("n", "sc", "<C-w>c", opt) -- 关闭当前分屏
map("n", "so", "<C-w>o", opt) -- close others

-- 普通模式 分屏比例控制（不常用，因为支持鼠标拖拽）
map("n", "s=", "<C-w>=", opt) -- 所有窗口比例恢复默认
map("n", "s.", ":vertical resize +20<CR>", opt) -- 水平比例
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "sj", ":resize +10<CR>", opt) -- 垂直比例
map("n", "sk", ":resize -10<CR>", opt)

-- 插件快捷键
--
-- toggleterm 终端
--map("n", "<leader>tt", "<CMD> ToggleTerm <CR>", opt)
--map("n", "<leader>tf", "<CMD> ToggleTerm direction=float<CR>", opt)
--map("n", "<leader>th", "<CMD> ToggleTerm direction=horizontal<CR>", opt)
--map("n", "<leader>tv", "<CMD> ToggleTerm direction=vertical<CR>", opt)

-- nvimTree 打开目录窗口
--map('n', '<F2>', ':NvimTreeToggle<CR>', opt)
-- map("n", "<A-m>", ":Neotree<CR>", opt)
--map('n', '<F2>', ':NvimTreeRefresh<CR>', opt)
-- NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

-- bufferline
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>l", ":BufferLineCycleNext<CR>", opt)

-- These commands will move the current buffer backwards or forwards in the bufferline
map("n", "<leader>mh", ":BufferLineMovePrev<CR>", opt)
map("n", "<leader>ml", ":BufferLineMoveNext<CR>", opt)

--These commands will sort buffers by directory, language, or a custom criteria
--map('n', "<Tab>se", ":BufferLineSortByExtension<CR>", opt)
--map('n', "<Tab>sd", ":BufferLineSortByDirectory<CR>", opt)

-- nvim-treesitter 代码格式化
map("n", "<leader>==", "gg=G", opt) -- 有的不支持lsp格式化,用这个

-- telescope 模糊查询
-- map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", opt)
-- map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", opt)
-- map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", opt)
-- map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>", opt)
-- map("n", "<leader>/", ":lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opt)
-- --map('n', '<leader>fs', ":lua require('telescope.builtin').file_browser()<cr>", opt)

-- neogen 快速注释
local opts_neogen = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>nf", ":lua require('neogen').generate()<CR>", opts_neogen)

-- lsp key-mapping
-- Mappings.
local opts = { noremap = true, silent = true }
-- goto xx
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.keymap.set("n", "<leader>=", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
--  vim.keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--  vim.keymap.set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--  vim.keymap.set('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--  vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- vim.keymap.set("n", "<leader>ef", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- vim.keymap.set("n", "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
-- vim.keymap.set("n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--  vim.keymap.set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
