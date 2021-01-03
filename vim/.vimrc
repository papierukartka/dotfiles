" Hello.
" Last change:  2020 Dec 04

set nocompatible                  " Use Vim settings, rather than Vi settings (must be first) 

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-rooter'
"Plug 'pearofducks/ansible-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
"Plug 'vim-syntastic/syntastic'
"Plug 'nvie/vim-flake8'  " use with F7
"Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold'       " folding plugin for Python
"Plug 'Konfekt/FastFold'
Plug 'preservim/nerdtree'
Plug 'posva/vim-vue'              " adds vue as a recognizable filetype
Plug 'junegunn/fzf'               " requires fzf installed
Plug 'mileszs/ack.vim'            " requires ack installed
Plug 'vim-airline/vim-airline'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'     " display git diff in sign column
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

colorscheme moonshine

set showcmd                       " Display incomplete commands.

set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
"set relativenumber               " Relavite line numbering (available when 'set number' active)

set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set undofile                      " Create undo file on editing

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
"set colorcolumn=120              " Draw margin at line 120

" Show tabs, newline characters, etc
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:< " ,space:␣
nnoremap <F5> :set list!<CR>

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline+=%{FugitiveStatusline()}

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set updatetime=500                " delay for gitgutter and creating swap files

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" set custom indent colors & map F4 to show indents
let g:indent_guides_auto_colors = 0
nnoremap <F4> :IndentGuidesToggle<CR>
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" alternatively, paste this to colorscheme file
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1 " docstrings for folded code

" plugin for separate file per extension https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean
" recommended indent plugin Plugin 'vim-scripts/indentpython.vim'
set encoding=utf-8
au BufNewFile,BufRead *.py           " set formatting for python code
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

autocmd FileType vue setlocal foldmethod=syntax   " folding vue.js code

" TODO javascript/cypress folding
"au BufNewFile,BufRead *.js setlocal foldmethod=indent foldcolumn=1 foldlevelstart=99
set foldmethod=syntax " indetn's also cool
set foldcolumn=1 
set foldlevelstart=99
"let javaScript_fold=1

"python with virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" vim-syntastic options, edit after reading :help syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']  " :help syntastic-checkers

let g:coc_disable_startup_warning = 1

let g:ansible_unindent_after_newline = 1

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F2> :FZF<CR>

" HELP SECTION
" set ai! to toggle autoindent, useful when pasting from clipboard
" :FZF opens interactive window
" :Ack text searches for text in files under current working directory (see :pwd, :cd %:p:h and :lcd %:p:h)
" :verbose set list? to check in which file the 'list' variable was set and what is it's value
" :set to see all defined variables
" :set list&  to reset list variable to default value
" :e some/directory to list directory contents
"   i cycle between listings
"   s to cycle sorting
"   r to reverse sort order
"   gh to hide/unhide dotfiles
"   x view file with associated viewer
"   d make directory
"   D delete file/directory
"   R rename file/directory
"   - go up a directory
" vim ftp://hostname/path/to/file opens remote file in local vim
" gf goto file under cursor, useful for opening imports
" ---
" Commenting:
" specified lines:
" :66,70s/^/#
" :66,70s/^#/
" visual block mode:
" Ctrl + v  # mark lines
" Shift + i # get into insert mode
" type #
" type Esc
" --
" https://freshman.tech/vim-javascript/
"
" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec
"
" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" echo 'set editing-mode vi' > ~/.inputrc to enable vim keybindings in the shell
