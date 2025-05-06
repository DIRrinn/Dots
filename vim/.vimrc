" plugins setup
set nocompatible
filetype on
filetype plugin on
filetype indent on
set encoding=utf-8


" typing things
syntax on
set number

" tab config
"set tabstop=4
"set shiftwidth=4
"set expandtab

" cursor line
set cursorline
hi clear CursorLine
hi clear CursorLineNr
hi CursorLine ctermbg=233 ctermfg=15


" Vim-Plug plugins section
call plug#begin('~/.vim/plugged')

	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

call plug#end()

" airline config
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#keymap#enabled = 0
"let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
"let g:Powerline_symbols='unicode'
"let g:airline#extensions#xkblayout#enabled = 0

let g:airline_theme='tomorrow'
