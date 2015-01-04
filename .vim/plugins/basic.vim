"===============================
" 基础插件
"===============================

"-----------------------------------------
" 在文档中更高效地移动光标
"
" <leader>w/b/j/k
"-----------------------------------------
Plugin 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
" 设置自己的Leader键
" let g:EasyMotion_leader_key = ';'
"-----------------------------------------
" 显示行末的空格
"
" ;m    删除文件中的行尾空格
"-----------------------------------------
Plugin 'ShowTrailingWhitespace'

"-----------------------------------------
" 显示文件中的缩进
"-----------------------------------------
Plugin 'Yggdroot/indentLine'

"-----------------------------------------
" Powerline风格的状态栏
"-----------------------------------------
let laststatus=2
Plugin 'Lokaltog/vim-powerline'
let g:Powerline_stl_path_style = 'short'
