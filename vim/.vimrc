" plugins setup
set nocompatible
filetype on
filetype plugin on
filetype indent on
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

" typing things
syntax enable
set number

" tab config
set tabstop=4
set shiftwidth=4
set expandtab


colorscheme default

" cursor line
set cursorline
hi clear CursorLine
hi clear CursorLineNr
hi CursorLine ctermbg=233 "ctermfg=15


" Vim-Plug plugins section
call plug#begin('~/.vim/plugged')

	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
	Plug 'wakatime/vim-wakatime'

call plug#end()

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0
let g:airline_theme='distinguished'

" NERDTree config
"autocmd vimenter * NERDTree " Старт nerdtree при запуске vim
nnoremap <C-t> :NERDTreeToggle<CR> " скрыть/открыть - Сtrl+t

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif


   " Highlighting
hi Comment ctermfg=65
"hi Identifier term=underline ctermfg=4
