" Hello.
" Last change:  2021 Jan 10

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
Plug 'tmhedberg/SimpylFold'      " folding plugin for Python
"Plug 'msuperdock/vim-foldout'
Plug 'Konfekt/FastFold'           " entering a string doesn't open all closed folds
Plug 'preservim/nerdtree'
Plug 'posva/vim-vue'
Plug 'junegunn/fzf'               " requires fzf (and ag, see below) installed
Plug 'mileszs/ack.vim'            " requires ack installed
Plug 'vim-airline/vim-airline'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'     " display git diff in sign column
Plug 'sheerun/vim-polyglot', { 'tag': 'v4.17.0' }
Plug 'neoclide/coc.nvim', {'branch': 'release'} " :CocInstall coc-tsserver coc-json (with nodejs used)
Plug 'christoomey/vim-tmux-navigator'
Plug 'svermeulen/vim-cutlass'     " d for delete, m for cut, no paste buffer affected
Plug 'svermeulen/vim-yoink'       " history of yanks when pasting with c-n c-p
Plug 'tpope/vim-surround'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

" use ag for fzf, show hidden files but exclude .git
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

let mapleader=","

set encoding=utf-8                " Ensure utf-8 file encoding.

set showcmd                       " Display incomplete commands.

set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.

set number                        " Show line numbers.

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

set colorcolumn=120              " Draw margin at line 120
:hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Show tabs, newline characters, etc
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:< " ,space:␣

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline+=%{FugitiveStatusline()}

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set updatetime=500                " delay for gitgutter and creating swap files

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif



" set custom indent colors & map F4 to show indents
let g:indent_guides_auto_colors = 0
nnoremap <F4> :IndentGuidesToggle<CR>
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" alternatively, paste this to colorscheme file
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4

let g:SimpylFold_docstring_preview=1 " docstrings for folded code

" recommended indent plugin Plugin 'vim-scripts/indentpython.vim'

"au BufNewFile,BufRead *.js setlocal foldmethod=indent foldcolumn=1 foldlevelstart=99
set foldmethod=syntax " indetn's also cool
set foldcolumn=1
set foldlevelstart=99
"let javaScript_fold=1
let g:javaScript_fold = 1     " from Konfekt/FastFold

" vim-syntastic options, edit after reading :help syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']  " :help syntastic-checkers

let g:coc_disable_startup_warning = 1

let g:ansible_unindent_after_newline = 1

colorscheme moonshine             " Theme from flazz/vim-colorschemes

" Key mappings
"   map = normal, visual, select
"   noremap  = normal, visual, select non-recursive
"   nmap = normal
"   vmap = visual
noremap <F2> :FZF<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <F5> :set list!<CR>
noremap <space> za

noremap <leader>tt :tabnew<cr>
noremap <leader>te :tabedit
noremap <leader>tc :tabclose<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprevious<cr>
noremap <leader>tf :tabfirst<cr>
noremap <leader>tl :tablast<cr>
noremap <leader>tm :tabmove

" vim-cutlass
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

" vim-yoink
let g:yoinkIncludeDeleteOperations=1
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

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
" https://www.reddit.com/r/vim/comments/2x52gt/argument_against_nnoremap/
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" echo 'set editing-mode vi' > ~/.inputrc to enable vim keybindings in the shell
" tags
"   Ctrl+] with cursor on a method to jump to it's definition
"   :tag methodName to jump to it's definition
"   :tag a<tab> to list all tags starting with a
"   :3tag methodName to jump to 3rd definition of the tag
"   :tselect word or g] in normal mode - see tag definitions for a given word
"   :tags to see stack of latest used tags, Ctrl+T or :pop to pop
"
" marks
" lowercase characters for marks within a file, uppercase for global marks
" mV to save global mark under V, any previous mark under V is deleted
" mv to save local mark under v, any previous mark (within the file) is deleted
" 'V anywhere (but in vim) to open the file under specified mark
" 'v with particular file opened to move cursor under mark

" Help
" F1, :h, :help - open help window
" Ctrl+] - open hyperlink
" Ctrl+t - move back from hyperlink
" :h <topic> - jump to a topic
" :set wildmenu - autocomplete when typing help topics with TAB
