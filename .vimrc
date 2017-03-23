" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" ===================================================
"  Bundle Basic Config
" ===================================================

"Vim / Bundle Basic config -----------------------------------------------------{{{

syntax on
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
set nocompatible               " be iMproved
filetype on                    " required!
filetype plugin indent on      " required!
set encoding=utf-8             " Necessary to show Unicode glyphs

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" }}}

" ===================================================
"  Look and feel
" ===================================================

"Vim colorscheme and them ------------------------------------------------------{{{

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

set t_Co=256

" Solarized docs: http://ethanschoonover.com/solarized/vim-colors-solarized
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" }}}

" ===================================================
"  Vim Settings
" ===================================================

"Vim General Settigns ---------------------------------------------------------{{{

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Use Ctrl+c and Ctrl+p for copy/paste in vim to/from the System's Clipboard
vmap <C-c> "*y
vmap <C-p> "*p


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>

" bind Ctr +<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"add line numbers
set number
function! ToggleRelativeNumber()
    if &nu == 1
        set rnu
    else
        set nu
    endif
endfunction

command! Rn call ToggleRelativeNumber()

" History and Undo
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Ctrlp
Bundle 'ctrlp.vim'
let g:ctrlp_map = '<leader>,'
let g:ctrlp_max_height = 20
let g:ctrlp_open_new_file = 'v'

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" }}}


" ===================================================
"  Powerline and Bufferline Settigs
" ===================================================

"Vim airline Powerline ---------------------------------------------------------{{{

"Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

" Display on 1 window also
set laststatus=2
let g:airline_theme='powerlineish'

let g:airline#extensions#tabline#enabled = 1

" vim-powerline symbols
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
   let g:airline_left_sep = '»'
   let g:airline_left_sep = '▶'
   let g:airline_right_sep = '«'
   let g:airline_right_sep = '◀'
   let g:airline_symbols.crypt = '🔒'
   let g:airline_symbols.branch = '⎇'
   let g:airline_symbols.readonly = ''
   let g:airline_symbols.linenr = '␤'
   let g:airline_symbols.whitespace = 'Ξ'
   let g:airline_symbols.paste = 'ρ'
   let g:airline_symbols.maxlinenr = '☰'
endif

" change the text for when no branch is detected >
let g:airline#extensions#branch#empty_message = '⎇  No Branch'


"enable/disable virtualenv integration >
let g:airline#extensions#virtualenv#enabled = 1
let w:airline_section_x = '%{virtualenv#statusline()}'

"IndentationGuide <Leader>ig
Bundle 'nathanaelkane/vim-indent-guides.git'
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#998f84 ctermbg=245
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#d9cec3 ctermbg=252

" }}}


" ===================================================
"  Language Settigs
" ===================================================

"Filetype Settings -------------------------------------------------{{{
if has("autocmd")
    "All filetypes
    "remove trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//e

    "vim
    au FileType vim setlocal foldmethod=marker

    "Large files
    autocmd BufReadPost * if getfsize(bufname("%")) > 512*1024 | set syntax=| set filetype=| endif

    "Help
    "help in vertical split
    autocmd FileType help wincmd L

    " R
    autocmd FileType r setlocal ts=8 sts=4 sw=4 expandtab

    "Html
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2 expandtab

    "Python
    autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
    autocmd FileType python setlocal autoindent

    "nose for unittest
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python set formatprg=PythonTidy
    if exists('+colorcolumn')
          " autocmd FileType python set colorcolumn=80
    endif

    "Css
    autocmd Filetype css set omnifunc=csscomplete#CompleteCSS

    "Javascript
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

    "Json
    autocmd BufNewFile,BufRead *.json setfiletype json

    "Processing
    autocmd BufNewFile,BufRead *.pde setfiletype processing

    "Java
    au Filetype java setlocal foldexpr=MyFoldLevel(v:lnum)
    au Filetype java setlocal foldmethod=expr

    "Scons
    autocmd BufNewFile,BufRead SConstruct set filetype=scons

    "C++11
    autocmd BufNewFile,BufRead *.cpp set syntax=cpp
    autocmd BufNewFile,BufRead *.hpp set syntax=cpp

    "Racket
    autocmd BufNewFile,BufRead *.rkt,*.rktl set filetype=racket
    autocmd filetype racket set lisp
    autocmd filetype racket set autoindent

endif

" }}}

"Python Settings/Plugins --------------------------------------------- {{{

function! PythonTidySaver()
    let oldpos=getpos('.')
    %!PythonTidy
    call setpos('.',oldpos)
endfunction

"autocmd! bufwritepost *.py call PythonTidySaver()
"Virtualenv
if  has('python')
    Bundle 'jmcantrell/vim-virtualenv.git'

    let g:virtualenv_stl_format = '[%n]'

    if !empty($VIRTUAL_ENV)
        let g:virtualenv_auto_activate=1
    endif

    "ack to make vi work
    function! VirtualEnvStatusline()
    endfunction

endif


" Debugging
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


"Ropevim
let ropevim_vim_completion=1

"Pep8 plugin # using flake8
if has('python')
    Bundle 'orestis/pysmell.git'
    if executable("pep8")
        Bundle 'nvie/vim-pep8.git'
        autocmd FileType python map <buffer> <Leader>p :call Pep8()<CR>
    endif
endif


" Settings for jedi-vim
Bundle 'git://github.com/davidhalter/jedi-vim'
Bundle "xolox/vim-misc"
Bundle 'xolox/vim-pyref'
let g:jedi#usages_command = "<leader>z"
let g:jedi#goto_definitions_command = "<leader>g"
let g:jedi#documentation_command = "<leader>d"
let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 1

"Bundle 'fs111/pydoc.vim'
let g:pydoc_cmd='/usr/local/bin/pydoc'

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"set completeopt=longest,menuone
"function! OmniPopup(action)
"    if pumvisible()
"        if a:action == 'j'
"            return "\<C-N>"
"        elseif a:action == 'k'
"            return "\<C-P>"
"        endif
"    endif
"    return a:action
"endfunction
"
"inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" }}}

"C++ Settings/Plugins --------------------------------------------- {{{

Bundle 'octol/vim-cpp-enhanced-highlight'

let g:cpp_class_scope_highlight = 1

" }}}


"Racket Settings/Plugins --------------------------------------------- {{{
"
" mixing of racket code with plain text using an at-expression syntax
Bundle "git://github.com/vim-scripts/scribble.vim"
Bundle "git://github.com/wlangstroth/vim-racket"

" }}}

"NerdTree Plugin---------------------------------------------------- {{{

Bundle 'scrooloose/nerdtree'

nmap <silent><Leader>x  :NERDTreeToggle<CR>
nmap <silent><leader>nf :NERDTreeFind<CR>

let g:NERDTreeWinPos = "left"
""don't display the following files
let NERDTreeIgnore=['\.DS_Store$','\.pyc$', '\.xls$','\.zip$','\.pdf$','\.nav$','\.snm$','.\toc$','\.vrb$','\.aux$' , '\.git$', '\.db$', '\.ropeproject', '\.so$', '\.un\~$', '\.lein-plugins$']
let NERDTreeHighlightCursorline=1
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" "quit after opening a file
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
" "some styling
let NERDTreeDirArrows = 1
hi Title guifg=red guibg=#202020

if has("autocmd")
    autocmd Filetype nerdtree setlocal nolist
endif

" }}}


"Git plugins ------------------------------------------------------------------ {{{
"fugitive
Bundle 'tpope/vim-fugitive'

nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gco :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gcaa :Git commit -a --amend -C HEAD

"gitv
Bundle 'gregsexton/gitv'

"Gundo plugin
if has('python')
   Bundle 'sjl/gundo.vim.git'

   nnoremap <Leader>gu :GundoToggle<CR>
   let g:gundo_debug = 1
   let g:gundo_preview_bottom = 1
endif

" }}}


" Syntastic plugin ---------------------------------------------------------{{{

Bundle 'scrooloose/syntastic.git'
"checks syntax for multiple file type install
"   - cpp , c g++, gcc
"   - flake8 or pyflakes or pylint for python
"   - jsonlint for json
"   - java ?? / use eclim
"   - jslint for javascript
"
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checkers=['flake8', 'pyflakes']

highlight SyntasticErrorSign guifg=white guibg=red

" c++
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

 " }}}


" NerdCommenter plugin --------------------------------------------------------- {{{

Bundle 'scrooloose/nerdcommenter'


" }}}

" Neocomplete plugin --------------------------------------------{{{

Bundle 'Shougo/neocomplcache.git'

let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" " AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}

"other ------------------------------------------------------------------ {{{

Bundle 'vim-scripts/SearchComplete.git'
Bundle 'IndexedSearch'
Bundle 'leshill/vim-json'
Bundle 'airblade/vim-gitgutter'

" }}}
