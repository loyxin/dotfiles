autocmd FileType python set tabstop=4 shiftwidth=4 expandtab autoindent
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent

autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd BufRead,BufNewFile *.tex set filetype=tex
" autocmd BufRead,BufNewFile *.{py}
autocmd FileType python set omnifunc=pythoncomplete#Complete

" general functin {{{
"记录上次打开某一文件时的光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
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
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" }}}

" my shortcut{{{

" my mouse toggle{{{
let s:lxtogglemouse = 0
function! Togglemouse()
	if s:lxtogglemouse
		set mouse=c
		let s:lxtogglemouse=0
		let g:cursorword=0
	else
		set mouse=a
		call plug#load('vim-cursorword')
		let g:cursorword=1
		let s:lxtogglemouse=1
	endif
endfunc
" }}}

" line releative line{{{
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
" }}}

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufRead,BufNew * if 1 | match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/ | else | match ExtraWhitespace /^^/ | endif

" {{{
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
" }}}

" {{{
let g:cursorword = 1
function s:CursorToggle()
	if g:cursorword == 1
		let g:cursorword = 0
	else
		let g:cursorword = 1
	endif
endfunction
command CursorToggle call s:CursorToggle()
" }}}

" show shortcut {{{
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

" help toggle {{{
nnoremap <C-h> :call HelpVimToggle()<CR>
function! HelpVimToggle()
	let s:content= [
		\ ['open shortcut', 'e ~/.vim/shortcut.md'],
		\ ['Fn shortcut', 'call HelpFNShortCutToggle()'],
		\ ['coc command', 'call HelpCocShortCutToggle()'],
		\ ['vim tips', 'call HelpVimTipsToggle()'],
		\ ['snip',  'e ~/.vim/doc/vim-snip'],
		\ ]
	let s:opts = {'title': 'open help'}
	call quickui#listbox#open(s:content, s:opts)
endfunction
function! HelpFNShortCutToggle()
	let s:content= [
		\ ['F2 vim help'],
		\ ['F3 Autoformat', 'Autoformat'],
		\ ['F4 Paste'],
		\ ['F5 mouse and cursor', 'call Togglemouse()'],
		\ ['F6 line', 'call ToggleLine()'],
		\ ['F7 mouse', 'Vista!!'],
		\ ['F8 undotree', 'MundoToggle'],
		\ ['F10 Quickfix', 'call asyncrun#quickfix_toggle(6)'],
		\ ['F12 transparency', 'call Toggle_transparent_background()'],
		\ ]
	let s:opts = {'title': 'F shortcut'}
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
	let s:opts = {'title': 'F Coc shortcut'}
	call quickui#listbox#open(s:content, s:opts)
endfunction
function! HelpVimTipsToggle()
	let s:content= [
		\ ['<c-x><c-f> 补全文件名'],
		\ ['<c-x><c-i> 补全关键字'],
		\ ['<c-x><c-e> 插入模式下向上滚屏'],
		\ ['<c-x><c-y> 插入模式下向下滚屏'],
		\ ['"aY 存储到寄存器a'],
		\ ['. 当前行 $ 最后一行'],
		\ ['<c-o> 执行一次正常模式下的命令'],
		\ ['% 跳转到 {} () [] 的匹配'],
		\ ['zz 调整光标所在行到屏幕中央'],
		\ ['zt 调整光标所在行到屏幕上部'],
		\ ['zb 调整光标所在行到屏幕下部'],
        \ ['H 移动到屏幕顶部, M 中间 L 底部'],
        \ ['vim +num file: 从第num行开始'],
        \ ['f或ctrl+g -- 显示文档名，是否修改，和光标位置'],
        \ ['aw: 一词 as: 一句 ap: 一段 ab: 一块'],
		\ ['<c-o>跳转光标<c-i><c-o>逆转'],
		\ ['alt+shift+hkjl windows']
		\ ]
	let s:opts = {'title': 'F vim tips'}
	call quickui#listbox#open(s:content, s:opts)
endfunction
" }}}
" }}}

" {{{ get root project
function! GetRootPath()
    return finddir('.git/..', expand('%:p:h').';')
endfunction
command! -bang -nargs=* GRg
            \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'dir' : GetRootPath()}), <bang>0)
" }}}

" }}}
