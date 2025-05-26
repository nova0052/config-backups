"" General

" configuration for vim-plug and plugins
" 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-scripts/delek.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
call plug#end()

" NOTE: not all deleks are equal! Use an old one like from vimscripts/delek.vim or flazz/vim-colorschemes
" if colors are wrong on MacOS, you might need to manually copy the color
" scheme files into ~/.vim/colors , or use the 'rtp' option on the plugin
colo delek
set background=dark " makes highlighted text read properly with delek scheme
syntax on
set number "relativenumber	" Show line numbers
set wrap        " wrap text visually
set linebreak	" Break lines at word (requires Wrap lines)
set nolist      " important so Vim doesn't insert newlines
set textwidth=0	" important so Vim doesn't insert newlines
set showmatch	" Highlight matching brace

" syntax highlighting for cinder files
au BufNewFile,BufRead *.cinder set filetype=javascript

" color fixes for visual selection
highlight Normal ctermfg=248 ctermbg=16 guibg=black guifg=white
highlight Visual term=bold cterm=bold ctermbg=234 ctermfg=NONE

" color fix for parentheses highlighting
highlight Matchparen ctermfg=black ctermbg=cyan
highlight Search ctermfg=black

" color adjustments for folds and splits
highlight VertSplit ctermfg=237 ctermbg=247
highlight Folded ctermbg=237 ctermfg=33
highlight FoldColumn ctermbg=237 ctermfg=33

" color adjustments to make :Gvdiff less painful
highlight DiffAdd ctermbg=235 ctermfg=28
highlight DiffChange ctermbg=235 cterm=italic ctermfg=94
highlight DiffText ctermbg=235 cterm=italic ctermfg=220
highlight DiffDelete ctermbg=235 ctermfg=88

" other miscellaneous color adjustments
highlight comment cterm=italic ctermfg=88

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

" remap <esc> to clear highlighted search results
nnoremap <esc> :noh<return><esc>

" needed so that vim still understands escape sequences,
" which fixes a problem introduced by the remap to remove highlighting
nnoremap <esc>^[ <esc>^[

filetype plugin indent on
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set splitbelow " open new split windows below instead of above
set splitright " open new splits on the right instead of the left

" make sure Vim can use 256 colors
set t_Co=256

"always show status bar
set laststatus=2

"show full path in status bar
set statusline +=%F

"highlight status bar of active window, make others dark gray
highlight StatusLineNC cterm=bold ctermbg=darkgray ctermfg=lightgray 


" make Ctrl-p plugin use ripgrep
if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --glob ""'
endif
