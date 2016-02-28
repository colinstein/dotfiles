set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'gmarik/vundle'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'majutsushi/tagbar'
  Plugin 'slim-template/vim-slim'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-haml'
call vundle#end()

syntax on
set shell=/usr/local/bin/zsh
set nobackup
set directory=~/.vim/swap//
set nocompatible
set laststatus=2
set list
set hidden
set number
set nowrap
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
"set background=dark
set clipboard=unnamed
set colorcolumn=80
set nocp
set history=1000
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set listchars=tab:▸\ ,eol:¬,trail:·
set noerrorbells visualbell t_vb=
set autoread
set mouse=a
autocmd GUIEnter * set visualbell t_vb=

" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
colorscheme solarized
set guifont=Sauce\ Code\ Powerline\ Light:h14

" highlight search results in buffer. ENTER to clear in command mode
set hls
nnoremap <CR> :noh<CR><CR>

let mapleader=","
let g:mapleader=","

" navigate splits with ctrl+movement letter
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Create splits with leader - and |
map <leader>\| :vsplit<cr>
map <leader>- :split<cr>

" Toggle invisibles on/off
map <leader>i :set list!<cr>
" Toggle line numbers
map <leader>n :set invnumber!<cr>

" Toggle between relative and absolute numbers
function! LineNumberToggle()
  if (&relativenumber==1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc
map <leader>r :call LineNumberToggle()<cr>


" "Strip trailing whitespace
  function<SID>StripTrailingWhiteSpace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
nmap<leader>} :call <SID>StripTrailingWhiteSpace()<cr>

" disable arrow keys
noremap<up> <nop>
noremap<down> <nop>
noremap<right> <nop>
noremap<left> <nop>
inoremap<up> <nop>
inoremap<down> <nop>
inoremap<right> <nop>
inoremap<left> <nop>

" Nicely open files in windows. %% to expand path for current file
cnoremap %% <C-R>=expand("%:h").'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" Toggle spelling on and off
nmap <silent> <leader>s :set spell!<cr>
set spelllang=en_ca

" Line breaking
map <leader>w :set wrap!<cr>

" Airline - a powerline replacement
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" make ctrlP work more like command t
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'

" resize buffers
map <silent> <S-left> :20winc <<cr>
map <silent> <S-right> :20winc ><cr>
map <silent> <S-up> :5winc -<cr>
map <silent> <S-down> :5winc +

" manage buffers
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>
map <leader><Tab> :bdelete<cr>
" syntastic warning symbols
let g:syntastic_warning_symbol = '☆ '
let g:syntastic_error_symbol = '➤'"

" folding
set foldmethod=syntax
nnoremap <Space> za
vnoremap <Space> zf
set foldlevelstart=1

" Ctags
"set tags+=gem.tags
"map <leader>b :TagbarToggle<cr>

" tags - rippertags
" open fold up  one level
" close folds down one level
" fold with ruby comments above
"
" ruby/rails -- keybinds
" popupcomplete
" supertab
" snipmate
" you complete me
" tcomment
" quickfix

