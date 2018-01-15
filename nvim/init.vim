" Header -------------------------------------------------------------------{{{
"                          _   __         _    ___
"                         / | / /__  ____| |  / (_)___ ___
"                        /  |/ / _ \/ __ \ | / / / __ `__ \
"                       / /|  /  __/ /_/ / |/ / / / / / / /
"                      /_/ |_/\___/\____/|___/_/_/ /_/ /_/
"
"                                       ___
"                                      ( _ )
"                                     / __ \/|
"                                    / /_/  <
"                                    \____/\/
"
"                                _    ___
"                               | |  / (_)___ ___
"                               | | / / / __ `__ \
"                               | |/ / / / / / / /
"                               |___/_/_/ /_/ /_/
"
"                                     _____          _____ __
"                   _________  ____  / __(_)___ _   / __(_) /__
"                  / ___/ __ \/ __ \/ /_/ / __ `/  / /_/ / / _ \
"                 / /__/ /_/ / / / / __/ / /_/ /  / __/ / /  __/
"                 \___/\____/_/ /_/_/ /_/\__, /  /_/ /_/_/\___/
"                                       /____/
"
"                            © 2017 Sergtat
"
"                            Last modified: 28 фев 2017, 10:20
"
"---------------------------------------------------------------------------}}}
" Function {{{
" Insert Last Modified in NeoVim & Vim config file {{{
" If buffer modified, update any 'Last modified: ' in the first 30 lines.
" 'Last modified:' can have up to 30 characters before (they are retained).
" Restores cursor and window position using save_cursor variable
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([30, line("$")])
    keepjumps exe "1" . "," . "30" . "s@Last modified: .*@Last modified: " . strftime('%d %b %Y, %H:%M') . "@e"
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd FileType vim autocmd BufWritePre <buffer> call LastModified()
" }}}
" Edit & autoload configuration when this file changes ($MYIMRC) and vim files {{{
augroup reload_vimrc
autocmd!
autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC
autocmd! BufWritePost *.vim nested source $MYVIMRC
augroup END
" }}}
" Markdown Folding {{{
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr
" }}}
" Toggle Background Function {{{
function! ToggleBackground()
if (&background=='dark')
  set background=light
else
  set background=dark
endif
endfunction
command! Togbg call ToggleBackground()
" }}}
" AutoPaste mode {{{
function! WrapForTmux(s)
  if !exists('$TMUX') || system('tmux -V')[5] >= '2'
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_ti .= WrapForTmux("\<Esc>[?2004h")
let &t_te .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin(ret)
  set paste
  return a:ret
endfunction
" }}}
" Filetypes {{{
" }}}
" }}}
" Plugin managment {{{
" Install vim-plug if not instaled {{{
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
" }}}
" Plugins {{{
call plug#begin()
" Switch "On"|"Off", "True"|"False" etc. {{{
Plug 'AndrewRadev/switch.vim'
" }}}
" Colorcheme gruvbox{{{
Plug 'morhetz/gruvbox'
" }}}
" lyokha/vim-xkbswitch {{{
if $DISPLAY != ''
  Plug 'lyokha/vim-xkbswitch'
    let g:XkbSwitchEnabled = 1
    let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
    let g:XkbSwitchIMappings = ['ru']
    let g:XkbSwitchAssistNKeymap = 1 " for commands r and f
    let g:XkbSwitchAssistSKeymap = 1 " for search lines
endif
" }}}
" vim-conmmentary {{{
Plug 'tpope/vim-commentary'
set commentstring=#%s
" }}}
call plug#end()
" }}}
" }}}
" Basic setting {{{
" Disable Uganda children {{{
set shortmess+=I
" }}}
" set formatoptions {{{
if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
" }}}
" Set mouse {{{
set mouse=a
set mousetime=200
" }}}
" Line number {{{
set number
set numberwidth=4
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
" }}}
" Show hidden chars {{{
set display+=lastline
set list
set listchars=eol:¬,space:·,trail:·,extends:»,precedes:«,nbsp:→\,tab:▸\
" }}}
" Colorscheme {{{
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=8
endif

set background=dark
if $TERM == "linux"
  colorscheme koehler
else
  colorscheme gruvbox
endif

highlight Comment cterm=Italic term=italic gui=italic
highlight htmlItalic cterm=Italic term=italic gui=italic
highlight htmlBoldItalic term=Italic gui=Italic
highlight markdownItalic term=italic gui=italic
highlight markdownBoldItalic term=Italic gui=Italic
highlight NonText ctermfg=LightGray guifg=LightGray
highlight SpecialKey ctermfg=LightGray guifg=LightGray
" }}}
" Language {{{
set encoding=utf-8
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set helpheight=100
set helplang=ru,en
language messages C

" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" nmap Ж :
" " yank
" nmap Н Y
" nmap з p
" nmap ф a
" nmap щ o
" nmap г u
" nmap З P
" }}}
" Indent {{{
set autoindent
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set textwidth=0
set expandtab
set wrap
" }}}
" Other options {{{
set autoread
set backspace=indent,eol,start
set complete-=i
set cursorline                  " highlight the line under the cursor
set display+=lastline
set dir=/tmp
set fileformats+=mac
set fillchars+=vert:│           " better looking for windows separator
set history=1000
set hlsearch
set incsearch
set laststatus=2
set linebreak
set nrformats-=octal
set number
set ruler
set scrolloff=1
set sessionoptions-=options
set showbreak='\'
set showcmd
set showmode
set sidescrolloff=5
set tabpagemax=50
set title                       " set the terminal title to the current file
set ttimeout
set ttimeoutlen=100
set ttyfast                     " better screen redraw
set undolevels=1000             " boost undo levels
set viminfo^=!
set wildmenu

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
" }}}
" }}}
" set filetypes {{{
" help {{{
autocmd FileType vim,help setlocal keywordprg=:help
" }}}
" json {{{
autocmd FileType json setl ai fo=tcq2l tw=78 sw=2 ts=2 sts=2 et
autocmd FileType json setl conceallevel=0 foldmethod=syntax nofoldenable
" }}}
" coffee {{{
autocmd FileType coffee setl foldmethod=indent nofoldenable
autocmd FileType coffee setl sw=2 et
" }}}
" php {{{
autocmd FileType php setlocal ts=4 sts=4 sw=4 noet
" }}}
" python {{{
autocmd FileType python setlocal ts=4 sts=4 sw=4 et
" }}}
" javascript {{{
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 et
" }}}
" html {{{
autocmd FileType html setlocal ts=2 sts=2 sw=2 et wrap
" }}}
" xhtml {{{
autocmd FileType xhtml setlocal ts=2 sts=2 sw=2 noet wrap
" }}}
" xml {{{
autocmd FileType xml setlocal ts=2 sts=2 sw=2 noet wrap
" }}}
" css {{{
autocmd FileType css setlocal ts=2 sts=2 sw=2 et
" }}}
" vim {{{
autocmd FileType vim setlocal ts=2 sts=2 sw=2 et
" }}}
" apache {{{
autocmd FileType apache setlocal ts=2 sts=2 sw=2 noet
" }}}
" yaml {{{
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
" }}}
" markdown {{{
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 et wrap
autocmd FileType markdown setlocal conceallevel=0
" }}}
" }}}
" MARKDOWN {{{
" syn region markdownBoldItalic matchgroup=markdownInlineDelimiter
"   \ start="\%(\s\|_\|^\)\@<=_\*\*\%(\s\|\*\|$\)\@!" end="\%(\s\|\*\)\@<!\*\*_"
"   \ contains=@markdownInline
" syn region markdownBoldItalic matchgroup=markdownInlineDelimiter
"   \ start="\%(\s\|\*\|^\)\@<=\*__\%(\s\|_\|$\)\@!" end="\%(\s\|_\)\@<!__\*"
"   \ contains=@markdownInline
autocmd FileType markdown map F5 :! ~/repo/sites/wiki/public/bin/update_bd.sh <CR>
autocmd FileType markdown map F6 :! ~/repo/sites/wiki/public/bin/update.sh <CR>
autocmd FileType markdown let maplocalleader='\'
autocmd FileType markdown :set list | :set nospell
autocmd FileType markdown let g:table_mode_corner="|"
autocmd FileType markdown let b:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
autocmd FileType markdown :nmap <localLeader>1 :s@^@# @ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :nmap <localLeader>2 :s@^@## @ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :nmap <localLeader>3 :s@^@### @ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :nmap <localLeader>4 :s@^@#### @ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :nmap <localLeader>5 :s@^@##### @ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :nmap <localLeader>6 :s@^@###### @ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :nmap <localLeader>i :s@\(.*\)@_\1_@ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :vmap <localLeader>i :s@\%V\(.*\)\%V@_\1_@ <Enter>
autocmd FileType markdown :nmap <localLeader>b :s@\(.*\)@**\1**@ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :vmap <localLeader>b :s@\%V\(.*\)\%V@**\1**@ <Enter>
autocmd FileType markdown :nmap <localLeader>` :s@\(.*\)@```bash\r\1\r```@ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :vmap <localLeader>` :\<,\>s@@`\1`@<Enter>
autocmd FileType markdown :nmap <localLeader>- :s/^\s*/- / <CR> :nohlsearch <CR>
autocmd FileType markdown :vmap <localLeader>- :s/^\s*/- / <CR> :nohlsearch <CR>
autocmd FileType markdown :nmap <localLeader>> :s/^\s*/> / <CR> :nohlsearch <CR>
autocmd FileType markdown :vmap <localLeader>> :s/^\s*/> / <CR> :nohlsearch <CR>
autocmd FileType markdown :vmap <localLeader>n :s@^\s*@1. @<CR> gv :Numbered<CR> :nohlsearch<CR>
autocmd FileType markdown :nmap <localLeader>ti ^i![<C-R>%]<LEFT><BS><BS><BS><RIGHT>( ~/repo/sites/wiki/public/images/Kulinar '<C-R>%')<LEFT><BS><LEFT><BS><BS><BS><ESC>^/'<CR><LEFT>i/
autocmd FileType markdown :map  <localLeader>di :%s@(.*/images@(/images@<CR> :nohlsearch<CR>
autocmd FileType markdown :nmap <localLeader>tt o<CR>**Источник**:<Space>
autocmd FileType markdown :nmap <localLeader>tn ggi# <C-R>%<BS><BS><CR><ESC>
autocmd FileType markdown :vmap <localLeader>` :s@\%V\(.*\)\%V@`\1`@ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :vmap <localLeader>[ :s@\%V\(.*\)\%V@[\1]()@ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :nmap <localLeader>tv ^i**Видео**:<CR><CR><div class="youtube" id="" style="width: 560px; height: 315px;"></div><CR><ESC>
" }}}
" Keymapping {{{
" Set Leader and LoalLeader {{{
let mapleader="\\"       " change leader key to '\'
let maplocalleader=","  " change local leader key to ','
" }}}
" F2 - Write buffer {{{
let g:go_fmt_command = "goimports"
map <F2> :confirm w<CR>
map! <F2> <Esc>:confirm w<CR>
" }}}
" F3 - Exit buffer {{{
map <F3> :confirm q<CR>
map! <F3> <Esc>:confirm q<CR>
" }}}
" F5 - Toogle number {{{
map  <F5> :set number!<CR>
map! <Esc><F5> :set number!<CR>
" }}}
" F6 - set list toogle {{{
map  <F6> :set list!<CR>
map! <F6> <Esc>:set list!<CR>
" }}}
" F29 - pastetoogle {{{
set pastetoggle=<f29>
execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>
" }}}
" <C-L> to clear the highlighting of :set hlsearch. {{{
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
" }}}
" Test key {{{
map <F12> :echo 'Test OK'<CR>
" }}}
" i_CTRL-U - отмена изменений в INSERT Mode {{{
inoremap <C-U> <C-G>u<C-U>
" }}}
" v_< & v_> - Tab in VISUAL Mode {{{
vmap < <gv
vmap > >gv
" }}}
" n_CR & n_Space - New line and Space in NORMAL Mode {{{
nmap <Enter> i<CR><Esc>
nmap <Space> i<Space><Esc>
" }}}
" <Leader>bg - Toogle background {{{
nnoremap <Leader>bg :Togbg<CR>
vnoremap <Esc><Leader>bg :Togbg<CR>
" }}}
" <Leader>w - Write buffer {{{
map <buffer> <Leader>w :confirm w<CR>
map! <buffer> <Leader>w <Esc>:confirm w<CR>
" }}}
" <Leader>q - Exit buffer {{{
map <buffer> <Leader>q :confirm q<CR>
map! <buffer> <Leader>q <Esc>:confirm q<CR>
" }}}
" <CTRL-T> - New tabs {{{
map <C-t> :tabnew<CR>
" }}}
" <Leader>vr - Edit $MYVIMRC {{{
map <Leader>vr :tabnew $MYVIMRC<CR>
map! <Esc><Leader>vr :tabnew $MYVIMRC<CR>
" }}}
" }}}

" vim:foldmethod=marker
