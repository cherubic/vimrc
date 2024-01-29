"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic - @amix3k
"       Xander - @cherubic
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" 分段：
"    -> 常规设置
"    -> VIM 用户界面
"    -> 配色和字体
"    -> 文件和备份
"    -> 文本、制表符和缩进相关
"    -> 可视模式相关
"    -> 移动、标签和缓冲区
"    -> 状态栏
"    -> 编辑映射
"    -> vimgrep 搜索和 cope 显示
"    -> 拼写检查
"    -> 杂项
"    -> 辅助函数
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 常规设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 VIM 记住的历史行数
set history=1024

" 启用文件类型插件
filetype plugin on
filetype indent on

" 当文件从外部更改时自动读取
set autoread
au FocusGained,BufEnter * silent! checktime

" 使用映射前缀可以执行额外的键组合，例如 <leader>w 保存当前文件
let mapleader = ","

" 快速保存
nmap <leader>w :w!<cr>

" :W 以超级用户权限保存文件
" （处理权限被拒绝错误很有用）
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM 用户界面
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置游标向上或向下移动时显示的行数
set so=7

" 避免中文语言 Windows 操作系统中的乱码
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 启用 Wild 菜单
set wildmenu

" 忽略已编译的文件
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" 始终显示当前位置
set ruler

" 命令栏的高度
set cmdheight=1

" 当缓冲区被放弃时隐藏它
set hid

" 配置退格键的行为
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 搜索时忽略大小写
set ignorecase

" 智能匹配大小写
set smartcase

" 高亮搜索结果
set hlsearch

" 在现代浏览器中搜索时表现得像搜索一样
set incsearch

" 执行宏时不重绘（性能优化配置）
set lazyredraw

" 在正则表达式中打开 Magic
set magic

" 在文本指示器位于匹配括号上方时显示匹配括号
set showmatch

" 当文本指示器位于括号上方时闪烁匹配括号
set mat=2

" 错误时不发出嘟嘟声
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" 在 MacVim 上正确禁用错误时的声音
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" 在左侧添加一点额外的边距
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 配色和字体
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启用语法高亮
syntax enable

" 自动设置正则表达式引擎
set regexpengine=0

" 在 Gnome 终端中启用 256 色调色板
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
" 主题 dracula
    colorscheme dracula
catch
endtry

set background=dark

" 在 GUI 模式下设置额外选项
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" 将 utf8 设置为标准编码，并将 en_US 设置为标准语言
set encoding=utf8

" 使用 Unix 作为标准文件类型
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件、备份和撤销
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭备份，因为大多数东西都在 SVN、git 等中...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文本、制表符和缩进相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用空格代替制表符
set expandtab

" 智能制表符
set smarttab

" 1 制表符等于 4 个空格
set shiftwidth=4
set tabstop=4

" 换行长度为 500 字符
set lbr
set tw=500

set ai " 自动缩进
set si " 智能缩进
set wrap " 自动换行




""""""""""""""""""""""""""""""
" => 可视模式相关
""""""""""""""""""""""""""""""
" 可视模式按 * 或 # 搜索当前选择
" 非常有用！来自 Michael Naumann 的想法
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 移动、标签、窗口和缓冲区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将 <Space> 映射到 /（搜索），Ctrl-<Space> 映射到 ?（反向搜索）
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" 按下 <leader><cr> 时不高亮
map <silent> <leader><cr> :noh<cr>

" 智能移动窗口
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 关闭当前缓冲区
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" 关闭所有缓冲区
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" 管理标签页的有用快捷键
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" 让 'tl' 在当前和上一次访问的标签页之间切换
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" 使用当前缓冲区的路径快速打开一个新标签页
" 编辑相同目录中的文件时非常有用
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" 将 CWD 切换到打开缓冲区的目录
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" 切换缓冲区时指定行为
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" 打开文件时返回到最后编辑的位置（很有用！）
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => 状态栏
""""""""""""""""""""""""""""""
" 始终显示状态栏
set laststatus=2

" 设置状态栏格式
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编辑映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将 VIM 0 映射到第一个非空字符
map 0 ^

" 使用 ALT+[jk] 或 Command+[jk] 在行之间移动文本
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" 保存时删除尾随空格，对某些文件类型非常有用；）
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 拼写检查
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按下 ,ss 切换拼写检查
map <leader>ss :setlocal spell!<cr>

" 使用 <leader> 进行快捷键
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 杂项
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 移除 Windows 下的 ^M - 当编码混乱时
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" 快速打开一个用于草稿的缓冲区
map <leader>q :e ~/buffer<cr>

" 快速打开一个用于 Markdown 的草稿缓冲区
map <leader>x :e ~/buffer.md<cr>

" 切换粘贴模式的开启和关闭
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 辅助函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 如果启用了粘贴模式，则返回 true
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" 删除缓冲区时不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
