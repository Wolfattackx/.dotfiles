let SessionLoad = 1
if &cp | set nocp | endif
nnoremap  
nnoremap 	 ==j
let s:cpo_save=&cpo
set cpo&vim
nnoremap <NL> <NL>
nnoremap  
nnoremap  
map   ,
nnoremap ,fw [I:let b:jump = input('Go To: ') | if b:jump !=? '' |   execute "normal! ".b:jump."[\t" |   unlet b:jump | endif 
nnoremap <silent> ,ll :if exists('w:longlines') |   silent! call matchdelete(w:longlines) |   unlet w:longlines | elseif &textwidth > 0 |   let w:longlines = matchadd('ColorColumn', '\%'.&textwidth.'v', &textwidth) | else |   let w:longlines = matchadd('ColorColumn', '\%80v', 80) | endif 
nnoremap ,cw :let b:sub = input('interactive replacement: ') | if b:sub !=? '' |   execute "%s//".b:sub.'/gc' |   unlet b:sub | endif 
vnoremap ,cw "hy :let b:sub = input('interactive replacement: ') | if b:sub !=? '' |   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') |   execute '%s/'.b:rep.'/'.b:sub.'/gc' |   unlet b:sub b:rep | endif 
nnoremap ,sw :let b:sub = input('global replacement: ') | if b:sub !=? '' |   execute "%s//".b:sub.'/g' |   unlet b:sub | endif 
vnoremap ,sw "hy :let b:sub = input('global replacement: ') | if b:sub !=? '' |   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') |   execute '%s/'.b:rep."/".b:sub.'/g' |   unlet b:sub b:rep | endif 
nnoremap <silent> ,ss :let _p = getpos(".") |  let _s = (@/ != '') ? @/ : '' |  %s/\s\+$//e |  let @/ = _s |  nohlsearch |  unlet _s |  call setpos('.', _p) |  unlet _p 
nnoremap <silent> ,nn :if &number |    set nonumber | else |    set number | endif
nnoremap <silent> ,- :tabedit =expand("%:p:h")
nnoremap 0 ^
vnoremap < <gv
vnoremap > >gv
nnoremap N Nzzzv
nnoremap <silent> T :call Toggle_Theme()
nnoremap Y y$
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nnoremap n nzzzv
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
inoremap <silent>  :set pastea+:set nopastea
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set background=dark
set backspace=indent,eol,start
set backupdir=~/.cache/vim/backup//
set clipboard=unnamedplus,autoselect,exclude:cons\\|linux
set confirm
set directory=~/.cache/vim/swap//
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fillchars=vert:â”ƒ
set helplang=en
set listchars=tab:Â»Â»,trail:â€¢
set mouse=a
set ruler
set shiftwidth=4
set shortmess=filnxtToOaAcIws
set showbreak=â†ª
set showcmd
set smartcase
set softtabstop=4
set suffixes=.bak,~,.o,.info,.swp,.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set tabstop=3
set termguicolors
set title
set undodir=~/.cache/vim/undo//
set wildmenu
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 ~/.esd_auth
argglobal
silent! argdel *
$argadd .esd_auth
edit ~/.esd_auth
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
nnoremap <buffer> <silent> <expr> j v:count ? 'j' : 'gj'
nnoremap <buffer> <silent> <expr> k v:count ? 'k' : 'gk'
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=3
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOaAcIws
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
