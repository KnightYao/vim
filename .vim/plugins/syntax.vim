"===============================
" 语法高亮插件
"===============================

"-----------------------------------------
" Vala语法高亮
"-----------------------------------------
Plugin 'waldonchen/vala.vim'

"-----------------------------------------
" SWIG语法高亮
"-----------------------------------------
Plugin 'SWIG-syntax'
au BufNewFile,BufRead *.i	set filetype=swig
au BufNewFile,BufRead *.swg	set filetype=swig

"-----------------------------------------
" CUDA语法高亮
"-----------------------------------------
" Plugin 'cmaureir/snipmate-snippets-cuda'
au BufNewFile,BufRead *.cu set ft=cu
