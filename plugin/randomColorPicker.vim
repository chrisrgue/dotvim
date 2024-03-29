" This program is free software. It comes without any warranty, to
" the extent permitted by applicable law. You can redistribute it
" and/or modify it under the terms of the Do What The Fuck You Want
" To Public License, Version 2, as published by Sam Hocevar. See
" http://sam.zoy.org/wtfpl/COPYING for more details. */
"
" ==ABOUT==
" Power VIM Users like us have already wasted tons of time to choose
" our favorite colorschemes, and may still not be satisfied with the
" current colorschemes. So I wrote this plugin to help us out, to
" meet the perfect colorsheme that we are `DESTINED` to be with.
" just like your lovely girlfriends/wifes:)
" Written by sunus Lee  sunus.the.dev@gmail.com


let g:plugin_path=$HOME.'/.vim/plugin/'
let g:love_path=g:plugin_path.'.love'
let g:hate_path=g:plugin_path.'.hate'
let g:colorscheme_file_path=''
let g:colorscheme_file=''

function! Picker()
    let r=findfile(g:love_path)
    if r != ''
        let loves=readfile(g:love_path)
        if len(loves) > 0
            let g:colorscheme_file=loves[0]
            call ApplyCS()
            return
        endif
    endif
    let colorscheme_dirs=[$VIMRUNTIME.'/colors', '~/.vim/colors']
    let arr=[]
    for colorsheme_dir in colorscheme_dirs
        let colorschemes=glob(colorsheme_dir.'/*.vim')
        let arr+=split(colorschemes)
    endfor
    let hates=[]
    let r=findfile(g:hate_path)
    if r != ''
        let hates=readfile(g:hate_path)
    endif
    while 1
        let rand=system("echo $RANDOM")
        let rand=rand%len(arr)
        let g:colorscheme_file_path=arr[rand]
        if index(hates, g:colorscheme_file_path) == -1
            break
        endif
    endwhile
    " colorscheme is /path/to/colorscheme_file.vim
    " convert to colorscheme_file
    let g:colorscheme_file=split(g:colorscheme_file_path, '/')[-1][:-5]
    call ApplyCS()
endfunction

function! ApplyCS()
    let cmd='colorscheme '.g:colorscheme_file
    "echo "CG>> ".cmd
    execute cmd
endfunction

function! LoveCS()
    execute writefile([g:colorscheme_file], g:love_path)
endfunction

function! HateCS()
    call delete(g:love_path)
    let hates=readfile(g:hate_path)
    call add(hates, g:colorscheme_file_path)
    call writefile(hates, g:hate_path)
    call Picker()
    redrawstatus
    call ShowCS()
endfunction

function! BackCS()
    execute writefile([], g:hate_path)
    redrawstatus
    echo "you've got all the previously hated colorschemes back"
endfunction

function! ShowCS()
    if exists("g:colorscheme_file") && g:colorscheme_file != ''
        echo 'using colorscheme '.g:colorscheme_file
    else
    "    echo 'using colorscheme as selected by .vimrc'
    endif
endfunction

"call Picker()

autocmd VimEnter * :call ShowCS()
command! Love call LoveCS()
command! Hate call HateCS()
command! CS call ShowCS()
command! Back call BackCS()
command! CSP call Picker()


" ADDED BY CG"
if (exists("g:auto_pick_colorscheme")) || &cp
  call Picker()
endif

