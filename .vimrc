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
" let mapleader=','

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
autocmd FileType makefile set noexpandtab
autocmd FileType html set noexpandtab
autocmd FileType python set noexpandtab
autocmd FileType ruby set ts=2
autocmd FileType ruby set sw=2
autocmd FileType ruby set sts=2
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

" Return to last edit position when opening files
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	exe "normal! g`\"" |
			\ endif
" Remember info about open buffers on close
set viminfo^=%

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
"set tags+=~/.vim/tags/wx3.tags
"set tags+=~/.vim/tags/gl.tags
" }

" When .vimrc is modified, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Delete trailing white space on save
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
" nmap ;m :call DeleteTrailingWS()<CR>
autocmd BufWrite *.py :call DeleteTrailingWS()

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

"===========================================
" Bundle
"===========================================
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused
" bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"Vundle setting {
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"--------------------------------------------------
" General
"--------------------------------------------------
" vim zh-cn help
Bundle "vimcdoc"
set helplang=cn

" File search Ctrl+p
Bundle 'ctrlp.vim'
noremap <C-w><C-u> :CtrlPMRU<CR>
noremap <C-w>u :CtrlMRU<CR>
let g:ctrlp_custom_ignore         = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode     = 0
let g:ctrlp_match_window_bottom   = 1
let g:ctrlp_max_height            = 15
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_mruf_max              = 500
let g:ctrlp_follow_symlinks       = 1

" 以全新的方式在文档中更高效地移动光标
" <Leader>w/b/j/k
Bundle 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader>'

" 显示行末的空格
" ;m
Bundle 'ShowTrailingWhitespace'

" 让代码更加易于纵向排版，以=或,符号对齐
" :Tab /=    or :Tab /, ...
Bundle 'Tabular'

" \ec 开始拼写检查
" \ee 结束拼写检查
" \ea 选择替换拼写
" \en[p] move to next[previous] spell error
" \
" Bundle 'Engspchk'

"--------------------------------------------------
" Programming
"--------------------------------------------------
" 自动补全插件
Bundle 'OmniCppComplete'
set completeopt+=longest,menu,menuone
let OmniCpp_MayCompleteScope         = 1
let OmniCpp_SelectFirstItem          = 2
let OmniCpp_NamespaceSearch          = 2
let OmniCpp_ShowPrototypeInAbbr      = 1
let OmniCpp_DisplayMode              = 1
let OmniCpp_ShowScopeInAbbr          = 0
let OmniCpp_ShowAccess               = 1
let OmniCpp_DefaultNamespace = ["std","_GLIBCXX_STD"]
" map <C-F12> :!ctags -R --c-kinds   = +p --c++-kinds         = +p
"	\--fields                        = +iaSKz --extra         = +q .<CR>
" map <C-F12>	:!ctagsx<cR>

Bundle 'AutoComplPop'
let g:acp_completeoptPreview=1
" 自动关闭预览窗口
" Close automatically the preview window after a completion.
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" " 回车即寻中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

Bundle 'L9'

Bundle 'davidhalter/jedi-vim'
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command    = "K"
let g:jedi#usages_command           = "<leader>n"
let g:jedi#completions_command      = "<C-Space>"
let g:jedi#rename_command           = "<leader>r"
let g:jedi#show_call_signatures     = "1"
let g:jedi#popup_on_dot             = 0
let g:jedi#popup_select_first       = 0

" Syntax Check for python
Bundle 'orenhe/pylint.vim'

Bundle 'SWIG-syntax'
au BufNewFile,BufRead *.i	set filetype=swig
au BufNewFile,BufRead *.swg	set filetype=swig

" Syntax check
Bundle 'Syntastic'
let g:syntastic_ignore_files = [".*\.py$"]
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" 简单配置就可以按照自己的风格快速输入大段代码
" Bundle 'UltiSnips'
" Bundle 'snipMate'
Bundle 'drmingdrmer/xptemplate'
let g:xptemplate_vars = "BRfun= "

" Bundle 'cmaureir/snipmate-snippets-cuda'
au BufNewFile,BufRead *.cu set ft=cu

Bundle 'vim-scripts/slimv.vim'
let g:slimv_python = 'python2'
let g:slimv_impl = 'sbcl'
if has("unix")
    let g:slimv_swank_cmd = "! xterm -e sbcl --load ~/.vim/bundle/slimv.vim/slime/start-swank.lisp &"
    let g:slimv_clhs_root = "file:///usr/local/lib/LispWorksPersonal/lib/6-1-0-0/manual/online/CLHS/Body/"
elseif has("win32") || has("win16")
    let g:slimv_swank_cmd = '!start "D:\Program Files (x86)\Steel Bank Common Lisp\1.2.1\sbcl.exe"
                \ --load "D:\\lispbox-1.0\\slime-2014\\start-swank.lisp"'
endif

" JS代码格式化插件
" <leader>ff
Bundle 'vim-scripts/jsbeautify'
autocmd FileType javascript noremap <buffer>  <c-f> :call Jsbeautify()<cr>

Bundle 'othree/xml.vim'

" cs"'  ; Chang Surrounding from " to '
" cst"  ; Chang Surround To "
" ds"   ; Delete Surround "
" ysiw] ; iw: current word   ] nospace [ w/ space
" yssb  ; entire line
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" <C-Y>,
" <C-Y>/    comment
" E             代表HTML标签。
" E#id          代表id属性。
" E.class       代表class属性。
" E[attr=foo]   代表某一个特定属性。
" E{foo}        代表标签包含的内容是foo。
" E>N           代表N是E的子元素。
" E+N           代表N是E的同级元素。
" E^N           代表N是E的上级元素。
" E*N           代表元素E重写N次
" E$*N          代表字符串E自动编号至N, $的个数表示编号位数
Bundle 'mattn/emmet-vim'

" :PandocHtml
" :PandocHtmlOpen
Bundle 'vim-pandoc/vim-pandoc'
let g:snips_author = "Chen Junshi"
let maplocalleader = ","

" Dox DoxLic DoxAuthor DoxUndoc DoxBlock
Bundle 'DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName = "Chen Junshi"
let g:DoxygenToolkit_licenseTag = "Copyright (C) \<enter>\<enter>".
			\"2013 - Chen Junshi\<enter>".
			\"This program belongs to ACSA of USTC."
let g:DoxygenToolkit_briefTag_pre = ""

" Bundle 'Doxygen-Syntax.vim'
let g:load_doxygen_syntax      = 1
" let g:doxygen_enhanced_color = 1
let doxygen_my_rendering       = 1
let doxygenErrorComment        = 1
let doxygenLinkError           = 1
let python_highlight_all       = 1

Bundle 'wesleyche/SrcExpl'
nmap <silent> sp :SrcExplToggle<CR>
let g:SrcExpl_winHeight   = 8
let g:SrcExpl_refreshTime = 200
let g:SrcExpl_jumpKey     = "<ENTER>"
let g:SrcExpl_gobackKey   = "<SPACE>"
let g:SrcExpl_pluginList  = [
	\"__Tagbar__",
 	\"_NERD_tree_1",
 	\"Source-Explorer"
\]
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd  = "ctagsx . 2>/dev/null"
let g:SrcExpl_updateTagsKey  = "<F12>"
let g:SrcExpl_prevDefKey     = "<F3>"
let g:SrcExpl_nextDefKey     = "<F4>"

" 在vim的编辑窗口树状显示文件目录
" :NERDTree
" :h NERDTree
Bundle 'The-NERD-tree'
let g:NERDTreeQuitOnOpen = 1
nmap wm :NERDTree<CR>

" NERD出品的快速给代码加注释的插件，选中，‘ctrl+h‘即可注释多种语言代码
" n\cu  为光标以下n行取消注释
" n\cm  为光标以下n行添加块注释
" :h NERDCommenter
Bundle 'The-NERD-Commenter'
let NERDSpaceDelims = 1

" fancier than taglist
Bundle 'Tagbar'
let g:tagbar_autoclose	= 1
let g:tagbar_compact	= 1
map <silent> tl :TagbarToggle<CR>

Bundle 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

" Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'

" 快速浏览和操作buffer
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplMapWindowNavVim    = 1	"可以用<C-­h,j,k,l>切换到上下左右的窗口中
let g:miniBufExplMapWindowNavArrows = 1	"可以用<C­箭头键>切换到上下左右窗口中去

Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-m>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" }

filetype plugin indent on " required!
syntax on

"===============================
" Custom
"===============================
" Replace the selected text in visual mode
vnoremap <leader>s y:%s/<C-R>=escape(@", '\\/.*$^~[]')<CR>/

"--------------------------------------------------
function! RemoveSpaceEndOfLine()
	let cur_line = line('.')
	let cur_col = col('.')
	silent! %s/\s\+$//g
	call cursor(cur_line, cur_col)
endfunction
nmap <silent> ;m :call RemoveSpaceEndOfLine()<CR>

" 查词典
nmap F :!sdcv -n <C-R>=expand("<cword>")<CR>\|less<CR>
" presentations of '|' character: <Bar>, \|, ^V|

function! ToggleSyntax()
	if exists("g:syntax_on")
		syntax off
	else
		syntax enable
	endif
endfunction
" nmap: normal-mode key mapping
nmap <silent> ;s :call ToggleSyntax()<CR>

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
