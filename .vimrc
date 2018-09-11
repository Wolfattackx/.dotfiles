set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'dikiaap/minimalist'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'sts10/vim-pink-moon'
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



" Sane vim defaults for ArchLabs



" Arch defaults
runtime! archlinux.vim

" additional settings
set modeline                " enable vim modelines
set clipboard^=unnamedplus  " system clipboard (requires +clipboard)
set number                  " enable line numbers
set confirm                 " ask confirmation for some things, like save before quit, etc.
set wildmenu                " Tab completion menu when using command mode
set expandtab               " Tab key inserts spaces not tabs
set softtabstop=4           " spaces to enter for each tab
set shiftwidth=4            " amount of spaces for indentation
set shortmess+=aAcIws       " Hide or shorten certain messages

let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

" ------ leader mapping ------

let g:mapleader = ','
map <Space> ,

" ------ enable additional features ------

" enable mouse
set mouse=a
if has('mouse_sgr')
    " sgr mouse is better but not every term supports it
    set ttymouse=sgr
endif

" syntax highlighting
syntax enable

" change cursor shape for different editing modes (nvim does this by default)
if !has('nvim')
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
    else
        let &t_SI = "\e[6 q"
        let &t_SR = "\e[4 q"
        let &t_EI = "\e[2 q"
    endif
endif

set linebreak
set breakindent
" set list listchars=tab:>>,trail:~

if has('multi_byte')
    set listchars=tab:»»,trail:•
    set fillchars=vert:┃ showbreak=↪
endif

" ------ basic maps ------

" open ranger as a file chooser using the function below
nnoremap <leader>r :call <SID>ranger()<CR>

" paste while in insert mode
inoremap <silent><C-v> <Esc>:set paste<CR>a<C-r>+<Esc>:set nopaste<CR>a

" change windows with ctrl+(hjkl)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" alt defaults
nnoremap 0 ^
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Tab> ==j

" re-visual text after changing indent
vnoremap > >gv
vnoremap < <gv

" j = gj :: k = gk  while preserving numbered jumps eg. 12j
nnoremap <buffer><silent><expr>j v:count ? 'j' : 'gj'
nnoremap <buffer><silent><expr>k v:count ? 'k' : 'gk'

" open a new tab in the current directory with netrw
nnoremap <silent> <Leader>- :tabedit <C-R>=expand("%:p:h")<CR><CR>

" ------ autocmd ------

" Reload changes if file changed outside of vim requires autoread
augroup load_changed_file
    autocmd!
    autocmd FocusGained,BufEnter * if mode() !=? 'c' | checktime | endif
    autocmd FileChangedShellPost * echo "Changes loaded from file"
augroup END

" when quitting a file, save the cursor position
augroup save_cursor_position
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" enable cursorline in the currently active window
augroup cursorline
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" ------ adv maps ------

" toggle line numbers
nnoremap <silent> <Leader>nn
    \ :if &number <Bar>
    \    set nonumber
    \ <Bar> else <Bar>
    \    set number
    \ <Bar> endif<CR>

" strip trailing whitespace
nnoremap <silent> <Leader>ss
    \ :let _p = getpos(".") <Bar>
    \  let _s = (@/ != '') ? @/ : '' <Bar>
    \  %s/\s\+$//e <Bar>
    \  let @/ = _s <Bar>
    \  nohlsearch <Bar>
    \  unlet _s <Bar>
    \  call setpos('.', _p) <Bar>
    \  unlet _p <CR>

" global replace
vnoremap <Leader>sw "hy
    \ :let b:sub = input('global replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') <Bar>
    \   execute '%s/'.b:rep."/".b:sub.'/g' <Bar>
    \   unlet b:sub b:rep <Bar>
    \ endif <CR>
nnoremap <Leader>sw
    \ :let b:sub = input('global replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   execute "%s/<C-r><C-w>/".b:sub.'/g' <Bar>
    \   unlet b:sub <Bar>
    \ endif <CR>

" prompt before each replace
vnoremap <Leader>cw "hy
    \ :let b:sub = input('interactive replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') <Bar>
    \   execute '%s/'.b:rep.'/'.b:sub.'/gc' <Bar>
    \   unlet b:sub b:rep <Bar>
    \ endif <CR>
nnoremap <Leader>cw
    \ :let b:sub = input('interactive replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   execute "%s/<C-r><C-w>/".b:sub.'/gc' <Bar>
    \   unlet b:sub <Bar>
    \ endif <CR>

" highlight long lines
let w:longlines = matchadd('ColorColumn', '\%'.&tw.'v', &tw)
nnoremap <silent> <Leader>ll
    \ :if exists('w:longlines') <Bar>
    \   silent! call matchdelete(w:longlines) <Bar>
    \   unlet w:longlines <Bar>
    \ elseif &textwidth > 0 <Bar>
    \   let w:longlines = matchadd('ColorColumn', '\%'.&textwidth.'v', &textwidth) <Bar>
    \ else <Bar>
    \   let w:longlines = matchadd('ColorColumn', '\%80v', 80) <Bar>
    \ endif <CR>

" local keyword jump
nnoremap <Leader>fw
    \ [I:let b:jump = input('Go To: ') <Bar>
    \ if b:jump !=? '' <Bar>
    \   execute "normal! ".b:jump."[\t" <Bar>
    \   unlet b:jump <Bar>
    \ endif <CR>


" open ranger as a file chooser
function! <SID>ranger()
    let l:temp = tempname()
    execute 'silent !st -e ranger --choosefiles='.shellescape(l:temp).' $PWD'
    if !filereadable(temp)
        redraw!
        return
    endif
    let l:names = readfile(l:temp)
    if empty(l:names)
        redraw!
        return
    endif
    execute 'edit '.fnameescape(l:names[0])
    for l:name in l:names[1:]
        execute 'argadd '.fnameescape(l:name)
    endfor
    redraw!
endfunction

set title
set tabstop=3
"set cursorline
hi cursorline cterm=bold term=bold
"hi cursorline cterm=bold ctermfg=red ctermbg=yellow guifg=darkgrey

set showcmd
set smartcase
set autochdir
set autoread
set ignorecase
set incsearch
set noshowmode
set ruler
set background=dark

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
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" Colors & styles
"set t_Co=256
"set encoding=utf-8
set guifont=Hack
colorscheme material
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1

" Airline
let g:airline_theme='material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_z = '%3p%% %3l/%L:%3v'

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
