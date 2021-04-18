" miracle_begin: this is a head config
" set mouse=a
set nocompatible              " required
" filetype off                  " required
filetype on                  " required
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" miracle_end

" miracle_begin: this is set allows split area of split layout
set splitbelow
set splitright
" miracle_end

" miracle_begin: this s set navifate split layout hot key
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" miracle_end

" miracle_begin:this is set enable folding
set foldmethod=indent
set foldlevel=99
" miracle_end

" miracle_begin: this is enable folding with the spacebar
nnoremap <space> za
" miracle_end

" miracle_begin: this is fix the problem of too many content was folded
Plugin 'tmhedberg/SimpylFold'
" miracle_end

" miracle_begin: this is set that display the folded document string
let g:SimpylFold_docstring_preview=1
" miracle_end

" miracle_begin: this is set the autoindent and the relevant
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.md
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set cindent |
    \ set history=50  " set command history to 50

" Default file setteings
set tabstop=4
" miracle_end

" miracle_begin: this is help for autoindent without always indent, for example when define multy-line function.
Plugin 'vim-scripts/indentpython.vim'
" miracle_end

" miracle_begin:this is flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" miracle_end

" miracle_begin: this is set the vim support UTF-8 code
set encoding=utf-8
" miracle_end

" Set vim font style
set guifont=Monaco:h13

" miracle_begin: this is set automatic completion
Plugin 'Valloric/YouCompleteMe'
" **If the Command above not work, using the mannual get function as 'git clone https://github.com/ycm-core/YouCompleteMe.git --depth=1', and move it into bundle directory.**

" let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_python_binary_path = '/Users/qiji/miniconda2/envs/python36/bin/python'
let g:ycm_python_interpreter_path = '/Users/qiji/miniconda2/envs/python36/bin/python'

" this is make sure your tooltip will not disappear and define go to definition hot-key
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>q :YcmCompleter GoToDefinitionElseDeclaration<CR>
" miracle_end

"" miracle_begin: this is python with virtualenv support(vim9+)
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
"" miracle_end

" miracle_begin: this is set grammar check and high-light
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" miracle_end

" miracle_begin: this is make your code beautiful
let python_highlight_all=1
syntax on
" miracle_end

" miracle_begin: this is edit your color plant
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" when to select which plant
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif
" switch the theme of plant Solarized
"call togglebg#map("<F5>")
" miracle_end

" miracle_begin: this is view files tree
Plugin 'scrooloose/nerdtree'
" use tab key
Plugin 'jistr/vim-nerdtree-tabs'
" hidden the .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0" " this is for mac
let g:NERDTreeMouseMode = 2
" add the hot-key
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
" miracle_end

" miracle_begin: supper search
Plugin 'kien/ctrlp.vim'
" miracle_end

" miracle_begin: this is display the line number
set nu
" miracle_end

" miracle_begin: this ad the git support
Plugin 'tpope/vim-fugitive'
" miracle_end

" miracle_begin: this is add Powerline status bar, for display virtual environment, git branch and edting file etc.
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/powerline/bindings/vim/'}
" miracle_end

" miracle_begin: this is set for use system original clipboard
"set clipboard=unnamed
" miracle_end

" miracle_begin: this is set the automatic completion for python. [YCM is better this, so I closed this feature]
" filetype plugin on
" let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
" miracle_end

" miracle_begin: this is set vim colorscheme for supprt in tmux
" note: in .tmux.conf, input the text [set -g default-terminal "screen-256color"]
set term=screen-256color
" miracle_end

color detorte
let g:detorte_theme_mode = 'dark'

" set up Vim-Markdown support for Vim Syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_math = 1

" set up Vim-Instant-Markdown suupport for Display md
Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_external_content = 1
map <F12> :InstantMarkdownPreview<CR>
" !!! For diplay mathematical formula !!! In my OSX, the vim-instant-preview is installed in
" /usr/local/lib/node_modules/instant-markdown-d/ folder, only need to change index.html file
" Add MathJax javascript library:
" add
" ```
" <script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>                                                                         
" <script type="text/x-mathjax-config">                                         
"   MathJax.Hub.Config({                                                        
"     tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}                            
"   });                                                                            
" </script>
" ```
" inside <head></head>
"
" !!! To do AotoUpdate !!!, change relevant part in your index.html to be like this
" socket.on('newContent', function(newHTML) {                                  
"         document.querySelector(".markdown-body").innerHTML = newHTML;              
"         MathJax.Hub.Queue(["Typeset", MathJax.Hub]);                                                
" });


" Set json view support
command! Jsonf :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;sys.stdout.write(re.sub(r\".*?\\\u[0-9a-f]{4}.*\", lambda m:m.group().decode(\"unicode_escape\").encode(\"utf-8\"), sys.stdin.read()))"'

" Set up Latex support
Plugin 'vim-latex/vim-latex'
let g:tex_flavor='latex'
Plugin 'xuhdev/vim-latex-live-preview'
autocmd Filetype tex setl updatetime=1
" let g:livepreview_previewer = 'open -a Skim'
let g:livepreview_previewer = 'open -a Preview'
nmap <F10> :LLPStartPreview<cr>
