"======================================================================
"
" init-basic.vim - 基础配置，该配置需要兼容 vim tiny 模式
"
" 所有人都能接受的配置，不掺渣任何 keymap, 和偏好设置
"
" Created by Vinx on 2021.12.04
" Last Modified: 2021.12.04 13:16:55
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 到达顶部/底部禁止闪屏
set t_vb=

" 使用中文帮助文档
set helplang=cn,en

" 如果未设置隐藏，TextEdit 可能会失败。
set hidden

" 关闭备份功能
set nobackup
set nowritebackup

" 较长的更新时间（默认为 4000 ms = 4 s）会导致明显的延迟和糟糕的用户体验
set updatetime=100

" 不要将消息传递给 |ins-completion-menu|.
set shortmess+=c

" 禁用 vi 兼容模式
set nocompatible

" 设置 Backspace 键模式
set bs=eol,start,indent

" 显示行号
set number

" 显示相对行号
set relativenumber

" 显示光标位置
set ruler

" 突出显示当前行
set cursorline
highlight CursorLine   cterm=NONE ctermbg=gray ctermfg=NONE guibg=gray guifg=NONE

"设置鼠标可用
set mouse=a

" 自动换行
set wrap

" 使用 C 风格的缩进
set cindent

" 自动缩进（继承上一行的缩进方式）
set autoindent

" 为 C 程序提供自动缩进
set smartindent

" 高亮指定列
" set colorcolumn=100

" 插入模式补全使用的选项
set completeopt=longest,noinsert,menuone,noselect,preview


"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 折叠的类型
	set foldmethod=indent

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99
endif

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 高亮搜索时的匹配项
set hlsearch

" 搜索时逐字符匹配
set incsearch

" 搜索模式时忽略大小写
set ignorecase

" 模式中有大写字母时不忽略大小写
set smartcase


"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
	filetype plugin indent on
endif


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')
	syntax enable
	syntax on
endif


"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

" 高亮显示对应的括号
set showmatch

" 对应括号的高亮时间（单位 0/10 秒）
set matchtime=4

" 显示最后一行
set display=lastline

" 执行宏时不重画
set lazyredraw "same as above

" 显示 <Tab> 和 <EOL>
set list

" list 模式下显示用的字符
set listchars=tab:\|\ ,trail:▫

" 光标上下滚动的最少行数
set scrolloff=4

" 在状态行里显示 (部分) 命令
set showcmd

" 不在状态行上显示当前模式的消息
set noshowmode

" 分割窗口时新窗口在当前窗口之右
set splitright

" 分割窗口时新窗口在当前窗口之下
set splitbelow

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
"set ttimeout

" 键盘代码超时时间 (以毫秒计)
"set ttimeoutlen=50

" 使用可视铃声而不是响铃
set visualbell

if has('persistent_undo')
    " 把撤销信息写入一个文件里
	set undofile

    " 保存撤销文件的位置
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif

" 刷新交换文件所需的毫秒数
set updatetime=100

" 允许可视列块模式的虚拟编辑
set virtualedit=block

" 命令行自动补全所使用的菜单
set wildmenu

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no


"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

