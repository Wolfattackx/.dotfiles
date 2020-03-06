set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'kaicataldo/material.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set title
set tabstop=3

set showcmd
set smartcase
set nobackup
set autochdir
set autoread
set ignorecase
set incsearch
set noshowmode

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Go to last file(s) if invoked without arguments.

" Colors & styles
let g:material_theme_style = 'ocean'
let g:material_terminal_italics = 1

colorscheme material

"Setting the line HighLighting
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR cterm=bold ctermbg=15 ctermfg=8 gui=NONE guibg=#000000 guifg=#ff8000
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermbg=15 ctermfg=8 gui=NONE guibg=#00000 guifg=#ff8000
augroup END

set cursorline

"Lightline
set laststatus=2
let g:lightline = { 'colorscheme': 'material_vim' }

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

set nu
set ai

