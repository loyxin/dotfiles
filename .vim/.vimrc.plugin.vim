if &compatible
  set nocompatible
endif
let $pluginstalldir = $myvimhome . '/.vim/bundle/repos'
let g:plug_threads=8
call plug#begin('$pluginstalldir')

" cpp {{{
" {{
Plug 'neoclide/coc.nvim', {
	\ 'dir' : '$pluginstalldir/coc.nvim',
	\ 'branch' : 'release',
	\ 'on' 	: []
	\ }
	" \ 'for' : ['c', 'cpp', 'rust', 'python', 'go', 'shell', 'txt'],

Plug 'liuchengxu/vista.vim', {
	\ 'dir' : '$pluginstalldir/tool/vista.vim',
	\ 'on'  : []
	\ }

Plug 'vim-scripts/DoxygenToolkit.vim', {
	\ 'dir': '$pluginstalldir/language/c/DoxygenToolkit.vim',
	\ 'for' : ['c', 'cpp']
	\ }

Plug 'Jorengarenar/vim-MvVis', {
    \ 'dir': '$pluginstalldir/tool/vim-MvVis',
    \ 'on': []
    \ }
Plug 'lambdalisue/suda.vim', {
    \ 'dir': '$pluginstalldir/tool/suda.vim'
    \ }
"}}}

" other language {{{
Plug 'matze/vim-tex-fold', {
	\ 'dir': '$pluginstalldir/language/tex/vim-tex-fold',
	\ 'for':  'tex'
	\ }

" }}}

" file{{{
Plug 'junegunn/fzf', { 'dir': '$pluginstalldir/.fzf', 'on' : []}
Plug 'junegunn/fzf.vim', {'dir' : '$pluginstalldir/tool/fzf.vim', 'on' : []}
" }}}

" tool{{{
" Plug 'godlygeek/tabular', {'description': 'Vim 对齐'}
" Plug 'junegunn/vim-easy-align', {'description':'快速赋值语句对齐'}
Plug 'APZelos/blamer.nvim', {
    \ 'dir' : '$pluginstalldir/tool/git/blamer.nvim',
	\ 'on' : ['BlamerToggle'],
	\ 'description' : 'show git blame :BlamerToggle'
	\ }
Plug 'Chiel92/vim-autoformat', {'on' : [], 'dir' : '$pluginstalldir/tool/vim-autoformat'}
Plug 'gcmt/wildfire.vim', {
	\ 'dir' : '$pluginstalldir/tool/wildfire.vim',
	\ 'on' : []
	\ }
Plug 'skywind3000/vim-terminal-help', {'dir': '$pluginstalldir/tool/vim-terminal-help', 'on': []}
Plug 'skywind3000/vim-quickui', {'dir': '$pluginstalldir/colors/vim-quickui', 'on': []}
Plug 'skywind3000/asyncrun.vim', {'dir' : '$pluginstalldir/async/asyncrun.vim', 'on' : []}
Plug 'skywind3000/asynctasks.vim', {'dir': '$pluginstalldir/async/asynctasks.vim', 'on': []}
Plug 'skywind3000/asyncrun.extra', {'dir': '$pluginstalldir/async/asyncrun.extra', 'on':[]}
" enhance clipboard
Plug 'tpope/vim-surround', {'dir': '$pluginstalldir/tool/vim-surround', 'on' : []}
" Plug 'vim-scripts/YankRing.vim', {'dir':'$pluginstalldir/tool/YankRing'}
Plug 'kshenoy/vim-signature' , {
	\ 'description': '代码收藏 键入 mm display use fzf search',
	\ 'dir':'$pluginstalldir/tool/vim-signature',
	\ 'on': []
	\ } " look doc
Plug 'scrooloose/nerdcommenter', {
			\ 'description':' 快速注释',
			\ 'dir': '$pluginstalldir/tool/nerdcomment',
			\ 'on': []
			\ }
Plug 'TaDaa/vimade', {
		\ 'dir': '$pluginstalldir/tool/vimade',
		\ 'on': [],
		\ 'description': '聚焦窗口'
	  	\ }
Plug 'itchyny/vim-cursorword', {
		\ 'dir': '$pluginstalldir/tool/vim-cursorword',
		\ 'on': [],
		\ 'description': 'underline the work'
	  	\ }
Plug 'lfv89/vim-interestingwords', {
		\ 'dir': '$pluginstalldir/tool/vim-interestingwords',
		\ 'on': [],
		\ 'description': 'highlight different word'
	  	\ }
Plug 'alpertuna/vim-header', {
	  \ 'dir': '$pluginstalldir/tool/vim-header',
	  \ 'on': [],
	  \ }
Plug 'wlemuel/vim-tldr', {
        \ 'dir': '$pluginstalldir/tool/vim-tldr',
        \ 'on': ['Tldr'],
        \ }
" }}}

" 外观{{{
" 配色方案{{{
Plug 'dracula/vim', {'dir': '$pluginstalldir/colors/dracula/vim', 'description' : 'no config no command for airline theme', 'on': []}
" Vim状态栏插件
Plug 'vim-airline/vim-airline',{'dir': '$pluginstalldir/colors/vim-airline', 'description': 'config in nochange', 'on' : []}
" }}}
Plug 'nathanaelkane/vim-indent-guides', {'description':'对齐代码的虚线 config in nochange', 'dir': '$pluginstalldir/colors/vim-indent-guides'}
Plug 'luochen1990/rainbow', {'dir' : '$pluginstalldir/colors/rainbow', 'description' :'\{\} config in nochange'}
Plug 'ryanoasis/vim-devicons',{'dir': '$pluginstalldir/colors/vim-devicons', 'description': '图标', 'on':[]}
Plug 'lambdalisue/fern-renderer-nerdfont.vim', {'dir': '$pluginstalldir/colors/fern-renderer-nerdfont.vim', 'description': '图标', 'on':[]}
Plug 'lambdalisue/nerdfont.vim', {'dir' : '$pluginstalldir/colors/nerdfont.vim', 'on': []}
Plug 'lambdalisue/glyph-palette.vim', {'dir' : '$pluginstalldir/colors/glyph-palette.vim', 'on': []}
"}}}

" other{{{
" Plug 'rlue/vim-barbaric', {'dir': '$pluginstalldir/tool/vim-barbaric', 'description' : '输入法'}
" }}}

call plug#end()

function! LoadPlug(timer)
	" call plug#load('vim-diff-enhanced')
	" call plug#load('vim-signify')
	" call plug#load('vim-trailing-whitespace')
    call plug#load('vim') " dracula vim colortheme
	call plug#load('vim-airline')
	call plug#load('vim-devicons')
	call plug#load('nerdfont.vim')
endfunction

call timer_start(100, 'LoadPlug') "delay 100ms load

function! LoadPlugSe(timer)
    call plug#load('glyph-palette.vim')
    call plug#load('vim-quickui')
    call plug#load('wildfire.vim')
	call plug#load('nerdcommenter')
    call plug#load('vim-autoformat')
    call plug#load('vim-surround')
    call plug#load('asyncrun.vim')
    call plug#load('asyncrun.extra')
    call plug#load('asynctasks.vim')
    call plug#load('vim-interestingwords')
	call plug#load('vim-header')
    call plug#load('vim-MvVis')
	" call plug#load('vim-keysound')
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
    " autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
    "
	" call plug#load('copilot.vim')
endfunction

if ( !($LOGVIM =~ "1") )
    call timer_start(1000, 'LoadPlugSe') "delay 1000ms load
endif

function! LoadPlugThird(timer)
    call plug#load('vimade')
    call plug#load('vim-signature')
    call plug#load('vim-terminal-help')
    call plug#load('fzf')
    call plug#load('fzf.vim')
endfunction
call timer_start(500, 'LoadPlugThird') "delay 1000ms load
" 插件列表结束
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}

" vim-indent-guides{{{
let g:indent_guides_enable_on_vim_startup = 1
" second indent display
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" hi IndentGuidesOdd  guibg=red   ctermbg=3
" hi IndentGuidesEven guibg=green ctermbg=4
" }}}

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
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
" }}}

" vim-airline{{{
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
" }}}

" vim-autoformat{{{
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces=0
let g:formatterpath = ['$myvimhome/.vim/.clang-format']
" python
"let g:formatter_yapf_style = 'pep8'
" autocmd FileType c,cpp autocmd BufWritePre <buffer> silent :Autoformat
" }}}


" one line setting{{{
let g:NERDSpaceDelims=1 " 注释符号后面空一格
" }}}

" barbaric{{{
" normal 模式下中英文输入法
let g:barbaric_ime = 'fcitx'
" }}}

let g:quickui_color_scheme = 'gruvbox'

let g:tldr_directory_path = '~/.tldr/cache/tldr'
let g:tldr_split_type = 'horizontal'
let g:tldr_language = 'zh'
