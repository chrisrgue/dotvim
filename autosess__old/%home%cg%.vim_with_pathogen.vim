let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>XPTrawKey ,s
imap <silent> <Plug>XPTfallback <Plug>XPTrawKey
inoremap <C-F11> :Maximize
inoremap <F6> :Open
inoremap <silent> <BS> =VracketBackspace()
imap <S-Tab> <Plug>SuperTabBackward
inoremap <F11> :Fullscreen
imap <C-Space> 
cnoremap <C-F4> c
inoremap <C-F4> c
cnoremap <C-Tab> w
inoremap <C-Tab> w
cmap <S-Insert> +
imap <S-Insert> 
xnoremap  ggVG
snoremap  gggHG
onoremap  gggHG
nnoremap  gggHG
vnoremap  "+y
nnoremap  3
noremap 	 
nmap <silent>  :call eclim#vimplugin#FeedKeys('Ctrl+M', 1)
noremap  
vnoremap  :update
nnoremap  :update
onoremap  :update
nmap  "+gP
omap  "+gP
vnoremap  "+x
nnoremap  3
vnoremap  
onoremap  
noremap  u
nnoremap   za
nnoremap ' `
noremap ,rcp :RConvertPostConditional
snoremap <silent> ,s `>i=XPTemplateStart(0,{'k':'<Leader++s'})
xnoremap <silent> ,s "0s=XPTemplatePreWrap(@0)
vnoremap ,rem :RExtractMethod
vnoremap ,rriv :RRenameInstanceVariable
vnoremap ,rrlv :RRenameLocalVariable
vnoremap ,relv :RExtractLocalVariable
vnoremap ,rec :RExtractConstant
nnoremap ,riv :RIntroduceVariable
nnoremap ,rcpc :RConvertPostConditional
nnoremap ,rel :RExtractLet
nnoremap ,rit :RInlineTemp
nnoremap ,rapn :RAddParameterNB
nnoremap ,rap :RAddParameter
nnoremap <silent> ,| :Bsopen
nnoremap <silent> ,] :Bsnext
nnoremap <silent> ,[ :Bsprev
map <silent> ,w,t <Plug>VimwikiTabMakeDiaryNote
map <silent> ,w,w <Plug>VimwikiMakeDiaryNote
map <silent> ,ws <Plug>VimwikiUISelect
map <silent> ,wt <Plug>VimwikiTabIndex
map <silent> ,ww <Plug>VimwikiIndex
nmap <silent> ,cv <Plug>VCSVimDiff
nmap <silent> ,cU <Plug>VCSUnlock
nmap <silent> ,cr <Plug>VCSReview
nmap <silent> ,cq <Plug>VCSRevert
nmap <silent> ,cN <Plug>VCSSplitAnnotate
nmap <silent> ,cL <Plug>VCSLock
nmap <silent> ,cg <Plug>VCSGotoOriginal
nmap <silent> ,cG <Plug>VCSClearAndGotoOriginal
nmap <silent> ,cd <Plug>VCSDiff
nmap <silent> ,cD <Plug>VCSDelete
map ,mq <Plug>MBEMarkCurrent
map ,mbt <Plug>TMiniBufExplorer
map ,mbu <Plug>UMiniBufExplorer
map ,mbc <Plug>CMiniBufExplorer
map ,mbe <Plug>MiniBufExplorer
nnoremap <silent> ,b :CommandTBuffer
nnoremap <silent> ,t :CommandT
map <silent> ,f <Plug>SimpleFold_Foldsearch
vmap ,rv <Plug>RunViewV
vmap ,rh <Plug>RunViewH
nmap ,ca <Plug>NERDCommenterAltDelims
xmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
xmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
xmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cA <Plug>NERDCommenterAppend
xmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
xmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
xmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
nmap ,c$ <Plug>NERDCommenterToEOL
xmap ,cn <Plug>NERDCommenterNested
nmap ,cn <Plug>NERDCommenterNested
xmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
xmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
xmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
nnoremap <silent> ,* :execute ':Search \<' . expand('<cword>') . '\>'
vnoremap <silent> ,* y:call MultipleSearch#MultipleSearch(0,'\V'.substitute(escape(@@,"\\/\"'"),"\n",'\\n','ge'))
nnoremap ,op :Open
nnoremap ,fs :Fullscreen
map ,p vap:!par
map ,fmtq vap:!par
map ,tl :TlistToggle
map ,et :tabe %%
map ,ev :vsp %%
map ,es :sp %%
map ,ee :e %%
nmap ,v :vsp $MYVIMRC
vmap ,bed "td?describeobefore(:each) doendkk"tp
nmap <silent> ,s :set nolist!
nmap ,nt :NERDTreeToggle
nnoremap ,dtw :%s/\s\+$//e
nnoremap ,rtw :%s/\s\+$//e
noremap / :call SearchCompleteStart()/
inoremap <silent> ¡ =VracketOpen('¡')
inoremap <silent> ¿ =VracketOpen('¿')
cnoremap   :simalt ~
inoremap   :simalt ~
inoremap ï o
cnoremap á gggHG
inoremap á gggHG
xmap S <Plug>VSurround
vmap [% [%m'gv``
vmap ]% ]%m'gv``
nnoremap ` '
omap ar <Plug>(textobj-rubyblock-a)
xmap ar <Plug>(textobj-rubyblock-a)
vmap a% [%v]%
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
omap ir <Plug>(textobj-rubyblock-i)
xmap ir <Plug>(textobj-rubyblock-i)
xmap s <Plug>Vsurround
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
onoremap <C-F4> c
onoremap <C-Tab> w
vmap <S-Insert> 
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
snoremap <Plug>selectToInsert d<BS>
nnoremap <C-F11> :Maximize
nnoremap <F6> :Open
nnoremap <silent> <Plug>VCSVimDiff :VCSVimDiff
nnoremap <silent> <Plug>VCSUpdate :VCSUpdate
nnoremap <silent> <Plug>VCSUnlock :VCSUnlock
nnoremap <silent> <Plug>VCSStatus :VCSStatus
nnoremap <silent> <Plug>VCSSplitAnnotate :VCSAnnotate!
nnoremap <silent> <Plug>VCSReview :VCSReview
nnoremap <silent> <Plug>VCSRevert :VCSRevert
nnoremap <silent> <Plug>VCSLog :VCSLog
nnoremap <silent> <Plug>VCSLock :VCSLock
nnoremap <silent> <Plug>VCSInfo :VCSInfo
nnoremap <silent> <Plug>VCSClearAndGotoOriginal :VCSGotoOriginal!
nnoremap <silent> <Plug>VCSGotoOriginal :VCSGotoOriginal
nnoremap <silent> <Plug>VCSDiff :VCSDiff
nnoremap <silent> <Plug>VCSDelete :VCSDelete
nnoremap <silent> <Plug>VCSCommit :VCSCommit
nnoremap <silent> <Plug>VCSAnnotate :VCSAnnotate
nnoremap <silent> <Plug>VCSAdd :VCSAdd
xnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call NERDComment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("n", "Comment")
nnoremap <F11> :Fullscreen
nmap <M-S-F1> :XPTreload
map <F5> :TlistToggle
nmap <silent> <C-F7> :call eclim#vimplugin#FeedKeys('Ctrl+F7')
nmap <silent> <C-F6> :call eclim#vimplugin#FeedKeys('Ctrl+F6')
nnoremap <C-F4> c
vnoremap <C-F4> c
nnoremap <C-Tab> w
vnoremap <C-Tab> w
nmap <S-Insert> "+gP
omap <S-Insert> "+gP
vnoremap <C-Insert> "+y
vnoremap <S-Del> "+x
vnoremap <BS> d
cnoremap  gggHG
inoremap  gggHG
imap  	
imap S <Plug>ISurround
imap s <Plug>Isurround
imap 	 <Plug>SuperTabForward
imap  <Plug>SuperTabForward
imap  <Plug>SuperTabBackward
inoremap <silent> ,s =XPTemplateStart(0,{'k':'<C-r++<Leader++s','forcePum':1})
inoremap  :update
cmap  +
inoremap  
inoremap  u
inoremap <silent> ! =VracketClose('¡')
inoremap <silent> " =VracketBoth("\"")
cnoremap %% =expand('%:h').'/'
inoremap <silent> ' =VracketBoth("\'")
inoremap <silent> ( =VracketOpen('(')
inoremap <silent> ) =VracketClose('(')
inoremap <silent> ,	 =XPTemplateStart(0,{'k':'<Leader++<Tab++','popupOnly':1})
inoremap <silent> ,s =XPTemplateStart(0,{'k':'<Leader++s'})
inoremap ,op :Open
inoremap ,fs :Fullscreen
inoremap <silent> ? =VracketClose('¿')
noremap   :simalt ~
xnoremap á ggVG
snoremap á gggHG
onoremap á gggHG
nnoremap á gggHG
noremap ñ 
noremap ù 
inoremap <silent> [ =VracketOpen('[')
inoremap <silent> ] =VracketClose('[')
inoremap <silent> { =VracketOpen('{')
inoremap <silent> } =VracketClose('{')
let &cpo=s:cpo_save
unlet s:cpo_save
set autowrite
set background=dark
set backspace=indent,eol,start
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set balloonexpr=eclim#util#Balloon(eclim#util#GetLineError(line('.')))
set commentstring=
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noequalalways
set errorfile=~/graphviz_dot_examples/simple_statemachine.log
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guioptions=aegirLt
set helplang=en
set hidden
set hlsearch
set ignorecase
set incsearch
set keymodel=startsel,stopsel
set listchars=tab:>-,trail:·,eol:$
set mouse=a
set mousemodel=popup
set pastetoggle=<F2>
set printoptions=paper:letter
set ruler
set rulerformat=%-14.(%l,%c%V%)%=%P%{XPMautoUpdate(\"ruler\")}
set runtimepath=~/.vim,~/.vim/bundle/VisIncr-master,~/.vim/bundle/browserprint,~/.vim/bundle/shell,~/.vim/bundle/showmarks,~/.vim/bundle/tabular-master,~/.vim/bundle/taglist_45,~/.vim/bundle/vim-buffersaurus-master,~/.vim/bundle/vim-endwise,~/.vim/bundle/vim-pastie-master,~/.vim/bundle/vim-plugin-autosess-master,~/.vim/bundle/vim-ruby-refactoring-master,~/.vim/bundle/vim-textobj-rubyblock-master,~/.vim/bundle/vim-textobj-user-master,~/.vim/bundle/wmgraphviz.vim-master,~/.vim/bundle/xptemplate,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/bundle/tabular-master/after,~/.vim/after,~/.vim/eclim,~/.vim/eclim/after,~/.vim_without_pathogen/bundle/xptemplate/personal,$HOME/.vim/xptemplate_personal_snippets
set scrolloff=3
set selection=exclusive
set shiftwidth=2
set smartcase
set softtabstop=2
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=2
set termencoding=utf-8
set title
set whichwrap=b,s,<,>,[,]
set wildignore=*.o,*.obj,*.bak,*.exe,*.swp,*.pyc,*.class,*.tgz,*.tar,*.zip,*.so,*.dll,*.a
set wildmenu
set wildmode=list:longest
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/.vim_with_pathogen
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +44 ~/graphviz_dot_examples/simple_statemachine.dot
badd +36 ~/config_ini_reader.rb
badd +68 ~/configini_migrator.rb
badd +26 ~/Dropbox/workspace_svn_isource/scripts/doc/create_relocated_felix_properties_file.sh
badd +222 ~/.vimrc
silent! argdel *
edit ~/.vimrc
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 1 + 21) / 43)
exe '2resize ' . ((&lines * 39 + 21) / 43)
exe 'vert 2resize ' . ((&columns * 68 + 68) / 137)
exe '3resize ' . ((&lines * 39 + 21) / 43)
exe 'vert 3resize ' . ((&columns * 68 + 68) / 137)
argglobal
enew
file -MiniBufExplorer-
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> 	 :call search('\[[0-9]*:[^\]]*\]'):<BS>
nnoremap <buffer> h :call search('\[[0-9]*:[^\]]*\]','b'):<BS>
nnoremap <buffer> j gj
nnoremap <buffer> k gk
nnoremap <buffer> l :call search('\[[0-9]*:[^\]]*\]'):<BS>
nnoremap <buffer> p :wincmd p:<BS>
nnoremap <buffer> <S-Tab> :call search('\[[0-9]*:[^\]]*\]','b'):<BS>
nnoremap <buffer> <Up> gk
nnoremap <buffer> <Down> gj
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=delete
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
set cursorcolumn
setlocal cursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=
setlocal modeline
setlocal nomodifiable
setlocal nrformats=octal,hex
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!g:statusLineText
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal winfixheight
setlocal winfixwidth
setlocal wrap
setlocal wrapmargin=0
wincmd w
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
set cursorcolumn
setlocal cursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P%{XPMautoUpdate(\"statusline\")}
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 222 - ((18 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
222
normal! 0
wincmd w
argglobal
edit ~/config_ini_reader.rb
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=eclim#ruby#complete#CodeComplete
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
set cursorcolumn
setlocal cursorcolumn
setlocal nocursorline
setlocal define=^\\s*#\\s*define
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%+E%f:%l:\ parse\ error,%W%f:%l:\ warning:\ %m,%E%f:%l:in\ %*[^:]:\ %m,%E%f:%l:\ %m,%-C%tfrom\ %f:%l:in\ %.%#,%-Z%tfrom\ %f:%l,%-Z%p^,%-G%.%#
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=ruby\ -w\ $*
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,NOTE:\ Gem.all_load_paths\ is\ deprecated\ with\ no\ replacement.\ It\ will\ be\ removed\ on\ or\ after\ 2011-10-01.\
Gem.all_load_paths\ called\ from\ -e:1.\
NOTE:\ Gem.all_partials\ is\ deprecated\ with\ no\ replacement.\ It\ will\ be\ removed\ on\ or\ after\ 2011-10-01.\
Gem.all_partials\ called\ from\ ~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems.rb:261.\
NOTE:\ Gem.all_partials\ is\ deprecated\ with\ no\ replacement.\ It\ will\ be\ removed\ on\ or\ after\ 2011-10-01.\
Gem.all_partials\ called\ from\ ~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems.rb:261.\
/home/cg/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1,~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/i686-linux,~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby,~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/vendor_ruby/1.9.1,~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/vendor_ruby/1.9.1/i686-linux,~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/1.9.1,~/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/1.9.1/i686-linux
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P%{XPMautoUpdate(\"statusline\")}
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 25 - ((24 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
25
normal! 0
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 1 + 21) / 43)
exe '2resize ' . ((&lines * 39 + 21) / 43)
exe 'vert 2resize ' . ((&columns * 68 + 68) / 137)
exe '3resize ' . ((&lines * 39 + 21) / 43)
exe 'vert 3resize ' . ((&columns * 68 + 68) / 137)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
