" 禁用 C+F C+B scroll CTRL-E    向下动滚一行
" PageDown CTRL-U   向上翻滚半屏 CTRL-B 向上滚动一屏 PageUp
map <space> <Nop>
map <BS> <Nop>
map <Del> <Nop>
vmap <BS> <Nop>
imap <BS> <BS>
imap <Del> <Nop>
vmap <Del> <Nop>
map <Home> <Nop>
imap <Home> <Nop>
vmap <Home> <Nop>
map <End> <Nop>
imap <End> <Nop>
vmap <End> <Nop>
map <PageUp> <Nop>
map <PageDown> <Nop>
map <C-f> <Nop>
map <C-b> <Nop>
map <C-e> <Nop>
map <C-u> <Nop>
imap <PageUp> <Nop>
imap <PageDown> <Nop>
imap <C-f> <Nop>
imap <C-b> <Nop>
imap <C-e> <Nop>
imap <C-u> <Nop>
vmap <PageUp> <Nop>
vmap <PageDown> <Nop>
vmap <C-f> <Nop>
vmap <C-b> <Nop>
vmap <C-e> <Nop>
vmap <C-u> <Nop>

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab autoindent
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd BufRead,BufNewFile *.tex set filetype=tex
" autocmd BufRead,BufNewFile *.{py}
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufRead,BufNew * if 1 | match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/ | else | match ExtraWhitespace /^^/ | endif

" Clipboard
" 设置系统复制
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif
" 普通模式下用块状光标，在插入模式下用条状光标（形状类似英文 "I" 的样子），然后在替换模式中使用下划线形状的光标
if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    "  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
" 这个效果出现在当前窗口，而且在插入模式中关闭这个效果
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

let s:lxtogglemouse = 0
function! Togglemouse()
    if s:lxtogglemouse
        set mouse=c
        let s:lxtogglemouse=0
    else
        set mouse=a
        let s:lxtogglemouse=1
    endif
endfunc

let s:lxtoggleline = 1
function! ToggleLine()
    if s:lxtoggleline
        set norelativenumber
        let s:lxtoggleline=0
    else
        set relativenumber
        let s:lxtoggleline=1
    endif
endfunc

let t:is_transparent = 0
function! Toggle_transparent_background()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        :AirlineToggle
        :set norelativenumber
        :set nonumber
        :set laststatus=0
        :CocCommand git.toggleGutters
        let t:is_transparent = 1
    else
        :set relativenumber
        :set number
        :set laststatus=2
        :AirlineToggle
        :call plug#load('vim')
        colorscheme molokai
        :CocCommand git.toggleGutters
        let t:is_transparent = 0
    endif
endfunction

" F7 cpp 函数类层级
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F2> :call HelpFNShortCutToggle()<CR>
nnoremap <F3> :Autoformat<CR>
set pastetoggle=<F4>
nnoremap <F5> :call Togglemouse()<CR>
nnoremap <F6> :call ToggleLine()<CR>
nnoremap <F7> :Vista!!<CR>
nnoremap <F8> :MundoToggle<CR>
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <F12> :call Toggle_transparent_background()<CR>

function! HelpFNShortCutToggle()
    let s:content= [
                \ ['F2 vim help', 'call HelpVimToggle()'],
                \ ['F3 Autoformat', 'Autoformat'],
                \ ['F4 Paste'],
                \ ['F5 mouse', 'call Togglemouse()'],
                \ ['F6 line', 'call ToggleLine()'],
                \ ['F7 vista', 'Vista!!'],
                \ ['F8 undotree', 'MundoToggle'],
                \ ['F10 Quickfix', 'call asyncrun#quickfix_toggle(6)'],
                \ ['F12 transparency', 'call Toggle_transparent_background()'],
                \ ]
    let s:opts = {'title': 'F shortcut'}
    call quickui#listbox#open(s:content, s:opts)
endfunction
