" vim:fileencoding=utf-8:foldmethod=marker
" Best enjoyed with Vim

"                          _           
"    _ __   ___  _____   _(_)_ __ ___  
"   | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
"  _| | | |  __/ (_) \ V /| | | | | | |
" (_)_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
" Configuration for Neovim
" [The cooler vim]
"


" Plugins will be downloaded under the specified directory.
" call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
call plug#begin("~/.vim/plugged")

" [Plugins] {{{

" File explorer
Plug 'preservim/nerdtree'

" File opener
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Bottom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" }}}

" [General configuration] {{{

" Set file encoding
set encoding=utf-8

" Enable syntax highlighting
syntax on

" Enable mouse support
set mouse=a

" }}}

" [General keybinds] {{{

" Remap Ctrl+Z (kill program)
nnoremap <C-z> :undo<CR>

" }}}

" [Plugin configuration] {{{

" [NERDTree] {{{

" Toggle tree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Close Neovim if NERDTree is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}

" }}}

" [Integrated terminal] {{{

" Set default split direction
set splitright
set splitbelow

" Set terminal to normal mode with <ESC>
tnoremap <Esc> <C-\><C-n>

" Automatically start temrinal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Open terminal with ctrl+n
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" }}}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
