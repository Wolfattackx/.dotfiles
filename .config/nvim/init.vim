if !exists ('g:vscode')

	" Specify a directory for plugins
	" - For Neovim: stdpath('data') . '/plugged'
	" - Avoid using standard Vim directory names like 'plugin'
	call plug#begin('~/.vim/plugged')

	" Make sure you use single quotes

	Plug 'VundleVim/Vundle.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'sheerun/vim-polyglot'
  Plug 'prettier/vim-prettier'
	Plug 'scrooloose/nerdtree'
	Plug 'kaicataldo/material.vim'
	Plug 'beyondmarc/hlsl.vim'
	Plug 'tikhomirov/vim-glsl'
	Plug 'neoclide/coc.nvim', {'branch' : 'release'}
	Plug 'dylanaraps/wal.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'mattn/emmet-vim'
  Plug 'cseelus/vim-colors-lucid'

	" Initialize plugin system
	call plug#end()

	set showcmd
	set smartcase
	set autoindent
	set smartindent
	set expandtab tabstop=2 shiftwidth=2 smarttab softtabstop=2
  syntax on
	set noswapfile
	set nobackup
	set undodir=~/.vim/undodir
	set undofile
	set autoread
	set ignorecase
	set incsearch
	set noshowmode
	set nowrap
  set list lcs=eol:¬,tab:\ \ 

	if (has("nvim"))
	  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	 "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif

	"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
		set termguicolors
	endif

	" Go to last file(s) if invoked without arguments.

	" Colors & styles
	"let g:material_theme_style = 'ocean'
	"let g:material_terminal_italics = 1

	"colorscheme settings
  colorscheme lucid
	
	"Setting the line HighLighting
	hi clear CursorLine
	augroup CLClear
	    autocmd! ColorScheme * hi clear CursorLine
	augroup END

	"hi CursorLineNR cterm=bold ctermbg=15 ctermfg=8 gui=NONE guibg=#000000 guifg=#ff8000
	"augroup CLNRSet
	    "autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermbg=15 ctermfg=8 gui=NONE guibg=#00000 guifg=#ff8000
	"augroup END

	"set cursorline

	"Lightline
	set laststatus=2

	"Keybindings
	map <C-L> :<Esc>:tabnext<CR>
	map <C-H> :<Esc>:tabp<CR>
	map <C-p> :<Esc>:Files<CR>
	map <C-b> :<Esc>:Buffers<CR>

	" Nerdtree
	autocmd StdinReadPre * let s:std_in=1

	autocmd! BufNewFile,BufRead *.shader,*.hlsl set ft=hlsl
	"let g:NERDTreeDirArrowExpandable = ''
	let g:NERDTreeDirArrowCollapsible = ''

	set nu relativenumber

	"The coc of vim 
	" TextEdit might fail if hidden is not set.
	set hidden

	" Some servers have issues with backup files, see #649.
	set nobackup
	set nowritebackup

	" Give more space for displaying messages.
	set cmdheight=2

	" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	" delays and poor user experience.
	set updatetime=200

	" Don't pass messages to |ins-completion-menu|.
	set shortmess+=c

	" Always show the signcolumn, otherwise it would shift the text each time
	" diagnostics appear/become resolved.
	set signcolumn=yes

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" <tab> to confirm the selection
	if exists('*complete_info')
	  inoremap <silent> <expr> <TAB> pumvisible() ? complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>" : "\<TAB>"
	endif

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
	    execute 'h '.expand('<cword>')
	  else
	    call CocAction('doHover')
	  endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s).
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder.
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Remap keys for applying codeAction to the current line.
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Introduce function text object
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)
	
	" <C-j> and <C-k> to scroll throught the selection
	inoremap <silent><expr> <C-j>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<C-j>" :
	      \ coc#refresh()
	inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add (Neo)Vim's native statusline support.
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline.
  function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
  endfunction

  let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

	" Mappings using CoCList:
	" Show all diagnostics.
	nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions.
	nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands.
	nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document.
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols.
	nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list.
	nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
  hi CocFloating ctermbg=0 

else
endif
