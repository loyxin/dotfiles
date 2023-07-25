let $pluginstalldir = $myvimhome . '/.vim/bundle/repos'
let g:plug_threads=8
call plug#begin('$pluginstalldir')

Plug 'neoclide/coc.nvim', {
            \ 'dir' : '$pluginstalldir/coc.nvim',
            \ 'branch' : 'release',
            \ 'on'  : []
            \ }
" \ 'for' : ['c', 'cpp', 'rust', 'python', 'go', 'shell', 'txt'],

" set statusline+=%{NearestMethodOrFunction()}
let g:vista_icon_indent = [" ", " "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }
let g:vista_sidebar_position = "vertical topleft"
Plug 'liuchengxu/vista.vim', {'dir' : '$pluginstalldir/tool/vista.vim', 'on'  : []}

imap <c-x><c-f> <plug>(fzf-complete-path)
function! HelpVimFzfToggle()
    let s:content=[
                \[':Files [PATH] 找文件'],
                \[':GFiles 找 git 文件'],
                \[':GFiles? git status 下改动的文件'],
                \[':Buffers'],
                \[':Rg ALT-A to select all, ALT-D to deselect all'],
                \['GRg git file rg'],
                \['RG rg and fzf'],
                \ ]
    let s:opts = {'title': 'vim fzf tip'}
    call quickui#listbox#open(s:content, s:opts)
endfunction
Plug 'junegunn/fzf.vim', {'dir' : '$pluginstalldir/tool/fzf.vim', 'on' : []}
Plug 'junegunn/fzf', { 'dir': '$pluginstalldir/.fzf', 'on' : []}

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces=0
let g:formatterpath = ['$myvimhome/.formatter']
Plug 'Chiel92/vim-autoformat', {'on' : [], 'dir' : '$pluginstalldir/tool/vim-autoformat'}

let g:quickui_color_scheme = 'gruvbox'
Plug 'skywind3000/vim-quickui', {'dir': '$pluginstalldir/colors/vim-quickui', 'on': []}
Plug 'skywind3000/vim-terminal-help', {'dir': '$pluginstalldir/tool/vim-terminal-help', 'on': []}
" Plug 'skywind3000/asyncrun.vim', {'dir' : '$pluginstalldir/async/asyncrun.vim', 'on' : []}
" Plug 'skywind3000/asynctasks.vim', {'dir': '$pluginstalldir/async/asynctasks.vim', 'on': []}
" Plug 'skywind3000/asyncrun.extra', {'dir': '$pluginstalldir/async/asyncrun.extra', 'on':[]}
function! HelpVimSurround()
    let s:content=[
                \['删除包围符号命令 ds, 后面加字符表示要删除的符号 ds" '],
                \['"Hello world!" ds" -> Hello world!'],
                \['替换包围符号的命令是cs,命令后跟两个参数，分别是被替换的符号和需要使用的符号']
                \ ]
    let s:opts = {'title': 'vim surround tip'}
    call quickui#listbox#open(s:content, s:opts)
endfunction
Plug 'tpope/vim-surround', {'dir': '$pluginstalldir/tool/vim-surround', 'on' : []}

let g:NERDSpaceDelims=1 " 注释符号后面空一格
Plug 'scrooloose/nerdcommenter', {'dir': '$pluginstalldir/tool/nerdcomment', 'on': []}

Plug 'lfv89/vim-interestingwords', {
            \ 'dir': '$pluginstalldir/tool/vim-interestingwords',
            \ 'on': [],
            \ 'description': 'highlight different word'
            \ }

Plug 'alpertuna/vim-header', {
            \ 'dir': '$pluginstalldir/tool/vim-header',
            \ 'description': 'AddHeader AddMITLicense and so on',
            \ 'on': [],
            \ }

let g:tldr_directory_path = '~/.tldr/cache/tldr'
let g:tldr_split_type = 'horizontal'
let g:tldr_language = 'zh'
Plug 'wlemuel/vim-tldr', {
            \ 'dir': '$pluginstalldir/tool/vim-tldr',
            \ 'on': ['Tldr'],
            \ }

Plug 'lambdalisue/suda.vim', {
            \ 'dir': '$pluginstalldir/tool/suda.vim',
            \ 'description':'SudaWrite, SudaRead'
            \ }

Plug 'APZelos/blamer.nvim', {
            \ 'dir' : '$pluginstalldir/tool/git/blamer.nvim',
            \ 'on' : ['BlamerToggle'],
            \ 'description' : 'show git blame :BlamerToggle'
            \ }

function! HelpVimFold()
    let s:content=[
                \['za 切换折叠'],
                \['zA 递归切换折叠'],
                \['zf 创建代码折叠'],
                \['zF 指定行数创建折叠'],
                \['zd 删除光标下折叠'],
                \['zD 递归删除所有折叠'],
                \['zj 移动至下一个折叠'],
                \['zk 移动至上一个折叠'],
                \['zm 所有代码折叠一层'],
                \['zM 所有代码折叠'],
                \['zr 所有代码打开一层'],
                \['zR 所有代码打开'],
                \['zE 删除所有折叠']
                \ ]
    let s:opts = {'title': 'vim fold tip'}
    call quickui#listbox#open(s:content, s:opts)
endfunction
Plug 'pseewald/vim-anyfold', {'dir':'$pluginstalldir/vim-anyfold'}

set viewoptions=cursor,folds,slash,unix
Plug 'zhimsel/vim-stay', {'dir': '$pluginstalldir/vim-stay'}

let g:DoxygenToolkit_authorName="loy"
let g:doxygen_enhanced_color = 1
Plug 'vim-scripts/DoxygenToolkit.vim', {
            \ 'dir': '$pluginstalldir/language/c/DoxygenToolkit.vim',
            \ 'for' : ['c', 'cpp']
            \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_theme='sierra'
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline',{'dir': '$pluginstalldir/colors/vim-airline', 'on' : []}

let g:indent_guides_enable_on_vim_startup = 1
" second indent display
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" hi IndentGuidesOdd  guibg=red   ctermbg=3
" hi IndentGuidesEven guibg=green ctermbg=4
Plug 'nathanaelkane/vim-indent-guides', {'dir': '$pluginstalldir/colors/vim-indent-guides', 'description':'对齐代码的虚线'}
Plug 'dracula/vim', {'dir': '$pluginstalldir/colors/dracula/vim', 'description' : 'for airline theme', 'on': []}
Plug 'TaDaa/vimade', {'dir': '$pluginstalldir/tool/vimade', 'on': [], 'description': '聚焦窗口'}
Plug 'matze/vim-tex-fold', {'dir': '$pluginstalldir/language/tex/vim-tex-fold', 'for':  'tex'}
Plug 'pboettch/vim-cmake-syntax', {'dir': '$pluginstalldir/vim-cmake-syntax', 'for': 'cmake'}
Plug 'mtdl9/vim-log-highlighting', {'dir': '$pluginstalldir/vim-log-highlighting', 'on': []}
Plug 'luochen1990/rainbow', {'dir' : '$pluginstalldir/colors/rainbow'}
Plug 'ryanoasis/vim-devicons',{'dir': '$pluginstalldir/colors/vim-devicons', 'description': '图标', 'on':[]}
Plug 'lambdalisue/fern-renderer-nerdfont.vim', {'dir': '$pluginstalldir/colors/fern-renderer-nerdfont.vim', 'description': '图标', 'on':[]}
Plug 'lambdalisue/nerdfont.vim', {'dir' : '$pluginstalldir/colors/nerdfont.vim', 'on': []}
Plug 'lambdalisue/glyph-palette.vim', {'dir' : '$pluginstalldir/colors/glyph-palette.vim', 'on': []}
Plug 'terryma/vim-expand-region', {'dir' : '$pluginstalldir/vim-expand-region'}

call plug#end()

function! LoadPlug(timer)
    " call plug#load('vim-diff-enhanced')
    " call plug#load('vim-signify')
    " call plug#load('vim-trailing-whitespace')
    call plug#load('vim') " dracula vim colortheme
    call plug#load('vim-airline')
    call plug#load('vim-devicons')
    call plug#load('nerdfont.vim')
    " call plug#load('fern-renderer-nerdfont.vim')
endfunction

call timer_start(100, 'LoadPlug') "delay 100ms load

function! LoadPlugSe(timer)
    call plug#load('glyph-palette.vim')
    call plug#load('vim-quickui')
    call plug#load('nerdcommenter')
    call plug#load('vim-autoformat')
    call plug#load('vim-surround')
    " call plug#load('asyncrun.vim')
    " call plug#load('asyncrun.extra')
    " call plug#load('asynctasks.vim')
    call plug#load('vim-interestingwords')
    call plug#load('vim-header')
    call plug#load('vim-log-highlighting')
    call plug#load('DoxygenToolkit.vim')
endfunction

if ( !($LOGVIM =~ "1") )
    call timer_start(1000, 'LoadPlugSe') "delay 1000ms load
endif

function! LoadPlugThird(timer)
    call plug#load('vimade')
    call plug#load('vim-terminal-help')
    call plug#load('fzf')
    call plug#load('fzf.vim')
endfunction
call timer_start(500, 'LoadPlugThird') "delay 1000ms load

" rainbow_parentheses {{{
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['red',         'firebrick3'],
            \ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}
" }}}

nnoremap <C-h> :call HelpVimToggle()<CR>
function! HelpVimToggle()
    let s:content= [
                \ ['Fn shortcut', 'call HelpFNShortCutToggle()'],
                \ ['coc command', 'call HelpCocShortCutToggle()'],
                \ ['f2f help', 'call HelpVimFzfToggle()'],
                \ ['surround help', 'call HelpVimSurround()'],
                \ ['fold help', 'call HelpVimFold()'],
                \ ['vim tips', 'call HelpVimTipsToggle()'],
                \ ['snip',  'e ~/.vim/doc/vim-snip'],
                \ ]
    let s:opts = {'title': 'open help'}
    call quickui#listbox#open(s:content, s:opts)
endfunction

function! HelpCocShortCutToggle()
    let s:content= [
                \ ['Space o CocList outline'],
                \ ['Space s CocList symbols'],
                \ ['Space r ranger'],
                \ [',rf refactor'],
                \ ['gs git chunkinfo'],
                \ [',gu git chunkundo'],
                \ [',kc ,kb ,ki conflict'],
                \ [',x v mode convert snip'],
                \ ]
    let s:opts = {'title': 'Coc shortcut'}
    call quickui#listbox#open(s:content, s:opts)
endfunction

" C+v visual
" s+v
" v
" c+v + I every block do same operator insert mode
" c+v + g every block do same operator normal mode
" https://yianwillis.github.io/vimcdoc/doc/visual.html

" {
" 在所有被选择的行后加上点东西：
" <Ctrl-v> 选中行
" $ 到行最后（不加将在每行行首编辑）
" A 块操作中进入插入模式
" 输入 ESC
" }
"
" :%s/<search>/<replace>/ g global :line1,line2s/^/#/g
" :%s/foo/bar/gc ask to manually confirm (`c` flag) each replacement
" 'a,'bs/from/to/g 对标记a和b之间的行（含a和b所在的行）进行替换，其中a和b是之前用m命令所做的标记
" :., +10s/p1/p2/g    将当前行到相对当前行加10行的区间中所有p1替换为p2

" /fred\|joe          搜索 fred 或者 joe
" /\<\d\d\d\d\>       精确搜索四个数字
" /^\n\{3}            搜索连续三个空行


function! HelpVimTipsToggle()
    let s:content= [
                \ ['<c-x><c-f> 补全文件名'],
                \ ['<c-x><c-i> 补全关键字'],
                \ ['<c-x><c-e> 插入模式下向上滚屏'],
                \ ['<c-x><c-y> 插入模式下向下滚屏'],
                \ ['"aY 存储到寄存器a'],
                \ ['<c-o> 执行一次正常模式下的命令'],
                \ ['H 移动到屏幕顶部, M 中间 L 底部'],
                \ ['f或ctrl+g -- 显示文档名，是否修改，和光标位置'],
                \ ['aw: 一词 as: 一句 ap: 一段 ab: 一块'],
                \ ['<c-o>跳转光标<c-i><c-o>逆转'],
                \ ['SudaWrite SudaRead'],
                \ ['alt+shift+hkjl windows'],
                \ [' C+x number descrease'],
                \ [' C+a number inscrease'],
                \ [':r !ls pdf'],
                \ ]
    let s:opts = {'title': 'vim tips'}
    call quickui#listbox#open(s:content, s:opts)
endfunction

" 先按 [ 再按 ctrl+d 跳转到#define处
" 先按 [ 再按 ctrl+i 跳转到函数、变量和#define
" gf                  打开名称为光标下文件名的文件
" [[                  跳转到上一个顶层函数（比如C语言以大括号分隔）
" ]]                  跳转到下一个顶层函数（比如C语言以大括号分隔）
" [m                  跳转到上一个成员函数
" ]m                  跳转到下一个成员函数
" [{                  跳转到上一处未匹配的 {
" ]}                  跳转到下一处未匹配的 }
" [(                  跳转到上一处未匹配的 (
" ])                  跳转到下一处未匹配的 )
" [c                  上一个不同处（diff时）
" ]c                  下一个不同处（diff时）
" [/                  跳转到 C注释开头
" ]/                  跳转到 C注释结尾
" [[和]]用来在函数之间跳转，其中[[为跳转到上一个函数开头，]]为跳转到下一个函数开头。
" ][为跳转到本函数的结尾。
"

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
    call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
function! GetRootPath()
    return finddir('.git/..', expand('%:p:h').';')
endfunction
command! -bang -nargs=* GRg
            \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'dir' : GetRootPath()}), <bang>0)

set foldlevel=0
