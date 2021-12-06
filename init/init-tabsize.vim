"======================================================================
"
" init-tabsize.vim - 大部分人对 tabsize 都有自己的设置，改这里即可
"
" Created by vinx 2021.12.04
" Last Modified: 2021.12.04 19:10:25
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------

" 键入 <Tab> 时展开为空格
set expandtab

" <Tab> 在文件里使用的空格数
set tabstop=4

" (自动) 缩进使用的步进单位，以空白数目计
set shiftwidth=4

" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4

augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	"au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END


