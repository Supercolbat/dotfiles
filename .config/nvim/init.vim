" NeoVIM Config (init.vim)
" lots of stuff taken from other configs
" by supercolbat :p

" thanks to these configs:
"   https://gist.github.com/jdah/4b4d98c2ced36eb07b017c4ae2c94bab
"   wiki pages to plugins (especially CoC)

" todo:
"   split into multiple files?



call plug#begin("~/.vim/plugged")

" Themes
Plug 'tiagovla/tokyodark.nvim'
Plug 'arcticicestudio/nord-vim'

" Plugins
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'tommcdo/vim-lion'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()


" set file encoding
set encoding=utf-8

" Set theme
"colorscheme tokyodark
colorscheme nord

" Remap bad keybinds to good keybinds!
nnoremap <C-z> :undo<CR>

nmap <C-c> <ESC>
imap <C-c> <ESC>
vmap <C-c> <ESC>
omap <C-c> <ESC>

" Enable syntax highlighting
syntax on

" We'll see what this does
set number
set ruler

" Enable line-wrap
set wrap

" Make vim stay silent
set visualbell

" Mouse support
set mouse=a

" Disable backup files
set nobackup
set nowritebackup

" Shorten delays
set updatetime=300

" not sure but conquer of completion requires this
set hidden
set cmdheight=2
set shortmess+=c

" Always show sign column
if has("nvim-0.5.0") || has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

" Highlight search results
set hlsearch
set incsearch

" Enable auto and smart indent
set autoindent
set smartindent




" Function to change tab width to n *spaces*
function! SetTab(n)
    let &l:tabstop=a:n
    let &l:softtabstop=a:n
    let &l:shiftwidth=a:n
    set expandtab
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

" Coc Discord RPC
function! DiscordRPC(cmd)
    if a:cmd == "enable"
        CocCommand rpc.enable
    elseif a:cmd == "disable"
        CocCommand rpc.disable
    elseif a:cmd == "reconnect"
        CocCommand rpc.reconnect
    elseif a:cmd == "disconnect"
        CocCommand rpc.disconnect
    endif
endfunction

command! -nargs=1 DiscordRPC call DiscordRPC(<f-args>)






" ======== "
" NerdTREE "
" ======== "

let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = []

" Automatically close NVIM if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>


" ================== "
" fzf (fuzzy finder) "
" ================== "

" Toggle
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
\   'ctrl-t': 'tab split',
\   'ctrl-s': 'split',
\   'ctrl-v': 'vsplit'
\}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" =========== "
" Vim Airline "
" =========== "

let g:airline_extensions = []

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline_theme='minimalist'
" favorites:
" deus
" minimalist


" ===================== "
" Conquer of Completion "
" ===================== "
" lots of help from: https://github.com/neoclide/coc.nvim#example-vim-configuration

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python']


" Auto-complete on <tab>
inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') -1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction


" ~~~~~~~~~~~~~~~~~~~ "
" Integrated Terminal "
" ~~~~~~~~~~~~~~~~~~~ "
set splitright
set splitbelow

" set terminal to normal mode with <ESC>
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
    split term://zsh
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" set alt+hjkl to move between panels
" arrow keys, anyone?
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
