" plugins setup
set nocompatible
filetype on
filetype plugin on
filetype indent on
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set t_Co=256

" typing things
syntax enable
set number

" tab config
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme 256_noir

set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

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
let g:airline#extensions#keymap#enabled = 1
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 1
let g:airline_theme='base16'

" NERDTree config
"autocmd vimenter * NERDTree " Старт nerdtree при запуске vim
nnoremap <C-t> :NERDTreeToggle<CR> " скрыть/открыть - Сtrl+t

" Copy with Wayland
xnoremap <silent> y :w !wl-copy<CR><CR>
" Paste from Wayland
noremap <silent> p :r !wl-paste<CR><CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
