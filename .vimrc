" 判断{{{
let $myvimhome=$HOME
so $myvimhome/.workdiff/vimdiff
" }}}

so $myvimhome/.vim/.vimrc.general.vim
so $myvimhome/.vim/.vimrc.plugin.vim
so $myvimhome/.vim/.vimrc.my.vim
so $myvimhome/.vim/.vimrc.coc.vim

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
nmap <leader>s <Plug>(wildfire-quick-select)
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
" Save
nnoremap S :w<CR>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" " 设置快捷键将系统剪贴板内容粘贴至 vim
nnoremap <Leader>p "+p
" n 始终为向后搜索，N 始终为向前搜索
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

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

imap <c-x><c-f> <plug>(fzf-complete-path)
nnoremap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

let g:termdebug_wide=1
" Resize splits with arrow keys
" noremap <up> :res +5<CR>
" noremap <down> :res -5<CR>
" noremap <left> :vertical resize-5<CR>
" noremap <right> :vertical resize+5<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" 关闭方向键, 强迫自己用 hjkl
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
" 禁用 C+F C+B scroll CTRL-E    向下动滚一行
" PageDown CTRL-U   向上翻滚半屏 CTRL-B 向上滚动一屏 PageUp
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

" coc {{{
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
nnoremap <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nnoremap <silent> xB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nnoremap <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nnoremap <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nnoremap <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nnoremap <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nnoremap <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nnoremap <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nnoremap <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> xt <Plug>(coc-type-definition)<cr>
nnoremap <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
nnoremap <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

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
nnoremap <space>r :Ranger<CR>
nmap <Leader>er <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

" swith header and source
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

"}}}
"

" 文本对象
" y, d, c, v都可以跟文本对象。
