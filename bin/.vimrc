" curl -fLo ~/.vim/pack/plugged/opt/vim-plug/plugin/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"=========== Install plugins ==========
packadd vim-plug

if exists('g:loaded_plug')
call plug#begin('~/.vim/pack/plugins/opt')

" #### Setup Themes #######
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-gruvbox8', {'as': 'gruvbox8'}
Plug 'rakr/vim-one', {'as': 'one'}
" ###### End Setup Themes #####

Plug 'tpope/vim-commentary'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lambdalisue/fern.vim', {'as': 'fern'}
Plug 'lambdalisue/fern-git-status.vim', {'as': 'fern-git-status'}
Plug 'junegunn/fzf'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
" Plug 'vim-vdebug/vdebug'
" Plug 'puremourning/vimspector'

call plug#end()
" ##### End Install Plugins ######
else

" ###### Enable Plugins ########
packadd! vim-airline
packadd! vim-airline-themes
packadd! vim-commentary
packadd! vim-gutentags
packadd! fern
packadd! fern-git-status
packadd! fzf
packadd! vim-which-key
packadd! vim-fugitive
" packadd! vdebug
" packadd! vimspector


"======== End enable plugin =========

" ======== Themes Configuration ====
colorscheme gruvbox8
" colorscheme one
set background=dark
set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h14

" ==== Vim Airline Configuration ====
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = 'ln'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.colnr='col'"

let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
" ========= End Theme Configuration ==========


"=========== Generic Configuraiton ============
set nocompatible
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set wrap 
set linebreak 
set textwidth=0 " Fix automatically insert break on wrap
set showcmd
set wildmenu
set autoindent
set hidden
set listchars=tab:▶.
set list
set laststatus=2
" Enable folding
set foldmethod=indent
set foldlevel=99

syntax on
filetype plugin on
filetype indent on

map <silent> <esc> :noh <CR>
" map leader key
map ' \

" =============== Which Key Configuration =================
nnoremap <silent> <leader> :<C-U>WhichKey '\'<CR>
nnoremap <silent> <space> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <space> :<c-u>WhichKeyVisual '<Space>'<CR>
call which_key#register('<space>', "g:which_key_map_space")
" autocmd! User vim-which-key call which_key#register('<space>', 'g:which_key_map')
let g:which_key_map_space =  {}
let g:which_key_map_space =  {
      \ 'name' : '' ,
      \ '/' : ['gcc' , 'Comment Line'],
      \ 'Q' : [':q' , 'Exit'],
      \ 'q' : ['' , 'which_key_ignore'],
      \ 'F' : [':FZ' , 'Fuzzy Search'],
      \ '#' : [':bd #' , 'Close Other Buffer'],
      \ 'E' : [':Fern . -drawer -width=30 -toggle' , 'File Explorer'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['b'] =  {
      \ 'name' : '+Buffer' ,
      \ 'c' : [':bp | bd #' , 'Close Buffer'],
      \ 'd' : [':bd' , 'Delete Current Buffer'],
      \ 'Q' : [':q!' , 'Close Without Save'],
      \ '#' : [':bd #' , 'Delete Other Buffer'],
      \ '<' : [':bprevious' , 'Go to Previous Buffer'],
      \ '>' : [':bnext' , 'Go to Next Buffer'],
      \ 'n' : [':enew' , 'Create New Buffer'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['d'] =  {
      \ 'name' : '+Debug' ,
      \ 'q' : [':q' , 'Close Buffer'],
      \ 'Q' : [':q!' , 'Close Without Save'],
      \ '#' : [':bd #' , 'Close Other Buffer'],
      \ 't' : [':Fern . -drawer -width=30 -toggle' , 'Toggle File Explorer'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['f'] =  {
      \ 'name' : '+File' ,
      \ 's' : [':w' , 'Save'],
      \ 'S' : [':wq' , 'Save and Exit'],
      \ 'q' : [':q' , 'Exit'], 
      \ 'Q' : [':q!' , 'Exit Without Save'],
      \ '#' : [':bd #' , 'Close Other Buffer'],
      \ 't' : [':Fern . -drawer -width=30 -toggle' , 'File Explorer'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['t'] =  {
      \ 'name' : '+Toggle' ,
      \ 'v' : [':set cursorcolumn!' , 'Cursor Column'],
      \ 'c' : [':set cursorline!' , 'Cursor Line'],
      \ 'f' : [':Fern . -drawer -width=30 -toggle' , 'Toggle File Explorer'],
      \ 't' : [':TagbarToggle' , 'Toggle Tagbar'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['c'] =  {
      \ 'name' : '+Configuration' ,
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['c']['c'] =  {
      \ 'name' : '+ColorScheme' ,
      \ 'g' : [':colorscheme gruvbox8' , 'Gruvbox'],
      \ 'o' : [':colorscheme one' , 'One Pro'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['c']['v'] =  {
      \ 'name' : '+Vimrc' ,
      \ 'e' : [':e $MYVIMRC' , 'Edit .vimrc'],
      \ 'r' : [':source $MYVIMRC' , 'Reload .vimrc'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['g'] =  {
      \ 'name' : '+Git' ,
      \ 'g' : [':Git' , 'Git Status'],
      \ 'l' : [':Git log' , 'Git Status'],
      \ 'd' : [':Git diff' , 'Git Diff'],
      \ 'p' : [':Git pull' , 'Git Pull'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['?'] =  {
      \ 'name' : 'Help' ,
      \ 'c' : ['' , 'Comment Out'],
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
let g:which_key_map_space['w'] = {
      \ 'name' : '+Windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ 't' : [':term'     , 'Open Termnial']    ,
      \ '?' : [':Windows'    , 'fzf-window']            ,
      \ ' ' : ['' , 'which_key_ignore'],
      \ }
" ============================================================
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>q :bp <BAR> bd #<CR>
inoremap jk <ESC>
inoremap kj <ESC>

" nnoremap <space> za

" Remap arrow keys
nnoremap <left> <C-W>h
nnoremap <right> <C-W>l
nnoremap <up> <C-W>k
nnoremap <down> <C-W>j

set viminfo='5,f1,\"50,:20,%,n~/.vim/viminfo"

" ======= Fern Configuration ========
nnoremap <C-n> :Fern . -drawer -width=30 -toggle<CR>
nnoremap <leader>f :Fern %:h -drawer -reveal=% -width=30<CR>
let g:fern#default_hidden=1
" === End Fern Configuration ========

" === Fuzzy Search Configuration ========
nnoremap <leader>F :FZ<CR>
nnoremap <C-p> :FZ<CR>

" Automatically save the session when leaving Vim
"autocmd! VimLeave * mksession ~/.vim/vim_session.vim
" Automatically load the session when entering vim
"autocmd! VimEnter * source ~/.vim/vim_session.vim

" XMLint configuration
" set equalprg=xmllint\ --format\ -
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

augroup python
    autocmd!
    " Add shiftwidth and/or softtabstop if you want to override those too.
    autocmd FileType python setlocal noexpandtab tabstop=4
augroup end

" ====== Gutentags Configuration ==========
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
let g:gutentags_cache_dir = '~/.vim/gutentags'
set statusline+=%{gutentags#statusline()}
" ========================================
"
"
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9003

endif
