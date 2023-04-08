vim.g.encoding = "UTF-8"
vim.g.fileencodings = "UTF-8,gb2312,gbk,gb18030"
vim.g.termencoding = "UTF-8"
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 4
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
vim.o.showmode = false
-- 命令行高为2，提供足够的显示空间
-- vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false
-- 行结尾可以跳到下一行
--vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间200毫秒，可根据需要设置
-- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
vim.o.timeoutlen = 400
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 补全增强
vim.o.wildmenu = true
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.pumheight = 10
vim.g.python3_host_prog = "~/.local/bin/python3"
-- 鼠标支持 a is enable
vim.g.mouse = "c"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.g.undofile = true
vim.undodir = "~/.vim/bundle/files/undo"

