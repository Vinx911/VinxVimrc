"======================================================================
"
" init-plugins.vim - 
"
" Created by vinx on 2021.12.04
" Last Modified: 2021.12.04 18:17:03
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :



"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:plugin_group')
	let g:plugin_group = ['basic',  'airline', 'vim-peekaboo', 'coc', 'vimspector', 'enhanced', 'filetypes', 'textobj']
	let g:plugin_group += ['tags', 'nerdtree', 'ale', 'echodoc']
	let g:plugin_group += ['leaderf', 'YouCompleteMe', 'vimcdoc', 'neomake']
endif


"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'plugin_home', '~/.vim/plugins'))

"----------------------------------------------------------------------
" basic
"----------------------------------------------------------------------
if index(g:plugin_group, 'basic') >= 0

	" 启动屏幕
	Plug 'mhinz/vim-startify'
	let g:startify_custom_header = 'startify#pad(split(system("figlet -w 100 VINX VIM"), "\n"))'
	
    " 状态栏滚动条
    Plug 'ojroques/vim-scrollstatus'

	" 成对插入或删除括号、括号、引号。
    Plug 'jiangmiao/auto-pairs'

endif


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:plugin_group, 'airline') >= 0
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_powerline_fonts = 0
	let g:airline_exclude_preview = 1
	let g:airline_section_b = '%n'
	let g:airline_theme='deus'
	let g:airline#extensions#branch#enabled = 0
	let g:airline#extensions#syntastic#enabled = 0
	let g:airline#extensions#fugitiveline#enabled = 0
	let g:airline#extensions#csv#enabled = 0
	let g:airline#extensions#vimagit#enabled = 0
    let g:airline_section_x = '%{ScrollStatus()}'
    let g:airline_section_y = airline#section#create_right(['filetype'])
    let g:airline_section_z = airline#section#create([
            \ '%#__accent_bold#%3l%#__restore__#/%L', ' ',
            \ '%#__accent_bold#%3v%#__restore__#/%3{virtcol("$") - 1}',
            \ ])
endif



"----------------------------------------------------------------------
" 插件启动时间记录
"----------------------------------------------------------------------
"Plug 'tweekmonster/startuptime.vim'


"----------------------------------------------------------------------
" Peekaboo在正常模式下扩展"和@，插入模式扩展<CTRL-R> ,使得你可以看到寄存器的内容。
"----------------------------------------------------------------------
if index(g:plugin_group, 'vim-peekaboo') >= 0
    Plug 'junegunn/vim-peekaboo'
endif

if index(g:plugin_group, 'coc') >= 0
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    let g:coc_config_home = g:vim_init_home.'config/coc'

    let g:coc_global_extensions = [
        \ 'coc-vimlsp',
		\ 'coc-tsserver',
		\ 'coc-clangd',
		\ 'coc-cmake',
		\ 'coc-css',
		\ 'coc-go',
		\ 'coc-golines',
		\ 'coc-html',
		\ 'coc-json',
		\ 'coc-pyright',
		\ 'coc-python',
		\ 'coc-prettier',
		\ 'coc-rust-analyzer',
		\ 'coc-stylelint',
		\ 'coc-toml',
		\ 'coc-xml',
		\ 'coc-yaml',
        \ 'coc-diagnostic',
        \ 'coc-explorer',
        \ 'coc-gitignore',
        \ 'coc-highlight',
        \ 'coc-lists',
        \ 'coc-snippets',
		\ 'coc-tasks',
        \ 'coc-translator',
        \ 'coc-yank',
        \]

    " 高亮光标出符号及其引用。
    autocmd CursorHold * silent call CocActionAsync('highlight')

    
endif

if index(g:plugin_group, 'vimspector') >= 0
    Plug 'puremourning/vimspector'

    let g:vimspector_enable_mappings = 'HUMAN'
    let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'local-lua-debugger-vscode' ]

endif

Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'

" rust 语法增强
"Plug 'sheerun/vim-polyglot'
"Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" 必须最后一个加载
" 字体图标支持
Plug 'ryanoasis/vim-devicons'

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()


