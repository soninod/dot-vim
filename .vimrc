""" basic vim environment
set number
set hlsearch
set cursorline
set tw=78
set showcmd
set modeline

""" gvim configuration
set guifont=Monaco\ 12
if has("gui_running")
  set lines=50 columns=200
  set guioptions-=T
  set guifont=Monaco:h12
  set guioptions-=l
  set guioptions-=L
endif


""" folding
"set foldmethod=syntax
set foldmethod=indent
set foldnestmax=2
set foldtext=MyFoldText()
set fillchars=fold:_
"set foldcolumn=4
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
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

""" tabstops
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2
set expandtab
set autoindent
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

""" Colorscheme
syntax enable
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

" Omnicompletion
" set Ctrl+j in insert mode, like VS.Net
imap <C-j> <C-X><C-O>
" :inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<CR>"
" set completeopt as don't show menu and preview
set completeopt=menuone
" " Popup menu hightLight Group
" highlight Pmenu ctermbg=13 guibg=LightGray
" highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
set nocompatible
filetype plugin indent on
set enc=utf-8
 
"""ignore
let $PYTHONDONTWRITEBYTECODE = 1
let $PYTHONIOENCODING = 'utf-8'
