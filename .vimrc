let g:pymode_python = 'python3'
" 判断 {{{
if &compatible
    set nocompatible
endif
let $myvimhome=$HOME
so $myvimhome/.workdiff/vimdiff
function! LoadmyCoc(timer)
    call plug#load('coc.nvim')
    call plug#load('vista.vim')
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endfunction

nnoremap <leader>lc :call LoadmyCoc(1)<CR>

if ( !($LOGVIM =~ "1") )
    call timer_start(200, 'LoadmyCoc') "delay 2000ms load
endif
" }}}

" GENERAL SETTINGS {{{
set nocompatible " 设置不兼容原始 vi 模式（必须设置在最开头）
set t_Co=256 " vim开启256色支持
set guifont=SimSun   " 设置字体
" :set sw=4           设置缩进宽度为 4
" :set ts=4           设置制表符宽度为 4
" :set noet           设置不展开 tab 成空格
" :set et             设置展开 tab 成空格
" 编码设置
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
" 配色方案
" colorscheme solarized
" colorscheme phd
let g:rehash256=1
colorscheme molokai
" colorscheme phd
" colorscheme dracula
set background=dark
" 开启文件类型检测
filetype on
"允许插件
filetype plugin on
filetype plugin indent off
syntax on      "语法高亮
" set     foldenable      " 允许折叠
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
" set   foldmethod=syntax
" set   autoindent " 自动缩进
" set   cindent
" 设置当文件被改动时自动载入
set viewoptions=cursor,folds,slash,unix
set foldlevel=0
set autoread
set autowrite " 自动保存
set backspace=indent,eol,start " backspace不能使用
set hlsearch " 高亮显示搜索结果
set ignorecase " 搜索忽略大小写
set smartcase " 有一个以上的大写字母仍大小写敏感
set incsearch " 输入查找内容时进行匹配
" 显示行号
set relativenumber
set number
set ruler  " 显示标尺 显示当前行号列号
set scrolloff=8 " 移动buffer顶部底部保持5行距离
set shiftwidth=4 " 自动缩进宽度为 4
set tabstop=4 " tab 制表符所占宽度为 4
" set   smartindent "智能缩进
set showcmd  "输入的命令显示出来，看的清楚些
set showmode "显示当前模式``
set showmatch "括号匹配"
"set   whichwrap=h,l " hl 换行
set wildignore=*.bak,*.o,*.e,*~,*.class,.svn,*.pyc,*.swp
set wildmode=list:longest,full
" vim 自身命令行模式智能补全
set wildmenu
"超过70分行 自动换行显示
set wrap
" set     tw=70
set cursorline " 高亮行
" 不可以用鼠标移动光标 a是可以
set mouse=c
set history=1000      " Store a ton of history (default is 20)
set expandtab       " Expand TABs to spaces"

" 临时文件管理设置
if !isdirectory($myvimhome . '/.vim/bundle/files') && exists('mkdir')
    call mkdir($myvimhome . '/.vim/bundle/files')
endif
set backup
set backupdir=$myvimhome/.vim/bundle/files/backup/
set backupext=-vimbackup
set backupskip=
" 交换文件
set directory=$myvimhome/.vim/bundle/files/swap/
set updatecount=100
set undofile
set undodir=$myvimhome/.vim/bundle/files/undo/
"}}}

so $myvimhome/.vim/.vimrc.plugin.vim
so $myvimhome/.vim/.vimrc.my.vim

" coc {{{
"解决coc.nvim大文件卡死状况
let g:trigger_size=0.5 * 1048576
let g:coc_global_extensions=[
            \ 'coc-clangd',
            \ 'coc-cmake',
            \ 'coc-explorer',
            \ 'coc-diagnostic',
            \ 'coc-git',
            \ 'coc-highlight',
            \ 'coc-json',
            \ 'coc-lua',
            \ 'coc-lists',
            \ 'coc-lightbulb',
            \ 'coc-markdown-preview-enhanced',
            \ 'coc-nav',
            \ 'coc-pairs',
            \ 'coc-rust-analyzer',
            \ 'coc-react-refactor',
            \ 'coc-sh',
            \ 'coc-snippets',
            \ 'coc-spell-checker',
            \ 'coc-tabnine',
            \ 'coc-tasks',
            \ 'coc-translator',
            \ 'coc-vimlsp',
            \ 'coc-webview',
            \ 'coc-xml',
            \ 'coc-yank',
            \ ]
" Add highlights for defaultLibrary modifier
hi link CocSemDefaultLibrary TSOtherDefaultLibrary
hi link CocSemDefaultLibraryClass TSTypeDefaultLibrary
hi link CocSemDefaultLibraryInterface TSTypeDefaultLibrary
hi link CocSemDefaultLibraryEnum TSTypeDefaultLibrary
hi link CocSemDefaultLibraryType TSTypeDefaultLibrary
hi link CocSemDefaultLibraryNamespace TSTypeDefaultLibrary

" Add highlights for declaration modifier
hi link CocSemDeclaration TSOtherDeclaration
hi link CocSemDeclarationClass TSTypeDeclaration
hi link CocSemDeclarationInterface TSTypeDeclaration
hi link CocSemDeclarationEnum TSTypeDeclaration
hi link CocSemDeclarationType TSTypeDeclaration
hi link CocSemDeclarationNamespace TSTypeDeclaration

nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" jump to next or previous error
nmap <silent> ck <Plug>(coc-diagnostic-prev)
nmap <silent> cj <Plug>(coc-diagnostic-next)
" Fix autofix problem of current line
nmap <silent> fc <Plug>(coc-fix-current)
nmap rn <Plug>(coc-rename)
" bases
nnoremap <silent> xb :call CocLocations('clangd','$clangd/inheritance')<cr>
" bases of up to 3 levels
nnoremap <silent> xB :call CocLocations('clangd','$clangd/inheritance',{'levels':3})<cr>
" derived
nnoremap <silent> xd :call CocLocations('clangd','$clangd/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nnoremap <silent> xD :call CocLocations('clangd','$clangd/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nnoremap <silent> xc :call CocLocations('clangd','$clangd/call')<cr>
" callee
nnoremap <silent> xC :call CocLocations('clangd','$clangd/call',{'callee':v:true})<cr>

" $clangd/member
" member variables / variables in a namespace
nnoremap <silent> xm :call CocLocations('clangd','$clangd/member')<cr>
" member functions / functions in a namespace
nnoremap <silent> xf :call CocLocations('clangd','$clangd/member',{'kind':3})<cr>
" nested classes / types in a namespace
nnoremap <silent> xs :call CocLocations('clangd','$clangd/member',{'kind':2})<cr>

nmap <silent> xt <Plug>(coc-type-definition)<cr>
nnoremap <silent> xv :call CocLocations('clangd','$clangd/vars')<cr>
nnoremap <silent> xV :call CocLocations('clangd','$clangd/vars',{'kind':1})<cr>

" Use K to show documentation in preview window
nnoremap sd :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <space>e <Cmd>CocCommand explorer<CR>
nmap <Leader>er <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

" switch header and source
nnoremap <silent> <C-^> :CocCommand clangd.switchSourceHeader<cr>

" autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <space>h :call CocActionAsync('highlight')<cr>
nmap <leader>rf <Plug>(coc-refactor)

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" show diff
nnoremap <leader>gu :CocCommand git.chunkUndo<cr>
" keep conflict
nnoremap <leader>kc :CocCommand git.keepCurrent<cr>
nnoremap <leader>ki :CocCommand git.keepIncoming<cr>
nnoremap <leader>kb :CocCommand git.keepBoth<cr>


" Use <C-l> for trigger snippet expand.
imap <C-t> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)


" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

hi CocMenuSel ctermbg=237 guibg=#13354A
" }}}

" SHORTCUT SETTINGS: {{{
" Set mapleader
let mapleader=","
let g:mapleader=','
" ALT-U / ALT-D 可以让旁边的参考窗口上下滚屏
noremap <M-u> <C-w>p<C-u><C-w>p
noremap <M-d> <C-w>p<C-d><C-w>p
" Switching between buffers.
" from vim-terminal-help
" alt-shift-h move left
" alt-shift-l move right
" alt-shift-k move above
" alt-shift-j move below
" Control + hjkl tmux move
" drop file in terminal to open file
" - `ALT` + `=`: toggle terminal below.
" - `ALT` + `SHIFT` + `n`: move to the previous window.
" - `ALT` + `-`: paste register 0 to terminal.
" - `ALT` + `q`: switch to terminal normal mode.
" alt+number select buffer
nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab9
nmap <C-w> :bd<CR>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" " 设置快捷键将系统剪贴板内容粘贴至 vim
nnoremap <Leader>p "+p
" n 始终为向后搜索，N 始终为向前搜索
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]


" Resize splits with arrow keys
" noremap <up> :res +5<CR>
" noremap <down> :res -5<CR>
" noremap <left> :vertical resize-5<CR>
" noremap <right> :vertical resize+5<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" }}}

" 文本对象
" y, d, c, v都可以跟文本对象。
