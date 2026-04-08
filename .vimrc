syntax on
set background=dark
set backspace=indent,eol,start
set clipboard=unnamed
set hlsearch
set pastetoggle=<F2>
set ruler
set number

let mapleader=','
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv
filetype indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

highlight Comment          ctermfg=4
highlight Constant         ctermfg=1
highlight WarningMsg       ctermfg=1   ctermbg=NONE
highlight Identifier       ctermfg=14  cterm=NONE
highlight Keyword          ctermfg=1
highlight Number           ctermfg=1
highlight Statement        ctermfg=130 cterm=NONE
highlight String           ctermfg=1
highlight Title            ctermfg=5
highlight Type             ctermfg=034 cterm=NONE
highlight PreProc          ctermfg=5
highlight Special          ctermfg=5
highlight LineNr           ctermfg=130

highlight DiffAdd          ctermfg=252 ctermbg=22  cterm=NONE
highlight DiffDelete       ctermfg=243 ctermbg=52  cterm=NONE
highlight DiffChange       ctermfg=252 ctermbg=236 cterm=NONE
highlight DiffText         ctermfg=252 ctermbg=23  cterm=NONE

highlight diffAdded        ctermfg=28
highlight diffRemoved      ctermfg=1
highlight diffNewFile      ctermfg=15  ctermbg=NONE cterm=bold
highlight diffFile         ctermfg=15  ctermbg=NONE cterm=bold
