" Under consideration: I'm not sure I want to make these changes yet, but its
" worth looking at making vim a bit more heavy and seeing how Neovim copes
"   * Something to visualize the undo state? Gundotree?
"   * Fugitive or maybe git-gutter. Particularly with github integration
"   * Rust Plug-ins: complete, compile, filetype config, etc.
"   * Python Plug-ins - complete, improved highlight/folding, etc.
"   * Lua Plugins - particularly a linter
"   * C-plugins - c.vim, possibly doxygen, 
"   * Git-flavoured markdown maybe something for graphviz and CSVs?
"   * Javascript, particularly react and node because we use those apparently?
"   * HTML/CSS/Javascript plugins - zencoding and the like?
"   * Write up a 'prose' mode (80 columns, centered text, no autocomplete, etc)

" Automatic plug-in handling
call plug#begin('~/.local/share/nvim/plugged')
   function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug '/usr/local/opt/fzf'                                       " Quick searching for files
  Plug 'lifepillar/vim-mucomplete'                                " A very light-weight completion plugin
  Plug 'chriskempson/base16-vim'                                  " Pretty colours
  Plug 'junegunn/fzf.vim'                                         " More FZF, additional Vim power
  Plug 'w0rp/ale'                                                 " Linting in the gutter

  " Some plug-ins that are generally useful for many programming languages
  Plug 'jiangmiao/auto-pairs'                                     " Automatic insertion/deletion of matching pairs of brackets and quotes
  Plug 'machakann/vim-sandwich'                                   " Simplify addition, change of pairs of characters like brackets and quotes
  Plug 'tpope/vim-commentary'                                     " Better handling of code comments. Toggle with 'gc' or run :Commentary
  Plug 'tpope/vim-endwise'                                        " Automatic insert of 'end' pairs like 'endfunc', 'fi', end', in Ruby, zsh, vim, etc.
  Plug 'rickhowe/diffchar.vim'                                    " Improvements to diff mode showing exact changes in lines
  " Some plug-ins unique to Ruby development
  Plug 'tpope/vim-rails',           { 'for': 'ruby' }             " Improved rails highlighting, helpers, etc.
  Plug 'vim-ruby/vim-ruby',         { 'for': 'ruby' }             " Improved ruby syntax highlighting navigation and spell checking

  " Some plug-ins unique to Golang development
  Plug 'fatih/vim-go'                                             " Improved syntax highlighting, folding, renaming ,linting, etc

  " Some more complicated auto completion stuff I'm not convinced are worth the complexity
  " Plug 'zchee/deoplete-go', { 'do': 'make'}                       " Code complete helper, depends on nsf/gocode
  " Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }             " Code completion for ruby, requires Solargraph (see the readme)
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Auto-complete/suggestion pop-up
  " Plug 'Shougo/neosnippet'                                        " Snippets - like tiny templates for code
call plug#end()

" Generic editor options
filetype plugin indent on                " Enable automatic file type detection & indentation
set autoread                             " Enable automatic reloading of open files edited outside Vim
set backspace=eol,start,indent           " Enable backspace past end of line, start of edit, etc.
set clipboard+=unnamed                   " Enable the system clipboard unless a register is specified
"set formatoptions+=a                     " Enable wrapping as you type
set hidden                               " Disable unloading of buffers that aren't visible
set history=1000                         " Enable remembering of 1000 commands, searches, inputs, and expressions
set mouse=a                              " Enable use of the mouse
set noerrorbells                         " Disable all error bells
set shortmess+=I                         " Disable show the startup screen
set visualbell                           " Disable beeping, use the visual bell instead
set wildmenu                             " Enable showing suggestions when using auto complete in command mode

" Providers for outside services
let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

" File encoding
set encoding=utf-8 nobomb                " Make new files UTF-8 without BOM by default (BOM can cause issues)
set fileencoding=utf-8                   " Enable saving files as UTF-8 by default
set expandtab                            " Enable the use of spaces instead of tabs when indenting
set shiftwidth=2                         " Enable using 2 spaces for each level of indent
set softtabstop=2                        " Enable inserting 2 spaces when you press Tab
set tabstop=8                            " Enable treating Tabs as 8 spaces to keep layout in tabbed files sane

" Backup and Swap
set backupdir=~/.vim/backup              " Path to store backup files (in case we screw up without real VCS)
set directory=~/.vim/swap                " Path to store swap files (so we don't pollute other paths)
set nobackup                             " Disable backup files (because we use Git for versioning)

" Persistent undo
set undodir=~/.config/nvim/undo          " Path to persist undo files (for history that lasts cross-session)
set undofile                             " Enable saving backups between sessions

" Spelling and custom dictionaries
set spellfile=~/.config/nvim/words.utf-8.add
set spelllang=en_ca                      " Enable the Canadian English spelling dictionary
set spell                                " Enable spell checking
" Expected path for CTags files
set tags+=,tags
" Expected default CScope database
cscope add cscope.out

" Indentation / cursor behaviour
set autoindent                           " Enable Copy the current line's indent when making a new line
set nojoinspaces                         " Disable inserting two spaces after punctuation when you use a Join
set smartindent                          " Enable 'smarter' auto-indenting watching Syntax for hints
set smarttab                             " Enable tab matching indentation when used at the start of a line
set nowrap                               " Disable automatic line wrapping

" File Browser configuration
let g:netrw_browse_split=4               " Enable opening the selected file in previous window
let g:netrw_liststyle=3                  " Enable netrw use a 'long'-style display (3=tree)
let g:netrw_size_style='h'               " Enable human-readable base-10 file sizes in the browser
let g:netrw_winsize=-40                  " Set the default width of the browser to 40 columns
" Enable hiding normally 'hidden' files in Netrw
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

" Search and replace
set inccommand=split                     " Show a preview of replacement commands as you type
set incsearch                            " Enable preview of a search while typing
set nohlsearch                           " Disable highlighting previous search results
set grepprg=rg\ --vimgrep\ --no-heading  " Enable the use of Ripgrep for searching
set grepformat=%f:%l:%c:%m               " Enable parsing of Ripgrep results (filename:line:column:match)

" Color and appearance
colorscheme base16-eighties              " Use the Base-16 colour scheme
let g:netrw_banner=0                     " Disable the Netrw 'chrome'
set background=dark                      " Enable Vim's 'use colours that look good on dark background' mode
set cursorline                           " Enable highlighting the row that the cursor is one
set colorcolumn=80                       " Enable a marker for the 80th column
set laststatus=2                         " Enable always showing the status line
set list                                 " Enable the display of 'invisible' characters like Tab, EOL, etc.
set number                               " Enable line-number display
set scrolloff=5                          " Enable always showing 5 lines above/below the cursor position
set showcmd                              " Enable size of selection in command area
set noshowmode                           " Disable showing the mode in the status line
set sidescrolloff=10                     " Enable always showing 10 characters to the right of the cursor
set signcolumn=yes                       " Enable the display of the sign column at all times
set wildignorecase                       " Ignore case sensitivity in wildmenu (like tab-completing :commands)
syntax enable                            " Enable syntax highlighting

" Improve the colors used in CScope windows and the like
highlight ModeMsg cterm=NONE ctermfg=5

" Set some Make spelling issues a little less colourful
highlight SpellBad cterm=underline ctermbg=0
highlight SpellRare cterm=none ctermbg=0
highlight SpellLocal cterm=none ctermbg=0
highlight SpellCap cterm=none ctermbg=0

" Configure some nicer glyphs for 'hidden' characters
set listchars=tab:▸\ ,eol:¬,trail:·

" Make comments and HTML arguments display as italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" Window and buffer management
set splitbelow                           " Open new splits below the currently active one
set splitright                           " Open new splits to the right of the currently active one

" Code folding
set nofoldenable                         " Disable folding by default
set foldlevel=1                          " Enable folding at the 'first level' inside of class/modules
set foldmethod=indent                    " Enable indent-based indenting (as opposed to syntax/manual)
set foldminlines=0                       " Enable folding of 'anything', even one line methods

" Custom key bindings start here
" ------------------------------

" Navigate splits with (control) ⌃[hjkl]  letter
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits using (option) ⌥ [hjkl] (These look weird because iTerm2 sends unusual keys)
noremap <silent> ˙ :20winc <<cr>
noremap <silent> ¬ :20winc ><cr>
noremap <silent> ˚ :5winc -<cr>
noremap <silent> ∆ :5winc +<cr>

" Change the leader key from \ to space
let mapleader="\<Space>"

" Create splits with <leader>[-|], they look like the split they create
map <silent> <leader>\| :vsplit<cr>
map <silent> <leader>- :split<cr>

" Manage buffers within a window using <leader> [ for previous, ] for next and \ to close
nnoremap <silent> <leader>] :bnext<cr>
nnoremap <silent> <leader>[ :bprev<cr>
nnoremap <silent> <leader>\ :b<bar>bd#<cr>
nnoremap <silent> <leader><BS> :bdelete!<cr>

" Toggled state: Zoom a buffer, line numbering, spelling, and wrapping
nnoremap <silent> <leader>z :ZoomToggle<cr>
nnoremap <silent> <leader>l :LineNumberToggle<cr>
nnoremap <silent> <leader>w :set wrap!<cr>
nnoremap <silent> <leader>s :set spell!<cr>

" Display the content of registers
nnoremap <silent> <leader>@ :registers<cr>

" Open and switch to files using fuzzy matching
nnoremap <silent> <leader>t :call fzf#vim#files('', {'options': '--preview-window=up:60% --preview "cat {}"'}, 1)<cr>
nnoremap <silent> <Leader>b :Buffers<cr>
nnoremap <silent> <leader>T :Tags<CR>
nnoremap <silent> <leader>B :BTags<cr>

" Search for words, F to open up Rg, f to search the word under the cursor
nnoremap <leader>F :Rg 
nnoremap <silent> <leader>f :Rg <C-r><C-w><cr>

" Toggle a file explorer
nnoremap <silent> <leader>e :Lex<cr>

" In command mode expect %% to expand path containing the current file
cnoremap %% <C-R>=expand("%:h").'/'<cr>

" In command mode, press ^r to search the history with FZF works for searches too
cnoremap <expr> <C-r> <SID>FzfCommandHistory()

" Toggle snippet expansions with tab, otherwise cycle auto-complete suggestions
" imap <expr><TAB>
"   \ neosnippet#expandable_or_jumpable() ?
"   \ "\<Plug>(neosnippet_expand_or_jump)" :
"   \ pumvisible() ? "\<C-n>" : "\<TAB>"

" Mu-completion
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['omni', 'c-p']
let g:mucomplete#chains.markdown = ['keyp', 'keyn', 'dict', 'uspl']
let g:mucomplete#chains.ruby = ['tags', 'c-p', 'uspl']

" Create a custom status-line
set statusline=%<                                        " Where to truncate the file name
set statusline+=%f                                       " Path of the file in the buffer, relative to CWD
set statusline+=%=                                       " Split between left and right side items
set statusline+=%{''!=#&filetype?&filetype:'none'}       " File-type mode flag
set statusline+=%{&readonly?'\ ×\ ':'\ \ \ '}            " Read-only flag
set statusline+=%{&modified?'\ ✎\ ':'\ \ \ '}            " Modified flag
set statusline+=%4v                                      " Row of cursor
set statusline+=,                                        " Literal comma
set statusline+=%-4l                                     " Column of cursor
set statusline+=%3p%%                                    " Percentage through the file

" Set colours: grey by default, green for insert mode
hi StatusLine cterm=reverse ctermfg=08 ctermbg=00
au InsertEnter * hi StatusLine cterm=reverse ctermfg=02 ctermbg=00
au Insertleave * hi StatusLine cterm=reverse ctermfg=08 ctermbg=00

" Toggle 'zooming' a split to fill the screen and restore to it's previous size
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()

" Toggle between relative and absolute numbers
function! s:LineNumberToggle() abort
  if (&relativenumber==1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc
command! LineNumberToggle call s:LineNumberToggle()

" Search using Ripgrep and FZF
function! Rg(...)
  call fzf#vim#grep(
    \ 'rg --column --line-number --no-heading --color=always -e '.shellescape(join(a:000)),
    \ 1,
    \ fzf#vim#with_preview('up:60%'),
    \ 1)
endfunc
command! -nargs=* Rg call Rg(<f-args>)

" Search command history with Fzf - press : then CTRL+R
function! s:FzfCommandHistory()
  let s:INTERRUPT = "\u03\u0c" " <C-c><C-l>
  let s:SUBMIT = "\u0d" " <C-m>
  let s:cmdtype = getcmdtype()
  let s:args = string({
    \ "options": "--query=" . shellescape(getcmdline()),
    \ })
  if s:cmdtype == ':'
    return s:INTERRUPT . ":keepp call fzf#vim#command_history(" .  s:args . ")" . s:SUBMIT
  elseif s:cmdtype == '/'
    return s:INTERRUPT . ":keepp call fzf#vim#search_history(" .  s:args . ")" . s:SUBMIT
  else
    return ''
  endif
endfunction

" Grep the Quickfix list, after using :grep to find stuff, filter it down with :GrepQF
function! GrepQuickFix(pat)
  call setqflist(filter(getqflist(), "bufname(v:val['bufnr']) !~# a:pat"))
endfunction
command! -nargs=* GrepQF call GrepQuickFix(<q-args>)

" Plug-in configuration
" ---------------------
" ALE - Linting
let g:ale_sign_error = '● '             " Use an solid circle symbol for errors in the sign column
let g:ale_sign_info = '‣ '              " Use a solid little arrow for 'info' in the sign column
let g:ale_sign_warning = '○ '           " Use a hollow circle symbol for warnings in the sign column
let g:ale_sign_column_always = 1        " Show the sign column even if there are no linter notes
let g:ale_lint_on_text_changed = 1      " Don't run the linter whenever the text of a file changes: fights with Deoplete
let g:ale_lint_on_enter = 1             " Run the linter whenever a file is opened
let g:ale_lint_on_save = 1              " Run the linter whenever a file is saved

" It may be nice to highlight the actual error here too - drop the 'sign' part
highlight ALEErrorSign        ctermfg=01 ctermbg=10
highlight ALEWarningSign      ctermfg=03 ctermbg=10
highlight ALEInfoSign         ctermfg=04 ctermbg=10
highlight ALEStyleErrorSign   ctermfg=03 ctermbg=10
highlight ALEStyleWarningSign ctermfg=03 ctermbg=10

" Deoplete - auto-completion
" let g:deoplete#enable_at_startup=1       " Enable auto-complete at startup
" let g:deoplete#max_list=20               " Enable maximum of 20 auto-complete suggestions
" let g:deoplete#auto_complete_delay=100   " Enable a 50ms wait before showing auto-complete options
" Use an extra large tags cache for large projects
" let deoplete#tag#cache_limit_size = 50000000

" " Configure some auto-completion trigger patterns
" let g:deoplete#sources#omni#input_patterns = {
"   \ "ruby" : '[^. *\t]\.\w*\|\h\w*::',
"   \ }

" Modify buffer ranking for auto complete suggestions
" call deoplete#custom#set('buffer', 'rank', 501)

" Vim-ruby configuration
" ----------------------
let g:ruby_indent_access_modifier_style = 'normal'    " Place 'access modifiers' at the same level as method definitions
let g:ruby_indent_block_style = 'do'                  " Always indent one level inside of a block
let g:ruby_indent_assignment_style = 'begin'          " Variable assignment lines up on the 'leftmost' column not the = sign
let ruby_spellcheck_strings = 1                       " Enable spell-checking inside strings

" Neosnippets - tiny text templates
" ---------------------------------
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#disable_runtime_snippets = {
  \'_' : 1,
  \ }

" Custom configuration for filetypes
" ----------------------------------
augroup filetype_go
  autocmd!
  autocmd BufNewFile,BufRead go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END

augroup filetype_ruby
  autocmd!
  autocmd BufNewFile,BufRead ruby setlocal expandtab tabstop=8 shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead ruby setlocal g:fzf_tags_command = 'ripper-tags --fields=+n -f'
augroup END

" Fix the tendency for netrw to leave unmodified buffers open
autocmd FileType netrw setl bufhidden=delete

" By default Vimdif has some pretty terrible colours. This should it sane. It's a bit of a work in progress
if &diff
  highlight Normal      cterm=none    ctermfg=08    ctermbg=0
  highlight DiffDelete  cterm=none    ctermfg=01    ctermbg=0
  highlight DiffAdd     cterm=none    ctermfg=02    ctermbg=0
  highlight DiffText    cterm=none    ctermfg=03    ctermbg=0
  highlight DiffChange  cterm=none    ctermfg=09    ctermbg=0
  set nospell
  set wrap
  let g:diff_translations = 0
  set filetype=text
  set syntax=diff
  set diffopt+=iwhite
  set diffexpr=""
  set colorcolumn=0
  autocmd FilterWritePre * if &diff | setlocal wrap< | set syntax=diff | set nofoldenable | set filetype=text | endif
  " ZZ to bale out of 'vimdiff' (nvim -d)
  nnoremap ZZ :qa!<cr>
end

" Jesus saves
command! Jesus w
