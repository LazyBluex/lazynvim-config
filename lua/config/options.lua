-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.o.{option} 类似 :let &{option-name}
-- vim.go.{option} 类似 :let &g:{option-name}
-- vim.bo.{option}: buffer-local 选项 :let &l:{option-name}
-- vim.wo.{option}: window-local 选项 :let &l:{option-name}

-- utf8
vim.o.fileencodings = "utf-8,ucs-bom,cp936,gb18030,big5,gbk,euc-jp,euc-kr,latin1"
vim.o.fileencoding = "utf-8"
vim.g.encoding = "utf-8"
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = false
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "120"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索高亮
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = true
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = false
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false
-- 行结尾可以跳到下一行
vim.o.whichwrap = "b,s,<,>,[,],h,l"
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- Show diagnostic popup on cursor hold
vim.api.nvim_command("autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })")

-- 设置 timeoutlen 为等待键盘快捷键连击时间300毫秒，可根据需要设置
-- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
vim.o.timeoutlen = 300
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
--vim.o.background = "dark"
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 2
-- 日志
--vim.o.verbose = 10
--vim.o.verbosefile = "vim.log"

--vim.cmd [[ set verbosefile=vim.log ]]
-- 开启 Folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
vim.wo.foldlevel = 99
-- 默认使用系统剪切板, wsl使用的win32yank剪切板, 粘贴的时候很卡, 关掉
vim.o.clipboard = "unnamedplus"

-- python3
vim.g.python3_host_prog = "/usr/bin/python3"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.autochdir = false
