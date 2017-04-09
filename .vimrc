""" basic vim environment
set number
set hlsearch
set cursorline
set tw=78
set showcmd
set modeline

""" gvim configuration
if has("gui_running")
  set lines=50 columns=200
  set guioptions-=T
  set guifont=Monaco:h12
  set guioptions-=l
  set guioptions-=L
endif

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Plugin Syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✘'
let g:syntastic_style_error_symbol = '✘'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_python_checkers = ['pyflakes']

" Vim-blade
Plugin 'jwalton512/vim-blade'

" Vim-VueJS
Plugin 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'vue'
autocmd BufReadPre *.vue let b:javascript_lib_use_vue = 1

Plugin 'posva/vim-vue'
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" Vim-fugitive
Plugin 'tpope/vim-fugitive'

" VIM-JSX"
Plugin 'pangloss/vim-javascript' 
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}


call vundle#end()            " required

""" folding
"set foldmethod=syntax
set foldmethod=indent
set foldnestmax=2
set foldtext=MyFoldText()
set fillchars=fold:_

function! MyFoldText()
    " setting fold text
    let nl = v:foldend - v:foldstart + 1
    let comment = substitute(getline(v:foldstart), "^ *\" *", "", 1)
    let linetext = substitute(getline(v:foldstart+1), "^ *", "", 1)
    "let txt = '+ '.comment . ': ' . nl .  ' ' . v:foldstart . ' '
    let txt = getline(v:foldstart).' +-- '.nl.' lines'
    return txt
endfunction

nmap <space> za
nmap <CR> za
nmap e za

""" tabstops
set tabstop=4
set shiftwidth=2
set softtabstop=2
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2
set expandtab
set autoindent
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

""" Colorscheme
syntax on

"set background=light
set background=dark
set t_Co=16
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

let g:NERDTreeWinPos = 'left'

"""" Windows
au VimEnter * NERDTree

""" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\~$']
let NERDTreeDirArrows=0
let NERDTreeWinSize = 30 
let NERDTreeMapActivateNode='<space>'

let g:NERDTreeBookmarksFile = $HOME . '/.vim/.nerdtree-bookmarks'
let NERDTreeIgnore=[
      \'\.jar$',
      \ '\.pyc$',
      \'\.db$',
      \'Desktop',
      \'Templates',
      \'Videos',
      \'Steam',
      \'Public',
      \'Dropbox',
      \'Pictures',
      \'Music',
      \]

map <F2> :NERDTreeToggle<CR>

""" Misc
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType xhtml set ft=htmldjango.html " For SnipMate
autocmd FileType htmldjango set ft=htmldjango.html " For SnipMate
autocmd BufRead,BufNewFile *.twig set syntax=htmldjango " For sf2
let python_highlight_all=1

set enc=utf-8
 
"""ignore
let $PYTHONDONTWRITEBYTECODE = 1
let $PYTHONIOENCODING = 'utf-8'

Plugin 'scrooloose/nerdcommenter'
