"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requires that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI 相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 根据操作系统设置字体
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
" 禁用滚动条（真正的黑客不使用滚动条进行导航！）
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
" 颜色主题
set background=dark
colorscheme dracula


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 快速编辑和重新加载 vimrc 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 开启持久化撤销
"    这意味着即使关闭缓冲区/VIM，您也可以撤销
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 命令模式相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
" 命令行上的智能映射
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
" $q 在命令行上浏览时非常有用
" 它删除最后一个斜杠之前的所有内容
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
" 命令行的 Bash 键
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
" 将 ½ 映射到有用的东西
map ½ $
cmap ½ $
imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 括号/方括号
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
" 映射自动完成（，“，'，[
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 常规缩写
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni 补全函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack 搜索和 cope 显示
"    需要 ack.vim - 它比 vimgrep/grep 更好
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
" 如果可能，请使用 the_silver_searcher（比 Ack 快得多）
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
" 按 gv 键后，您会在所选文本后进行 Ack
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
" 打开 Ack 并将光标放在正确的位置
map <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
" 按 <leader>r 键后，您可以搜索并替换所选文本
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" 如果您不确定 cope 是什么，请执行 :help cope。它非常有用！
"
" 当您使用 Ack 进行搜索时，请通过以下方式在 cope 中显示结果：
"   <leader>cc
"
" 要转到下一个搜索结果，请执行：
"   <leader>n
"
" 要转到上一个搜索结果，请执行：
"   <leader>p


map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Make sure that enter is never overriden in the quickfix window
" 确保在快速修复窗口中永远不会覆盖 enter 键
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 辅助函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . escape(expand("%:p:h"), " ") . "/"
endfunc

"=================================================================================
"
"   以下文件包含有关如何运行当前打开的代码的命令。
"   默认映射设置为 F5，就像大多数代码编辑器一样。
"   根据您感觉舒适的方式进行更改，但请注意，它不会与任何其他键映射冲突。
"
"   注意：不同系统的编译器可能不同。例如，在 C 和 C++ 的情况下，我们假设它们分别是 gcc 和 g++，但可能不是相同的。建议在运行代码之前先检查编译器是否已安装，或者甚至切换到其他编译器。
"
"   注意：添加更多编程语言的支持
"
"   仅需在每个情况的 'endif' 语句之前添加另一个 elseif 块，方式与每个情况中所做的方式相同。在每个 elseif 块之后添加 tab 键缩进（类似于 Python）。例如：
"
"   elseif &filetype == '<your_file_extension>'
"       exec '!<your_compiler> %'
"
"   注意：'%' 符号表示当前打开文件的名称和扩展名。
"         time 命令显示执行所用时间。如果不希望系统显示时间，请删除 time 命令。
"
"=================================================================================

map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!google-chrome % &"
elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
elseif &filetype == 'matlab'
    exec "!time octave %"
endif
endfunc
