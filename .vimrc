"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" R.J.'s vimrc
" R.J. Aquino <rj@cs.harvard.edu>
" forked from Tommy MacWilliam <tmacwilliam@cs.harvard.edu>
"
" Be sure to read the README!
"
" Shortcuts:
"   ; maps to :
"   ,a: ack from the current directory
"   ,b: browse tags
"   ,c: toggle comments
"   ,C: toggle block comments
"   ,e: open file in new tab
"   ,l: toggle NERDTree
"   ,h: open a shell in a new tab
"   ,k: syntax-check the current file
"   ,m: toggle mouse support
"   ,o: open file
"   ,p: toggle paste mode
"   ,r: regex for multiple cursor placement
"   ,s: split window
"   ,t: new tab
"   ,w: close tab
"   ,.: search tags
"   kj: enter normal mode and save
"   Ctrl+{h,j,k,l}: move among windows
"   ii: operate on all text at current indent level
"   ai: operate on all text plus one line up at current indent level
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" long live vim
set encoding=utf-8
set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" plugins
Bundle 'tomtom/checksyntax_vim'

" color schemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/Skittles-Dark'
Bundle 'sickill/vim-monokai'
Bundle 'hukl/Smyck-Color-Scheme'
Bundle 'vim-scripts/wombat256.vim'

" plugins
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/trailing-whitespace'
Bundle 'vim-scripts/taglist.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kshenoy/vim-signature'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'gregsexton/gitv'

" syntax files
Bundle 'jelera/vim-javascript-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'voithos/vim-python-syntax'

" checksyntax config
let g:checksyntax#auto_mode = 0

" taglist config
let g:Tlist_Use_Right_Window = 1

" multiple-cursors config
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" syntax highlighting and auto-indentation
syntax on
filetype indent on
filetype plugin on
inoremap # X<C-H>#
set ai
set si
set nu

" omg folding is the worst
set nofoldenable

" omg automatic comment insertion is the worst
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" expand tabs to 4 spaces
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" faster tab navigation
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab> :tabnext<CR>

" always show tab line to avoid annoying resize
set showtabline=2

" searching options
set incsearch
set showcmd
set ignorecase
set smartcase

" disable backups
set nobackup
set nowritebackup
set noswapfile

" disable annoying beep on errors
set noerrorbells
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" font options
set background=dark
set t_Co=256
colorscheme smyck
set gfn=Inconsolata:h14

" keep at least 5 lines below the cursor
set scrolloff=5

" window options
set showmode
set showcmd
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" enable mouse support
set mouse=a

" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" word wrapping
set wrap
set linebreak
set nolist

" better tab completion on commands
set wildmenu
set wildmode=list:longest

" close buffer when tab is closed
set nohidden

" better moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" shortcuts to common commands
let mapleader = ","
nnoremap <leader>a :Ack
nnoremap <leader>b :TlistToggle<CR>
nnoremap <leader>c :TComment<CR>
nnoremap <leader>C :TCommentBlock<CR>
vnoremap <leader>c :TComment<CR>
vnoremap <leader>C :TCommentBlock<CR>
nnoremap <leader>e :tabnew<CR>:CtrlP<CR>
nnoremap <leader>h :tabnew<CR>:ConqueTerm bash<CR>
nnoremap <leader>l :NERDTreeTabsToggle<CR>
nnoremap <leader>k :CheckSyntax<CR>
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>p :set invpaste<CR>
nnoremap <leader>r :MultipleCursorsFind
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>. :CtrlPTag<CR>

" ; is better than :, and kj is better than ctrl-c
nnoremap ; :

" also autosave when going to insert mode
inoremap kj <Esc>:w<CR>

" more logical vertical navigation
nnoremap <silent> k gk
nnoremap <silent> j gj

" make copy/pasting nice
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=r
        set nonu
    else
        set mouse=a
        set nu
    endif
endfunction
nnoremap <leader>m :call ToggleMouse()<CR>

" statusline insert mode is blue
function! StatuslineInsertMode()
    hi statusline ctermbg=6
endfunction

" statusline normal mode is gray
function! StatuslineNormalMode()
    hi statusline ctermbg=240
endfunction
call StatuslineNormalMode()

" statusline visual mode is green
function! StatuslineVisualMode()
    hi statusline ctermbg=28
endfunction

" mode text
function! StatuslineModeText()
    let mode = mode()
    if mode == 'i'
        return 'INSERT'
    elseif mode == 'v'
        return 'VISUAL'
    else
        return 'NORMAL'
endfunction

" statusline
set laststatus=2
set statusline=%m\ %{StatuslineModeText()}\ %t\ %h%r%y\ %{fugitive#statusline()}\ %#error#%{&paste?'[paste]':''}%*%=%{strlen(&fenc)?&fenc:'none'}\ %{&ff}\ %P\ \L%l:\C%c

" insert mode
au InsertEnter * call StatuslineInsertMode()
au InsertLeave * call StatuslineNormalMode()

" visual mode
nnoremap <silent> v <ESC>:call StatuslineVisualMode()<CR>v
nnoremap <silent> V <ESC>:call StatuslineVisualMode()<CR>V
nnoremap <silent> <C-v> <ESC>:call StatuslineVisualMode()<CR><C-v>

" ctrl-c doesn't trigger insertleave, so manually switch statusline
map <C-c> <C-c>:call StatuslineNormalMode()<CR>
