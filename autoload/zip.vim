" zip.vim: Handles browsing zipfiles
"            AUTOLOAD PORTION
" Date:		Apr 24, 2012
" Version:	26a	ASTRO-ONLY
" Maintainer:	Charles E Campbell, Jr <NdrOchip@ScampbellPfamily.AbizM-NOSPAM>
" License:	Vim License  (see vim's :help license)
" Copyright:    Copyright (C) 2005-2012 Charles E. Campbell, Jr. {{{1
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               zip.vim and zipPlugin.vim are provided *as is* and comes with
"               no warranty of any kind, either expressed or implied. By using
"               this plugin, you agree that in no event will the copyright
"               holder be liable for any damages resulting from the use
"               of this software.

" ---------------------------------------------------------------------
" Load Once: {{{1
if &cp || exists("g:loaded_zip")
 finish
endif
let g:loaded_zip= "v26a"
if v:version < 702
 echohl WarningMsg
 echo "***warning*** this version of zip needs vim 7.2"
 echohl Normal
 finish
endif
let s:keepcpo= &cpo
set cpo&vim

let s:zipfile_escape = ' ?&;\'
let s:ERROR          = 2
let s:WARNING        = 1
let s:NOTE           = 0

" ---------------------------------------------------------------------
"  Global Values: {{{1
if !exists("g:zip_shq")
 if &shq != ""
  let g:zip_shq= &shq
 elseif has("unix")
  let g:zip_shq= "'"
 else
  let g:zip_shq= '"'
 endif
endif
if !exists("g:zip_zipcmd")
 let g:zip_zipcmd= "zip"
endif
if !exists("g:zip_unzipcmd")
 let g:zip_unzipcmd= "unzip"
endif

" ----------------
"  Functions: {{{1
" ----------------

" ---------------------------------------------------------------------
" zip#Browse: {{{2
fun! zip#Browse(zipfile)
"  call Dfunc("zip#Browse(zipfile<".a:zipfile.">)")
  let repkeep= &report
  set report=10

  " sanity checks
  if !exists("*fnameescape")
   if &verbose > 1
    echoerr "the zip plugin is not available (your vim doens't support fnameescape())"
   endif
   return
  endif
  if !executable(g:zip_unzipcmd)
   redraw!
   echohl Error | echo "***error*** (zip#Browse) unzip not available on your system"
"   call inputsave()|call input("Press <cr> to continue")|call inputrestore()
   let &report= repkeep
"   call Dret("zip#Browse")
   return
  endif
  if !filereadable(a:zipfile)
   if a:zipfile !~# '^\a\+://'
    " if its an url, don't complain, let url-handlers such as vim do its thing
    redraw!
    echohl Error | echo "***error*** (zip#Browse) File not readable<".a:zipfile.">" | echohl None
"    call inputsave()|call input("Press <cr> to continue")|call inputrestore()
   endif
   let &report= repkeep
"   call Dret("zip#Browse : file<".a:zipfile."> not readable")
   return
  endif
"  call Decho("passed sanity checks")
  if &ma != 1
   set ma
  endif
  let b:zipfile= a:zipfile

  setlocal noswapfile
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal nobuflisted
  setlocal nowrap
  set ft=tar

  " give header
  call append(0, ['" zip.vim version '.g:loaded_zip,
 \                '" Browsing zipfile '.a:zipfile,
 \                '" Select a file with cursor and press ENTER'])
  keepj $

"  call Decho("exe silent r! ".g:zip_unzipcmd." -l -- ".s:Escape(a:zipfile,1))
  exe "keepj sil! r! ".g:zip_unzipcmd." -Z -1 -- ".s:Escape(a:zipfile,1)
  if v:shell_error != 0
   redraw!
   echohl WarningMsg | echo "***warning*** (zip#Browse) ".fnameescape(a:zipfile)." is not a zip file" | echohl None
"   call inputsave()|call input("Press <cr> to continue")|call inputrestore()
   keepj sil! %d
   let eikeep= &ei
   set ei=BufReadCmd,FileReadCmd
   exe "keepj r ".fnameescape(a:zipfile)
   let &ei= eikeep
   keepj 1d
"   call Dret("zip#Browse")
   return
  endif

  setlocal noma nomod ro
  noremap <silent> <buffer> <cr> :call <SID>ZipBrowseSelect()<cr>

  let &report= repkeep
"  call Dret("zip#Browse")
endfun

" ---------------------------------------------------------------------
" ZipBrowseSelect: {{{2
fun! s:ZipBrowseSelect()
"  call Dfunc("ZipBrowseSelect() zipfile<".b:zipfile."> curfile<".expand("%").">")
  let repkeep= &report
  set report=10
  let fname= getline(".")

  " sanity check
  if fname =~ '^"'
   let &report= repkeep
"   call Dret("ZipBrowseSelect")
   return
  endif
  if fname =~ '/$'
   redraw!
   echohl Error | echo "***error*** (zip#Browse) Please specify a file, not a directory" | echohl None
"   call inputsave()|call input("Press <cr> to continue")|call inputrestore()
   let &report= repkeep
"   call Dret("ZipBrowseSelect")
   return
  endif

"  call Decho("fname<".fname.">")

  " get zipfile to the new-window
  let zipfile = b:zipfile
  let curfile= expand("%")
"  call Decho("zipfile<".zipfile.">")
"  call Decho("curfile<".curfile.">")

  new
  if !exists("g:zip_nomax") || g:zip_nomax == 0
   wincmd _
  endif
  let s:zipfile_{winnr()}= curfile
"  call Decho("exe e ".fnameescape("zipfile:".zipfile.'::'.fname))
  exe "e ".fnameescape("zipfile:".zipfile.'::'.fname)
  filetype detect

  let &report= repkeep
"  call Dret("ZipBrowseSelect : s:zipfile_".winnr()."<".s:zipfile_{winnr()}.">")
endfun

" ---------------------------------------------------------------------
" zip#Read: {{{2
fun! zip#Read(fname,mode)
"  call Dfunc("zip#Read(fname<".a:fname.">,mode=".a:mode.")")
  let repkeep= &report
  set report=10

  if has("unix")
   let zipfile = substitute(a:fname,'zipfile:\(.\{-}\)::[^\\].*$','\1','')
   let fname   = substitute(a:fname,'zipfile:.\{-}::\([^\\].*\)$','\1','')
  else
   let zipfile = substitute(a:fname,'^.\{-}zipfile:\(.\{-}\)::[^\\].*$','\1','')
   let fname   = substitute(a:fname,'^.\{-}zipfile:.\{-}::\([^\\].*\)$','\1','')
   let fname = substitute(fname, '[', '[[]', 'g')
  endif
"  call Decho("zipfile<".zipfile.">")
"  call Decho("fname  <".fname.">")

"  call Decho("exe r! ".g:zip_unzipcmd." -p -- ".s:Escape(zipfile,1)." ".s:Escape(fnameescape(fname),1))
  exe "keepj sil! r! ".g:zip_unzipcmd." -p -- ".s:Escape(zipfile,1)." ".s:Escape(fnameescape(fname),1)
  filetype detect

  " cleanup
  keepj 0d
  set nomod

  let &report= repkeep
"  call Dret("zip#Read")
endfun

" ---------------------------------------------------------------------
" zip#Write: {{{2
fun! zip#Write(fname)
"  call Dfunc("zip#Write(fname<".a:fname.">) zipfile_".winnr()."<".s:zipfile_{winnr()}.">")
  let repkeep= &report
  set report=10

  " sanity checks
  if !executable(g:zip_zipcmd)
   redraw!
   echohl Error | echo "***error*** (zip#Write) sorry, your system doesn't appear to have the zip pgm" | echohl None
"   call inputsave()|call input("Press <cr> to continue")|call inputrestore()
   let &report= repkeep
"   call Dret("zip#Write")
   return
  endif
  if !exists("*mkdir")
   redraw!
   echohl Error | echo "***error*** (zip#Write) sorry, mkdir() doesn't work on your system" | echohl None
"   call inputsave()|call input("Press <cr> to continue")|call inputrestore()
   let &report= repkeep
"   call Dret("zip#Write")
   return
  endif

  let curdir= getcwd()
  let tmpdir= tempname()
"  call Decho("orig tempname<".tmpdir.">")
  if tmpdir =~ '\.'
   let tmpdir= substitute(tmpdir,'\.[^.]*$','','e')
  endif
"  call Decho("tmpdir<".tmpdir.">")
  call mkdir(tmpdir,"p")

  " attempt to change to the indicated directory
  if s:ChgDir(tmpdir,s:ERROR,"(zip#Write) cannot cd to temporary directory")
   let &report= repkeep
"   call Dret("zip#Write")
   return
  endif
"  call Decho("current directory now: ".getcwd())

  " place temporary files under .../_ZIPVIM_/
  if isdirectory("_ZIPVIM_")
   call s:Rmdir("_ZIPVIM_")
  endif
  call mkdir("_ZIPVIM_")
  cd _ZIPVIM_
"  call Decho("current directory now: ".getcwd())

  if has("unix")
   let zipfile = substitute(a:fname,'zipfile:\(.\{-}\)::[^\\].*$','\1','')
   let fname   = substitute(a:fname,'zipfile:.\{-}::\([^\\].*\)$','\1','')
  else
   let zipfile = substitute(a:fname,'^.\{-}zipfile:\(.\{-}\)::[^\\].*$','\1','')
   let fname   = substitute(a:fname,'^.\{-}zipfile:.\{-}::\([^\\].*\)$','\1','')
  endif
"  call Decho("zipfile<".zipfile.">")
"  call Decho("fname  <".fname.">")

  if fname =~ '/'
   let dirpath = substitute(fname,'/[^/]\+$','','e')
   if has("win32unix") && executable("cygpath")
    let dirpath = substitute(system("cygpath ".s:Escape(dirpath,0)),'\n','','e')
   endif
"   call Decho("mkdir(dirpath<".dirpath.">,p)")
   call mkdir(dirpath,"p")
  endif
  if zipfile !~ '/'
   let zipfile= curdir.'/'.zipfile
  endif
"  call Decho("zipfile<".zipfile."> fname<".fname.">")

  exe "w! ".fnameescape(fname)
  if has("win32unix") && executable("cygpath")
   let zipfile = substitute(system("cygpath ".s:Escape(zipfile,0)),'\n','','e')
  endif

  if (has("win32") || has("win95") || has("win64") || has("win16")) && &shell !~? 'sh$'
    let fname = substitute(fname, '[', '[[]', 'g')
  endif

"  call Decho(g:zip_zipcmd." -u ".s:Escape(fnamemodify(zipfile,":p"),0)." ".s:Escape(fname,0))
  call system(g:zip_zipcmd." -u ".s:Escape(fnamemodify(zipfile,":p"),0)." ".s:Escape(fname,0))
  if v:shell_error != 0
   redraw!
   echohl Error | echo "***error*** (zip#Write) sorry, unable to update ".zipfile." with ".fname | echohl None
"   call inputsave()|call input("Press <cr> to continue")|call inputrestore()

  elseif s:zipfile_{winnr()} =~ '^\a\+://'
   " support writing zipfiles across a network
   let netzipfile= s:zipfile_{winnr()}
"   call Decho("handle writing <".zipfile."> across network as <".netzipfile.">")
   1split|enew
   let binkeep= &binary
   let eikeep = &ei
   set binary ei=all
   exe "e! ".fnameescape(zipfile)
   call netrw#NetWrite(netzipfile)
   let &ei     = eikeep
   let &binary = binkeep
   q!
   unlet s:zipfile_{winnr()}
  endif
  
  " cleanup and restore current directory
  cd ..
  call s:Rmdir("_ZIPVIM_")
  call s:ChgDir(curdir,s:WARNING,"(zip#Write) unable to return to ".curdir."!")
  call s:Rmdir(tmpdir)
  setlocal nomod

  let &report= repkeep
"  call Dret("zip#Write")
endfun

" ---------------------------------------------------------------------
" s:Escape: {{{2
fun! s:Escape(fname,isfilt)
"  call Dfunc("QuoteFileDir(fname<".a:fname."> isfilt=".a:isfilt.")")
  if exists("*shellescape")
   if a:isfilt
    let qnameq= shellescape(a:fname,1)
   else
    let qnameq= shellescape(a:fname)
   endif
  else
   let qnameq= g:zip_shq.escape(a:fname,g:zip_shq).g:zip_shq
  endif
"  call Dret("QuoteFileDir <".qnameq.">")
  return qnameq
endfun

" ---------------------------------------------------------------------
" ChgDir: {{{2
fun! s:ChgDir(newdir,errlvl,errmsg)
"  call Dfunc("ChgDir(newdir<".a:newdir."> errlvl=".a:errlvl."  errmsg<".a:errmsg.">)")

  try
   exe "cd ".fnameescape(a:newdir)
  catch /^Vim\%((\a\+)\)\=:E344/
   redraw!
   if a:errlvl == s:NOTE
    echo "***note*** ".a:errmsg
   elseif a:errlvl == s:WARNING
    echohl WarningMsg | echo "***warning*** ".a:errmsg | echohl NONE
   elseif a:errlvl == s:ERROR
    echohl Error | echo "***error*** ".a:errmsg | echohl NONE
   endif
"   call inputsave()|call input("Press <cr> to continue")|call inputrestore()
"   call Dret("ChgDir 1")
   return 1
  endtry

"  call Dret("ChgDir 0")
  return 0
endfun

" ---------------------------------------------------------------------
" s:Rmdir: {{{2
fun! s:Rmdir(fname)
"  call Dfunc("Rmdir(fname<".a:fname.">)")
  if (has("win32") || has("win95") || has("win64") || has("win16")) && &shell !~? 'sh$'
   call system("rmdir /S/Q ".s:Escape(a:fname,0))
  else
   call system("/bin/rm -rf ".s:Escape(a:fname,0))
  endif
"  call Dret("Rmdir")
endfun

" ------------------------------------------------------------------------
" Modelines And Restoration: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim:ts=8 fdm=marker
