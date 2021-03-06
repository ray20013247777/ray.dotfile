" -----------------------------------------
" Vundle Settings
" -----------------------------------------
filetype off    " for Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/ListToggle'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/nerdtree'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
"Bundle 'fatih/vim-go'\
"Bundle 'hynek/vim-python-pep8-indent'
"Bundle 'Valloric/YouCompleteMe'"
"Bundle 'ctags.vim'"
"Bundle 'taglist.vim'
"Bundle 'tagbar'
"Bundle 'fcamel/gj'


" -----------------------------------------
" General Settings
" -----------------------------------------
set nocompatible        " be iMproved
set nu	                " show the line number; use [set nonu] to close;
set cursorline          " highlight current line
set nowrap              " never auto change to next line
set paste               " can use <Cmd>+v to paste in vim
set hlsearch            " highlight search

" restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo

set autoindent          " auto indentation
set smartindent         " a improvement of autoindent
set copyindent          " copy the previous indentation on autoindenting
set incsearch           " incremental search
set nobackup            " no *~ backup files
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to context

set wildchar=<TAB>      " when type command, use <tab> to do completion
set wildmenu
set wildmode=longest:full,full
set showmatch			" show the matching symbol, like { }
set showmode			" show normal mode
set noswapfile

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" dragable gdf
set ttymouse=xterm2

set mouse=n

filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins

syntax on	            " use syntax
set t_Co=256            " 256 color mode
colorscheme hybrid
set background=dark
set t_ut=               " fix tmux color

" TAB setting
set tabstop=4
set softtabstop=4	    " the default tab space size=4
set shiftwidth=4	    " the default autoindenting space size=4
"set expandtab	        " replace <TAB> with spaces
" show tab

au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.bash set filetype=sh
au FileType Makefile set noexpandtab
au Filetype html setlocal ts=2 sw=2 expandtab

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc
"----------------------------------------------------------------------- 
" ENCODING SETTINGS
"----------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
  set encoding=utf-8                                  
  set termencoding=big5
endfun

fun! UTF8()
  set encoding=utf-8                                  
  set termencoding=big5
  set fileencoding=utf-8
  set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
  set encoding=big5
  set fileencoding=big5
endfun

"----------------------------------------------------------------------- 
" PLUGINS
"-----------------------------------------------------------------------
" --- NERDTree & NERDTreeTabs----
" don't open nerdtree_tabs when gvim/macvim open; otherwise, 0
let g:nerdtree_tabs_open_on_gui_startup = 0

" NERDTreeTabsToggle bind to <F2>
map <F2> <Esc>:NERDTreeTabsToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
  call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
  call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
  call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" NERDTress file arrow
  let g:NERDTreeDirArrows = 1
  let g:NERDTreeDirArrowExpandable  = '~'
  let g:NERDTreeDirArrowCollapsible = '▼'
" -------------------------

"" --- tagbar -------------
nmap <F3> :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
    \ 'o:objects',
    \ 'f:functions',
    \ 'a:arrays',
    \ 's:strings'
    \ ]
\ }
" -------------------------

" --- easymotion ------------
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" --- vim-airline ------------
set laststatus=2
let g:airline_powerline_fonts = 1

" --- vim-json ------------
let g:vim_json_syntax_conceal = 0
