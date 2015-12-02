"---------------------------
" Start Neobundle Settings.
"---------------------------
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
NeoBundleFetch 'Shougo/neobundle.vim'
 
" NERDTree
NeoBundle 'scrooloose/nerdtree'

" unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'surround.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'bronson/vim-trailing-whitespace'


" html,css,javascript
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'moll/vim-node'

" ruby
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'

" rails
NeoBundle "slim-template/vim-slim"
NeoBundle "tpope/vim-haml"

call neobundle#end()
 
" Required:
filetype plugin indent on
 
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

" unite
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1
 
" autocmd VimEnter * execute 'NERDTree'

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" iterm color hybrid
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
syntax on

"set background=dar

set clipboard=unnamed,autoselect



let g:indent_guides_enable_on_vim_startup = 1


" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

set statusline+=%{fugitive#statusline()}
set title
set showcmd
set background=dark
set expandtab
set incsearch
set number
set showmatch
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
syntax on
highlight LineNr ctermfg=darkyellow

hi LineNr ctermbg=0 ctermfg=4
hi CursorLineNr ctermbg=4 ctermfg=3
set cursorline
hi clear CursorLine
