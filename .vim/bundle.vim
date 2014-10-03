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

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

"--------------------------------------------------
" General
"--------------------------------------------------
" vim zh-cn help
" Bundle \"vimcdoc"
" set helplang=cn

" File search Ctrl+p
Bundle 'kien/ctrlp.vim'
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
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = ','

" 显示行末的空格
" ;m
" Bundle 'ShowTrailingWhitespace'
Bundle 'ntpeters/vim-better-whitespace'
" let g:better_whitespace_filetypes_blacklist=['<filetype1>', '<etc>']
nmap <silent> ;m :StripWhitespace<CR>

" 让代码更加易于纵向排版，以=或,符号对齐
" :Tab /=    or :Tab /, ...
Bundle 'godlygeek/tabular'

" \ec 开始拼写检查
" \ee 结束拼写检查
" \ea 选择替换拼写
" \en[p] move to next[previous] spell error
" \
" Bundle 'Engspchk'

Bundle 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

" Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'

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
Bundle 'L9'
let g:acp_completeoptPreview=1
" 自动关闭预览窗口
" Close automatically the preview window after a completion.
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" " 回车即寻中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" 在vim的编辑窗口树状显示文件目录
" :NERDTree
" :h NERDTree
" Bundle 'The-NERD-tree'
Bundle 'scrooloose/nerdtree'
let g:NERDTreeQuitOnOpen = 1
nmap wm :NERDTree<CR>

" NERD出品的快速给代码加注释的插件，选中，‘ctrl+h‘即可注释多种语言代码
" n\cu  为光标以下n行取消注释
" n\cm  为光标以下n行添加块注释
" :h NERDCommenter
" Bundle 'The-NERD-Commenter'
Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1

" fancier than taglist
Bundle 'Tagbar'
let g:tagbar_autoclose	= 1
let g:tagbar_compact	= 1
map <silent> tl :TagbarToggle<CR>

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

" Autocompletion library for python
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
Bundle 'waldonchen/xptemplate'
let g:xptemplate_vars = "$author='CHEN Junshi'&$email=waldonchen@gmail.com"

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

" cs"'  ; Change surrounding from " to '
" cst"  ; Change surrounding To "
" ds"   ; Delete surrounding "
" ysiw] ; iw: current word   ] nospace [ w/ space
" yssb  ; entire line
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

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
" let g:load_doxygen_syntax      = 1
" let g:doxygen_enhanced_color = 1
" let doxygen_my_rendering       = 1
" let doxygenErrorComment        = 1
" let doxygenLinkError           = 1
" let python_highlight_all       = 1

Bundle 'mattn/calendar-vim'
let g:calendar_mark = 'right'
let g:calendar_focus_today = 1

" :Matrix
Bundle 'waldonchen/matrix.vim'

Bundle 'tpope/vim-fugitive'

" 快速浏览和操作buffer
" Bundle 'fholgado/minibufexpl.vim'
" let g:miniBufExplMapCTabSwitchBufs  = 1
" let g:miniBufExplMapWindowNavVim    = 1	"可以用<C-­h,j,k,l>切换到上下左右的窗口中
" let g:miniBufExplMapWindowNavArrows = 1	"可以用<C­箭头键>切换到上下左右窗口中去

"Bundle 'terryma/vim-multiple-cursors'
"let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-m>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

" }
