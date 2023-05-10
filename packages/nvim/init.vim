" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" Editor plugins
Plug '907th/vim-auto-save' " saves automatically after each edit
Plug 'FooSoft/vim-argwrap' " <leader>a to split/unsplit arguments into sep lines
Plug 'kien/ctrlp.vim' " ctrlp smart fuzzy search
Plug 'mkitt/tabline.vim' " configurable tab labels
Plug 'ntpeters/vim-better-whitespace' " whitespace highlighting and stripping
Plug 'scrooloose/nerdtree' " nerdtree filesystem explorer
Plug 'tpope/vim-repeat' " allows to use . with many plugins too
Plug 'tpope/vim-surround' " change/add/delete surrounding quotes, parens etc.
Plug 'reedes/vim-pencil'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Note taking
Plug 'vimwiki/vimwiki'

call plug#end()
" }}}
" Plugin specific configurations {{{
" tabline theme options, refer official github page
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" strip whitespace on save
augroup Whitespace
autocmd BufWritePre * StripWhitespace
augroup END

" enable AutoSave on Vim startup
let g:auto_save = 1

" remove CtrlP file limits
"   see: https://github.com/kien/ctrlp.vim/issues/234
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:vimwiki_list = [{'path': '~/iCloud/VimWiki/', 'syntax': 'markdown', 'ext': '.md'}]

" }}}
" Editor {{{
" text width
set textwidth=120

" cursor cannot be on the border of the screen if there is any text later
set scrolloff=8

" stop redrawing the screen during the macros and other unnecessary times
" it makes macro execution much faster
set lazyredraw

" when splitting always create new window below and on the rightside
set splitbelow splitright
" }}}
" Visuals {{{

" basic visual settings
set background=dark

" show relative line numbers
set number
set relativenumber

" color 121th column
let &colorcolumn=121
highlight ColorColumn ctermbg=0

set cursorline

set visualbell
" }}}
" History and temporary files {{{

" current buffer can be put into background without saving, marks and undo
" history are remembered for future use
set hidden

" don't use swapfiles
set noswapfile

" }}}
" Spaces and tabs {{{
" setup spaces & tabs
"  tabstop is number of spaces per <TAB> found
"  softtabstop is number of spaces per TAB click
"    if mismatches tabstop then may result in spaces
"  shiftwidth changes number of spaces inserted when > is used
"  expandtab is inserting spaces instead of TAB character
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype csss setlocal ts=4 sts=4 sw=4 expandtab

" }}}
" Search {{{

" ignore generated files in wildcard search
set wildignore=*.swp,*.swo,*.bak,*.pyc,*.class

" }}}
" Key mappings {{{
" turn off search highlight hotkey \<space>
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line in case of line wrapping
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" allow Ctrl+HJKL window movements
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" allow toggling for paste mode
" set pastetoggle=<leader>p " problems in insert mode with leader and

" ArgWrap key binding
nnoremap <silent> <leader>a :ArgWrap<CR>

" toggle nerdtree with F2
map <F2> <plug>NERDTreeTabsToggle<CR>

" dispatch using F9, focus first
noremap <F9> :Dispatch<CR>

" }}}

" vim:foldmethod=marker:foldlevel=0
" vim:filetype=vim
