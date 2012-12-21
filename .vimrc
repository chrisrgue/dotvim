" Enable pathogen: to load all plugins underneath ~/.vim/bundle/<PLUGIN>
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()


" toprevent autoession plugin to autoload last store session from
" $HOME.'/.vim/autosess/' "
let g:loaded_autosess = 1

"-----------------------------------------------------
"CG: keep in mind
" to paste the content of (default yank) register (") into VIM's cmdline do
" :<CTRL-R>"
" i.e. press CTRL-R followed by "  (=1 double quote)
"-----------------^-------------^-------------------


"The leader character is your own personal modifier key, as g is Vim’s modifier key (when compared to vi).
"The default leader is \, but this isn’t located standardly on all keyboards and requires a pinky stretch in any case.
"<SPACE> is also a good choice. Note: you can of course have several “personal modifier keys” simply by mapping a sequence,
let mapleader = ","


"display trailing whitespace as if it were errors
match ErrorMsg '\s\+$'


"enabled modeline and set number of valid modeline lines
"(lines at begion or end offile that vim will check for modeline options)
"to 5 lines
set ml mls=5
set hlsearch incsearch ignorecase smartcase cursorcolumn
set autowrite  number  expandtab  sts=2 ts=2  sw=2  t_Co=256
" fen = foldenable  nofen=nofoldenable
set nofen
"By default, Vim only remembers the last 20 commands and search patterns entered. It’s nice to boost this up:
set history=1000
"Make file/command completion useful
"By default, pressing <TAB> in command mode will choose the first possible completion with no indication of how many others there might be. The following configuration lets you see what your other options are:
set wildmenu
"To have the completion behave similarly to a shell, i.e. complete only up to the point of ambiguity (while still showing you what your options are), also add the following:
set wildmode=list:longest
"Set the terminal title
"A running gvim will always have a window title, but when vim is run within an xterm,
"by default it inherits the terminal’s current title.
set title
"Maintain more context around the cursor
"When the cursor is moved outside the viewport of the current window, the buffer is scrolled by a single line. Setting the option below will start the scrolling three lines before the border, keeping more context around where you’re working.
set scrolloff=3

"Since Vim thinks this is regular key strokes, it applies all auto-indenting
"and auto-expansion of defined abbreviations to the input, resulting in often
"cascading indents of paragraphs.  There is an easy option to prevent this,
"however. You can temporarily switch to “paste mode”, simply by setting the
"following option:
set pastetoggle=<F2>
" ignore the matching files during tab filename completion
set wildignore=*.o,*.obj,*.bak,*.exe,*.swp,*.pyc,*.class,*.tgz,*.tar,*.zip,*.so,*.dll,*.a
set nocompatible



syntax on
filetype on
filetype indent on
filetype plugin on


" CG: Moved into .gvimrc"
" if has("gui_running")
"   set guioptions-=m
"   set guioptions-=T
" endif

" Uncomment the folowingline to automat. pick a new colorschemem during startup"
"let g:auto_pick_colorscheme=1


"colorscheme luinnar
"colorscheme chocolateliquor
"colorscheme anokha
colorscheme vividchalk
"colorscheme leo

"bright colorschemes (at least under GVIM)"
"colorscheme lazarus

"Make Alt-q behave as Ctrl-q (to enter visual block mode)
"noremap <A-V> <C-V>
noremap <A-y> <C-q>
noremap <A-q> <C-q>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://stackoverflow.com/questions/66919/how-to-increment-in-vim-under-windows-where-ctrl-a-does-not-work
"I modified TMealy's solution so that CTRL-A still selects all (I find this useful), while CTRL-I increments (also useful).
" Use Ctrl-i / Ctrl-d to increment/decrement (instead of C-a/C-x)
noremap <C-I> <C-A>
noremap <C-D> <C-X>
" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <A-a> gggH<C-O>G
inoremap <A-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <A-a> <C-C>gggH<C-O>G
onoremap <A-a> <C-C>gggH<C-O>G
snoremap <A-a> <C-C>gggH<C-O>G
xnoremap <A-a> <C-C>ggVG
"map it to : (R)emove(T)railing(W)thitespace
nnoremap ,rtw :%s/\s\+$//e<CR>
nnoremap ,dtw :%s/\s\+$//e<CR>

"CG's                                                  : 'Underline current line' mapping
"----------------------------------------------------------------------------------------
"1. copy current line                                  : yyp
"2. remove trailing whitespace in copied line          : :s/\s\+$//e<cr>
"4. Jumop to startof line (ignore preceding whitespace : ^
"5. select until end of line                           : v$
"6. replace with -                                     : r-
"----------------------------------------------------------
nnoremap <leader>ul <esc>yyp:s/\s\+$//e<cr>^v$r-
nnoremap <leader>ul <esc>yyp:s/\s\+$//e<cr>^v$r-
inoremap <leader>ul <esc>yyp:s/\s\+$//e<cr>^v$r-
"----------------------------------------------------------



" Removes trailing spaces in current buffer
function! TrimWhiteSpace()
    %s/\s\+$//e
:endfunction


function! CompileGraphvizDotFileAndShow()
  let l:fname = expand('%:p')
  GraphvizCompile
  echo "Viewing " . l:fname
  GraphvizShow
endfunction



"automatically remove trailing whitespace before changing a file
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
" vimwiki
:autocmd bufenter *.wiki set nofen|nmap <F3> <esc>bi[[<ESC>ea]]<ESC>1h|nmap <S-F3> <ESC>eF[F[2xf]2x1h<ESC>
":nmap ,e <esc>bi[[<ESC>ea]]<ESC>2h
:let g:vimwiki_use_mouse=1
:autocmd bufenter *.rb set foldmethod=syntax|set foldlevel=1|set nofen|compiler ruby|set ts=2 shiftwidth=2 expandtab
"|setfiletype ruby
"au! filetypedetect BufRead,BufNewFile *.rb   set ts=2 softtabstop=2 shiftwidth=2 expandtab | setfiletype ruby | syn on
:autocmd filetype ruby runtime! autoload/rubycomplete.vim
:autocmd filetype python runtime! autoload/pythoncomplete.vim
:au! BufNewFile,BufRead *.ihal set filetype=lite
:au! BufNewFile,BufRead *.hdl set filetype=xml
:au! BufNewFile,BufRead *.hdl2 set filetype=ruby
:nmap ,nt <ESC>:NERDTreeToggle<CR>

"so $VIMRUNTIME/mswin.vim
so $HOME/.vim/cg__mswin.vim

" now you can select both with the mouse and shifted arrow keys and press '>' to indent
set selectmode=

nnoremap <space> za
"omni completion via ctrl-space
imap <c-space> <c-x><c-o>

"Remap ` to '
"These are very similar keys. Typing 'a will jump to the line in the current file marked with ma.
"However, `a will jump to the line and column marked with ma.
"It’s more useful in any case I can imagine,
"but it’s located way off in the corner of the keyboard.
"The best way to handle this is just to swap them:
nnoremap ' `
nnoremap ` '


"Scroll the viewport faster
"<C-e> and <C-y> scroll the viewport a single line. I like to speed this up:
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Store temporary files in a central spot
"Swap files and backups are annoying but can save you a lot of trouble. Rather than spread them all around your filesystem, isolate them to a single directory:

"$ mkdir ~/.vim-tmp  # or whatever
"And in .vimrc:
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"Catch trailing whitespace
"The following will make tabs and trailing spaces visible when requested:
"By default whitespace will be hidden, but now it can be toggled with ,s.
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>


"Enable limited line numbering
"It’s often useful to know where you are in a buffer, but full line numbering is distracting. Setting the option below is a good compromise:
set ruler

"Don’t worry about the name. What this does is allow Vim to manage multiple buffers effectively.
"The current buffer can be put to the background without writing to disk;
"When a background buffer becomes current again, marks and undo-history are remembered.
set hidden

" see http://www.youtube.com/watch?v=_3L0d8wAm_8&feature=related
" refactoring macro:  "refactor out selected text into 'before(:each) do .. end' block"
" in visual mode:
"   -  select buffer named  't'                       ==>   "t
"   -  deleted current selection                      ==>    d
"   - search back for 'describe'                      ==>    ?describe<CR>
"   - insert into line below  'before(:each) do...end'  ==>    obefore(:each) do<CR>end<CR>
"   -  go 2 lines up                                  ==>    <esc>kk
"   -  paste content of buffer t                      ==>    "tp
vmap <Leader>bed "td?describe<CR>obefore(:each) do<CR>end<CR><ESC>kk"tp

"""""""""""""""""""  ECLIPSE + ECLIM settings """""""""""""""""""""""""""
" maps Ctrl-F6 to eclipse's Ctrl-F6 key binding (switch editors)
nmap <silent> <c-f6> :call eclim#vimplugin#FeedKeys('Ctrl+F6')<cr>

" maps Ctrl-F7 to eclipse's Ctrl-F7 key binding (switch views)
nmap <silent> <c-f7> :call eclim#vimplugin#FeedKeys('Ctrl+F7')<cr>

" maps Ctrl-F to eclipse's Ctrl-Shift-R key binding (find resource)
" TODO: cg:  C-F  used for 'maximize' plugin
""" nmap <silent> <c-f> :call eclim#vimplugin#FeedKeys('Ctrl+Shift+R')<cr>

" maps Ctrl-M to eclipse's Ctrl-M binding to maximize the editor
nmap <silent> <c-m> :call eclim#vimplugin#FeedKeys('Ctrl+M', 1)<cr>

" hitting ctrl-space in eclim activates aut completion
imap <c-space> <c-x><c-u>

"Pressing ,v opens the vimrc file in a new tab.
nmap <leader>v :vsp $MYVIMRC<CR>


"see http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ee :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


"call taglist#TlistToggle()
map <F5> :TlistToggle<cr>
map <leader>tl :TlistToggle<cr>

"format current parapgraph with par
map <leader>fmtq vap:!par<cr>
"map <leader>p vap:!par<cr>

"Tired of clearing highlighted searches by searching for “ldsfhjkhgakjks”? Use this:
nmap <silent> ,/ :nohlsearch<CR>

"Finally, a trick by Steve Losh for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts). This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

"""""""""""""" xptemplate config
let g:xptemplate_snippet_folders=['$HOME/.vim/xptemplate_personal_snippets']
"turn off automatic closing  of quotes and braces
let g:xptemplate_brace_complete = 0
"
" Snippet triggering key
"qlet g:xptemplate_key =ey:
"let g:xptemplate_key = '<S-F1>'
let g:xptemplate_key = '<Leader>s'
"
"Open the popup-menu:
let g:xptemplate_key_pum_only = '<Leader><Tab>'
"
"Clean current placeholder and jump to the next
imap <C-d> <Tab>
let g:xptemplate_nav_cancel = '<C-d>'
"
"Move to the next placeholder in a snippet:
let g:xptemplate_nav_next = '<Tab>'
"
"Go to the end of the current placeholder and in to insert mode:
"
" <C+-> ISACTUALLY Ctrl-/ on my keyboard
let g:xptemplate_to_right = '<C-_>'
"
"Move cursor back to last placeholder:
let g:xptemplate_goback = '<C-g>'
"
"Use TAB/S-TAB tonavigate through the popup-menu:
let g:xptemplate_pum_tab_nav = 1

" for easytags not checking to re-create  ~/.tagsfile too often"
"set updatetime=4000
let g:HiCursorWords_delay = 4000

"
"Reload xptemplate snippets without quitting vim
nmap <M-S-F1> :XPTreload<CR>

"""""""""""""" ENDOF xptemplate config


" :Bsgrep! <regexp> to search in CURRENT BUFFER ==> buffersaurus window opens with matched lines
" :Bsgrep  <regexp> to searcg in ALL OPENED BUFFERS ==> buffersaurus window opens with matched lines
"
" within buffersaurus window use "cc" to toggle "conext mode" on and off
"

"shell plugin provides :Fullscreen and :Open commands
inoremap <Leader>fs <C-o>:Fullscreen<CR>
nnoremap <F11> <esc>:Fullscreen<CR>
inoremap <F11> <esc>:Fullscreen<CR>
nnoremap <Leader>fs :Fullscreen<CR>
inoremap <Leader>op <C-o>:Open<CR>
nnoremap <Leader>op :Open<CR>


nnoremap <Space>sh :ConqueTermSplit bash<CR>


"au! filetypedetect BufWrite *.dot  :GraphvizCompile | :GraphvizShow
au! filetypedetect BufWrite *.dot  call CompileGraphvizDotFileAndShow()
 " Set up detection for Txtfmt files
au! filetypedetect BufRead,BufNewFile *.txt    setfiletype txtfmt
au! filetypedetect BufRead,BufNewFile *.java set      softtabstop=4 shiftwidth=4 expandtab | setfiletype java | syn on
"au! filetypedetect BufRead,BufNewFile *.rb   set ts=2 softtabstop=2 shiftwidth=2 expandtab | setfiletype ruby | syn on
" Source the vimrc file after saving it
au! bufwritepost .vimrc source $MYVIMRC



" toggleMaximize (implemented by .vim/plugin/toggle_maximize.vim)
"nnoremap  <silent> <C-F> :call <SID>ToggleMaximize()<Enter>
"map <C-F> <C-\>

" smartword plugin see https://github.com/kana/vim-smartword/blob/master/doc/smartword.txt
"(B) Use other key sequences for smart version:
map <SPACE>w  <Plug>(smartword-w)
map <SPACE>b  <Plug>(smartword-b)
map <SPACE>e  <Plug>(smartword-e)
map <SPACE>ge  <Plug>(smartword-ge)




""""""" See http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html
"Listing 1. Toggling syntax highlighting
function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction

nmap <silent>  <SPACE>s  :call ToggleSyntax()<CR>


function! CapitalizeCenterAndMoveDown()
   s/\<./\u&/g   "Built-in substitution capitalizes each word
   center        "Built-in center command centers entire line
   +1            "Built-in relative motion (+1 line down)
endfunction

nmap <silent>  <SPACE>c  :call CapitalizeCenterAndMoveDown()<CR>

"Highlighting frequently misused words (see )

"Create a text highlighting style that always stands out...
highlight STANDOUT term=bold cterm=bold gui=bold

"List of troublesome words...
let s:words = [
             \ "it's",  "its",
             \ "your",  "you're",
             \ "were",  "we're",   "where",
             \ "their", "they're", "there",
             \ "to",    "too",     "two"
             \ ]

"Build a Vim command to match troublesome words...
let s:words_matcher
\ = 'match STANDOUT /\c\<\(' . join(s:words, '\|') . '\)\>/'

"Toggle word checking on or off...
" Word checking is enabled by setting Vim's match command. A match expects a
" text-highlighting specification (STANDOUT in this example), followed by a
" regular expression that specifies which text to highlight. In this case,
" that regex is constructed by OR'ing together all of the words specified in
" the script's s:words list variable (that is: join(s:words, '\|')). That set
" of alternatives is then bracketed by case-insensitive word boundaries
" (\c\<\(...\)\>) to ensure that only entire words are matched, regardless of
" capitalization."
function! WordCheck ()
   "Toggle the flag (or set it if it doesn't yet exist)...
   let w:check_words = exists('w:check_words') ? !w:check_words : 1

   "Turn match mechanism on/off, according to new state of flag...
   if w:check_words
      exec s:words_matcher
   else
      match none
   endif
endfunction

"Use ;p to toggle checking...

nmap <silent>  <SPACE>wc  :call WordCheck()<CR>




""""""" See http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html

"Scripting in Insert mode
"Vimscripting is by no means restricted to Normal mode. You can also use the imap or iabbrev commands to set up key-mappings or abbreviations that can be used while inserting text. For example:
imap <silent> <C-D><C-D> <C-R>=strftime("%e %b %Y")<CR>

imap <silent> <C-T><C-T> <C-R>=strftime("%l:%M %p")<CR>
"With these mappings in your .vimrc, typing CTRL-D twice while in Insert mode causes Vim to call its built-in strftime() function and insert the resulting date, while double-tapping CTRL-T likewise inserts the current time.
"You can use the same general pattern to cause an insertion map or an abbreviation to perform any scriptable action. Just put the appropriate Vimscript expression or function call between an initial <C-R>= (which tells Vim to insert the result of evaluating what follows) and a final <CR> (which tells Vim to actually evaluate the preceding expression). Remember, though, that <C-R> (Vim's abbreviation for CTRL-R) is not the same as <CR> (Vim's abbreviation for a carriage return).
"For example, you could use Vim's built-in getcwd() function to create an abbreviation for the current working directory, like so:
iabbrev <silent> CWD <C-R>=getcwd()<CR>
"Or you could embed a simple calculator that can be called by typing CTRL-C during text insertions:
imap <silent> <C-C> <C-R>=string(eval(input('Calculate: ')))<CR>
"Here, the expression:
"string( eval( input("Calculate: ") ) )
"first calls the built-in input() function to request the user to type in their calculation, which input() then returns as a string. That input string is then passed to the built-in eval(), which evaluates it as a Vimscript expression and returns the result. Next, the built-in string() function converts the numeric result back to a string, which the key-mapping's <C-R>= sequence is then able to insert.







""""""" See http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html

"Listing 11. Improving vertical copies to ignore blank lines
"  The LookUpwards() function first determines which on-screen column (or "virtual column") the insertion point is currently in, using the built-in virtcol() function. The '.' argument specifies that you want the column number of the current cursor position:
"  let column_num = virtcol('.')
"  LookUpwards() then uses the built-in search() function to look backwards through the file from the cursor position:
"  let target_pattern = '\%' . column_num . 'v.'
"  let target_line_num = search(target_pattern . '*\S', 'bnW')
"  The search uses a special target pattern (namely: \%column_numv.*\S) to locate the closest preceding line that has a non-whitespace character (\S) at or after (.*) the cursor column (\%column_numv). The second argument to search() is the configuration string bnW, which tells the function to search backwards but not to move the cursor nor to wrap the search. If the search is successful, search() returns the line number of the appropriate preceding line; if the search fails, it returns zero.
"  The if statement then works out which character—if any—is to be copied back down to the insertion point. If a suitable preceding line was not found, target_line_num will have been assigned zero, so the first return statement is executed and returns an empty string (indicating "insert nothing").
"  If, however, a suitable preceding line was identified, the second return statement is executed instead. It first gets a copy of that preceding line from the current editor buffer:
"  return matchstr(getline(target_line_num), target_pattern)
"  It then finds and returns the one-character string that the previous call to search() successfully matched:
"  return matchstr(getline(target_line_num), target_pattern)
"  Having implemented this new vertical copy behavior inside LookUpwards(), all that remains is to override the standard CTRL-Y command in Insert mode, using an imap:
"  imap <silent> <C-Y> <C-R><C-R>=LookUpwards()<CR>
"  Note that, whereas earlier imap examples all used <C-R>= to invoke a Vimscript function call, this example uses <C-R><C-R>= instead. The single-CTRL-R form inserts the result of the subsequent expression as if it had been directly typed, which means that any special characters within the result retain their special meanings and behavior. The double-CTRL-R form, on the other hand, inserts the result as verbatim text without any further processing.
"  Verbatim insertion is more appropriate in this example, since the aim is to exactly copy the text above the cursor. If the key-mapping used <C-R>=, copying a literal escape character from the previous line would be equivalent to typing it, and would cause the editor to instantly drop out of Insert mode.

"Locate and return character "above" current cursor position...
function! LookUpwards()
   "Locate current column and preceding line from which to copy...
   let column_num      = virtcol('.')
   let target_pattern  = '\%' . column_num . 'v.'
   let target_line_num = search(target_pattern . '*\S', 'bnW')

   "If target line found, return vertically copied character...

   if !target_line_num
      return ""
   else
      return matchstr(getline(target_line_num), target_pattern)
   endif
endfunction

"Reimplement CTRL-Y within insert mode...
imap <silent>  <C-Y>  <C-R><C-R>=LookUpwards()<CR>


""""""" See http://vim.wikia.com/wiki/VimTip315
"The following lines (in your vimrc) implement smart home for normal, visual, operator pending, and insert modes.
"The first line is an expression mapping for normal, visual, and operator pending modes. The right-hand side of the mapping is an expression that is evaluated each time Home is pressed. The expression gives a string, and the result is as if the characters in the string had been pressed. The expression compares col('.') (the cursor column position, where 1 is the first column) and match(getline('.'),'\S')+1 (the index of the first non-whitespace character in the current line; 1 is added because the index starts at 0). If both sides of "==" are equal, the result is '0' (move to start of line); otherwise it is '^' (move to first nonblank character).
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>




""""""" See http://vim.wikia.com/wiki/VimTip431
"Change to forward/back slashesEdit
"The following mappings (for your vimrc) allow easily changing slashes in the current line.
"By default the <Leader> key is backslash, and <Bslash> is a way to refer to a backslash in a mapping, so by default these commands map \/ and \\ respectively.

"Press <Leader>/ to change every backslash to a forward slash, in the current line.

"Press <Leader>\ to change every forward slash to a backslash, in the current line.

"The mappings save and restore the search register (@/) so a previous search can be continued, if wanted. The :noh command is used to remove search highlighting (if enabled) to avoid search hits being highlighted after setting the search register.
"In the substitute command (:s), a colon (:) is used as a delimiter, so the slashes do not need to be escaped. The substitute flags (ge) cause all occurrences on the line to be substituted (g), and no error to be reported if no slash is found (e).

nnoremap <silent> <Leader>/ :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <silent> <Leader><Bslash> :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<CR>





""""""" See http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html
"
" Table 1. Vimscript variable scoping
" Prefix	Meaning
" g: varname	 The variable is global
" s: varname	 The variable is local to the current script file
" w: varname	 The variable is local to the current editor window
" t: varname	 The variable is local to the current editor tab
" b: varname	 The variable is local to the current editor buffer
" l: varname	 The variable is local to the current function
" a: varname	 The variable is a parameter of the current function
" v: varname	 The variable is one that Vim predefines



" Table 2. Vimscipt pseudovariables
" "Prefix	Meaning
" & varname	 A Vim option (local option if defined, otherwise global)
" &l: varname	 A local Vim option
" &g: varname	 A global Vim option
" @ varname	 A Vim register
"$ varname	 An environment variable
"


" puts VIM::evaluate('@+')




" Configure synatstic pkugin to use mri for ruby syntax checking"
let g:syntastic_ruby_exec = "/home/cg/.rvm/bin/ruby"




" align all DI__ assignments
noremap <silent>  ,ff :Tabularize /DI__/l1l0l0<CR>:Tabularize /=<CR>


" ,p  ==> CLEANUP DYNAMIC PROPERTIES (keep commented original content)
noremap <silent>  ,p  :!~/cleanup_diproperties.rb<CR>:g/TODO:mod/normal ==<CR>:nohlsearch<CR>

" ,pp ==> CLEANUP DYNAMIC PROPERTIES (do NOT keep commented original content)
"noremap <silent>  ,pp :!KEEP_ORIG=false ~/cleanup_diproperties.rb<CR>:g/TODO:mod/normal ==<CR>:nohlsearch<CR>vi}:g/^\s*$/d<CR>/postprocessed<CR>dd<CR>2k<CR>vi}<CR>,ff<CR>

noremap <silent>  ,pp :!KEEP_ORIG=false ~/cleanup_diproperties.rb<CR>:g/TODO:mod/normal ==<CR>:nohlsearch<CR>vi}:g/^\s*$/d<CR>/postprocessed<CR>dd<CR>2k<CR>vi}<CR>:Tabularize /DI__/l1l0l0<CR>:Tabularize /=<CR>

"noremap <silent>  ,pp :!KEEP_ORIG=false ~/cleanup_diproperties.rb<CR>:g/TODO:mod/normal ==<CR>:nohlsearch<CR>vi}:g/^\s*$/d<CR>/postprocessed<CR>dd<CR>2k<CR>vi}<CR>:Tabularize /=<CR>vi}<CR>:Tabularize /DI__/l1l0l0<CR>



" Bubble single lines: using the unimpaired plugin
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Delete whitespace lines within selection
vnoremap ,del :g/^\s*$/d<CR>



"Mappings provided by the unimpaired plugin (see https://github.com/tpope/vim-unimpaired)
" There are mappings which are simply short normal mode aliases for commonly used ex commands. ]q is :cnext. [q is :cprevious. ]a is :next. [b is :bprevious. See the documentation for the full set of 20 mappings and mnemonics. All of them take a count.
"
" There are linewise mappings. [<Space> and ]<Space> add newlines before and after the cursor line. [e and ]e exchange the current line with the one above or below it.
"
" There are mappings for encoding and decoding. [x and ]x encode and decode XML (and HTML). [u and ]u encode and decode URLs. [y and ]y do C String style escaping. [Y and ]Y encode and decode Base64.
"
" And in the miscellaneous category, there's [o and ]o to go to the next/previous file in the directory, and [n and ]n to jump between SCM conflict markers.


nmap <C-Right> :bn<CR>
nmap <C-Left> :bp<CR>


"DRAWIT plugin:
"  description
"  DrawIt is a plugin which allows one to draw lines left, right, up, down, and along both slants. Optionally one may "cap" the lines with arrowheads.  One may change the horizontal, vertical, slant, and crossing characters to whichever characters one wishes.
"
"  Its easy to start and stop DrawIt: use
"
"     \di to start DrawIt and
"     \ds to stop  DrawIt.
"
"  The alpha/beta version is available at  http://www.drchip.org/astronaut/vim/index.html#DRAWIT.
"
"  When DrawIt has been started you may use the number pad to leave a trail of dashes, vertical bars, etc.  The lines will be expanded as needed to accomodate your drawing.  DrawIt can also draw boxes and ellipses on a blank-filled area (DrawIt can produce these) which can be useful for drawing boxes around comments.
"
"  Viart's <drawing.vim> has been merged with the original DrawIt (vimscript#11) (by permission).  Use visual-block selection to specify starting and ending positions and a Bresenham line drawing algorithm will be used to connect the two.  DrC has written an ellipse-drawing Bresenham-style procedure: again, use the visual block selection to specify a box to contain the ellipse and \e to trigger the ellipse drawing.
"
"  DrawIt incorporates an "erase" mode, toggled by the <space> key, that will leave a trail of blanks behind and under the cursor as it is moved by the number pad.  Using the shift-arrow keys, DrawIt will move the cursor, expanding lines and inserting spaces as needed, without changing underlying text.
"
"  DrawIt is now in the vimball format, which is understood by the new Vim 7.0 release.  After decompressing the DrawIt.vba.gz file, edit it with Vim, and then source it (:so %).  The components of DrawIt will then be placed where they belong, based on your Vim's runtimepath.
"
"  DrawIt records many user options that affect DrawIt and all maps that starting DrawIt creates.  When DrawIt is terminated it restores the user's maps and options.  DrawIt's number pad maps will expand the file as necessary to accomodate the drawing, automatically.
"
"  Supported Features
"     <left>       move and draw left
"     <right>      move and draw right, inserting lines/space as needed
"     <up>         move and draw up, inserting lines/space as needed
"     <down>       move and draw down, inserting lines/space as needed
"     <s-left>     move left
"     <s-right>    move right, inserting lines/space as needed
"     <s-up>       move up, inserting lines/space as needed
"     <s-down>     move down, inserting lines/space as needed
"     <space>      toggle into and out of erase mode
"     >            draw -> arrow
"     <            draw <- arrow
"     ^            draw ^  arrow
"     v            draw v  arrow
"     <pgdn>       replace with a \, move down and right, and insert a \
"     <end>        replace with a /, move down and left,  and insert a /
"     <pgup>       replace with a /, move up   and right, and insert a /
"     <home>       replace with a \, move up   and left,  and insert a \
"     \>           draw fat -> arrow
"     \<           draw fat <- arrow
"     \^           draw fat ^  arrow
"     \v           draw fat v  arrow
"     \a           draw arrow based on corners of visual-block
"     \b           draw box using visual-block selected region
"     \e           draw an ellipse inside visual-block
"     \f           fill a figure with some character
"     \h           create a canvas for \a \b \e \l
"     \l           draw line based on corners of visual block
"     \s           adds spaces to canvas
"     <leftmouse>  select visual block
"  <s-leftmouse>  drag and draw with current brush (register)
"     \ra ... \rz  replace text with given brush/register
"     \pa ...      like \ra ... \rz, except that blanks are considered
"                  to be transparent
"

",ca  : drawit: "change arrow direction":  ----> (right arrow) to <---- (left arrow)
map ,ca be<CR>r-<CR>?[^-]<CR>1l<CR>r<<CR>,/<CR>

"visswap plugin: changed mapping:  intead of using C-x uses C-xC-x  and instead of C-y uses C-yC-y
" C-yC-y yanks visual selection
" C-xC-x exchanges visual selection with formerly yanked selection



"  3. Visual Block Search				*vis-search* *vis-srch* *vis-S*
"
"  	Visual block search provides two ways to get visual-selection
"  	based searches.  Both these methods work well with :set hls
"  	and searching may be repeated with the n or N commands.
"
"  	Using // and ?? after a visual selection (the // is only available
"  	if you have g:vis_WantSlashSlash=1 in your <.vimrc> file):
"  >
"  		ex. select region via V, v, or ctrl-v
"  		    //pattern

let g:vis_WantSlashSlash=1

"Add RVM info of currently used ruby to vim statusline or titlestring:
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)\ %{rvm#statusline()}
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{rvm#statusline()}
"
"dummy"

"automatically ajusts the current ruby according to a potentitally existing .rvmrc in project's top directory
":autocmd BufEnter * Rvm


"echo "Sourced " . $MYVIMRC

