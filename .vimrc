"===========================================
" General
"===========================================
" Let VIM not compatible with VI
set nocompatible

" How many lines of history VIM has to remember, default is 20
set history=100

" Set to auto read when a file is changed from the outside
" set autoread

" Map <leader> to ','
let mapleader=','

" Map jj to <ESC> in insert mode
imap jj <esc>

" Fast saving
nmap <silent> ;w :w<CR>

"===========================================
" VIM user interface
"===========================================
" Set 7 lines to the cursor when moving vertically using j/k
set so=7

" Tune on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position on right-bottom
set ruler

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=b,s,<,>,[,] " ,h,l

" search {
set ignorecase  " Ignore case when searching
set smartcase   " When searching try to be smart about cases
set hlsearch    " Hightlight search results
set incsearch   " Makes search act like search in modern browsers
" }

" Don't redraw while executing macros, registers and other cmds
" that have not been typed.
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Status line {     <== vim-powerline instead
set laststatus=2
" set ruler
" set statusline=[%F]%y%r%m%*%=
" set statusline+=[%{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}]
" Encoding
" set statusline+=%{SyntasticStatuslineFlag()}[%{&fenc!=''?&fenc:&fenc}]
" set statusline+=[0x%B/%03b]
" Current date time, update when cursor move
" set statusline+=[%{strftime(\"%d-%m-%Y\ %H:%M\")}]
" Current working directory
" set statusline+=[%r%{getcwd()}%h]
" set statusline+=[Line:%l/%L,Column:%c][%p%%]
" set statusline+=[L:%l/%L,Col:%c][%p%%]
" }

"===========================================
" Colors and Fonts
"===========================================
" Enable syntax hightlighting
" syntax enable <== Bundle

" Sets color scheme
colo desert
set colorcolumn=81
set t_Co=256
set cursorline

if has("gui_gtk2")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 11,Fixed\ 11
    set guifontwide=Microsoft\ Yahei\ 11,WenQuanYi\ Zen\ Hei\ 11
endif

" Encoding settings {
set fileencodings=utf-8,gb18030,gbk,big5,latin1
set termencoding=utf-8,gbk
set encoding=utf-8
" }

"===========================================
" Text, tab and indent related
"===========================================
" tab settings {
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType makefile,html,python set noexpandtab
autocmd FileType ruby set ts=2 | set sw=2 | set sts=2
" }

" Line break on xx characters
" set linebreak
" set textwidth=80

" indent settings {
set autoindent
set smartindent
set cindent
" set wrap
" }

" Folding settings {
set foldmethod=syntax
set foldlevel=90
" }

" line number settings {
set nu
set nuw=5
set isk+=-
" }

"===========================================
" Moving around, tabs, windows and buffers
"===========================================
map j gj
map k gk

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab page {
" useful mappings for managing tabs
" {count}gt		goto tab page {count}
map <leader>tn :tabnew<cr>
map <leader>tnn :tabnew<space>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<space>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" goto previous tab
map <leader>tp :tabp<space>
" goto next tab
map <leader>tg :tabn<space>
"}

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

"===========================================
" Editing mappings
"===========================================
" Move a line of text using ALT+[jk]
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" ctags settings {
set tags=tags;
set tags+=~/.vim/tags/cpp.tags
set tags+=~/.vim/tags/c.tags
" }

source ~/.vim/bundle.vim

filetype plugin indent on " required!
syntax on

" Return to last edit position when opening files
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	exe "normal! g`\"" |
			\ endif
" Remember info about open buffers on close
set viminfo^=%

" When .vimrc is modified, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"===============================
" Custom
"===============================
" Google protobuf
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" Delete trailing white space on save
func! DeleteTrailingWS()
	let cur_line = line('.')
	let cur_col = col('.')
	silent! %s/\s\+$//ge
	call cursor(cur_line, cur_col)
endfunc
nmap <silent> ;m :call DeleteTrailingWS()<CR>
autocmd BufWrite *.py :call DeleteTrailingWS()

" Replace the selected text in visual mode
vnoremap <leader>s y:%s/<C-R>=escape(@", '\\/.*$^~[]')<CR>/

" 查词典
nmap <leader>f :!sdcv -n <C-R>=expand("<cword>")<CR>\|less<CR>
" presentations of '|' character: <Bar>, \|, ^V|

function! ToggleSyntax()
	if exists("g:syntax_on")
		syntax off
	else
		syntax enable
	endif
endfunction
" nmap: normal-mode key mapping
nmap <silent> <leader>S :call ToggleSyntax()<CR>

imap <silent> <C-D><C-D> <C-R>=strftime("%b%e %Y")<CR>
imap <silent> <C-T><C-T> <C-R>=strftime("%l:%M%p")<CR>
imap <silent> <C-C><C-C> <C-R>=string(eval(input("Calculate: ")))<CR>

highlight ColorColumn ctermbg=235 guibg=lightgrey

"===================================
"=            VIM TIPS             =
"===================================
"S      ; Replace whole line
"
"dos2unix dos_file unix_file
"doscp dos_file unix_file
"       ; remove ^M
"
"gq}    ; Format paragraph
"ggVGgq ; Reformaat entire file

"[I     ; shwo lines matching work under cursor
"g/xxx/#    ; search and display with line numbers
":g/<pattern>/z#.5|echo "=========="  : display beautifully
