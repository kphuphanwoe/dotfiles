call plug#begin("~/.vim/plugged")

Plug 'blueyed/vim-diminactive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.opt/fzf', 'do': './install --all' }
Plug 'kphuphanwoe/vim-airline'
" Plug 'kphuphanwoe/vim-clang'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'

call plug#end()

set tags=./tags;/
let g:diminactive_enable_focus = 1

" --- General ---
syntax on
colorscheme molokai
set background=dark
set backspace=indent,eol,start
set laststatus=2

set belloff=all
set clipboard=unnamed
set cursorline
set hlsearch
set incsearch
set number
set relativenumber
set pastetoggle=<F2>

nnoremap <F8> :TagbarToggle<CR>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

highlight ExtraWhitespace ctermbg=RED guibg=RED
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call  clearmatches()

command! -range=% TrimSpace keepp <line1>,<line2>s/\s\+$/
nnoremap <F12> :TrimSpace<CR>
nnoremap <S-F12> m`:TrimSpace<CR>``
vnoremap <S-F12> :TrimSpace<CR>

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let mapleader=','
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
