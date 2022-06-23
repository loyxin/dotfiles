"解决coc.nvim大文件卡死状况
let g:trigger_size = 0.5 * 1048576

" coc 500 ms start
" let g:coc_start_at_startup=0
" function! CocTimerStart(timer)
	" exec "CocStart"
" endfunction
" call timer_start(500,'CocTimerStart',{'repeat':1})

" let g:coc_snippet_next =
" let g:coc_snippet_prev =
"

" snippet{{{
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-t>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_email='rafrozenluoxin@gmail.com'
let g:snips_author='rafrozen'
let g:UltiSnipsSnippetsDir=$myvimhome . '/.vim/UltiSnips'
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnips#ExpandSnippet = 1
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" async {{{
let g:asyncrun_open = 6
" }}}


let g:coc_global_extensions = [
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
\ 'coc-tabnine',
\ 'coc-tasks',
\ 'coc-translator',
\ 'coc-vimlsp',
\ 'coc-xml',
\ 'coc-yank',
\ ]
" coc-clangd for switch

" function! NearestMethodOrFunction() abort
  " return get(b:, 'vista_nearest_method_or_function', '')
" endfunction

" set statusline+=%{NearestMethodOrFunction()}

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: [" ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = [" ", " "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_sidebar_position = "vertical topleft"

" DoxygenToolkit{{{
"  let g:DoxygenToolkit_commentType = "C++" " ///
" let g:DoxygenToolkit_briefTag_pre="@brief  "
" let g:DoxygenToolkit_paramTag_pre="@param "
" let g:DoxygenToolkit_returnTag="@returns   "
" let g:DoxygenToolkit_authorName="loyxin rafrozenluoxin@gmail.com"
" let g:DoxygenToolkit_licenseTag="My own license"
let g:DoxygenToolkit_authorName="loy"
let g:doxygen_enhanced_color = 1
" }}}

let g:startify_change_to_vcs_root = 1
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

