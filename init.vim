" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let g:vim_init_home = fnamemodify(resolve(expand('<sfile>:p')), ':h') . "/"

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.g:vim_init_home.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.g:vim_init_home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim

" 检测函数（检测光标位置处文字的样式名）
function! <SID>SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc

" 绑定检测键位（按键后样式名信息会输出在指令栏的位置）
nnoremap <F3> :call <SID>SynStack()<CR>
"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
LoadScript init/init-basic.vim

" 加载扩展配置
LoadScript init/init-config.vim

" 设定 tabsize
LoadScript init/init-tabsize.vim

" 插件加载
LoadScript init/init-plugins.vim

" 界面样式
LoadScript init/init-style.vim

" 自定义按键
LoadScript init/init-keymaps.vim
