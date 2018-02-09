"                  _ __ __   _(_)_ __ ___  _ __ ___
"                 | '_  \ \ / / | '_ ` _ \| '__/ __|
"                 | | | |\ V /| | | | | | | | | (__
"                 |_| |_| \_/ |_|_| |_| |_|_|  \___|
"
" Author: Serg Tatarnikov <sergeytat@gmail.com>
" Source: http://github.com/sergtat/dotfiles
"
" Maps Table {{{
" }}}
" Set compatibilites plugins {{{
" Put plugins and dictionaries in this dir
let nvimDir = '$XDG_CONFIG_HOME/nvim'
language ru_RU.UTF-8    " Solve some plugins incompatibilities
set encoding=utf-8
" if &term =~ "xterm" || &term =~ "screen"
  set t_Co=256
  " if has("terminfo")
  "   let &t_Sf=nr2char(27).'[3%p1%dm'
  "   let &t_Sb=nr2char(27).'[4%p1%dm'
  " else
  "   let &t_Sf=nr2char(27).'[3%dm'
  "   let &t_Sb=nr2char(27).'[4%dm'
  " endif
" endif
" }}}
" dein begin {{{
if (!isdirectory(expand("$XDG_CONFIG_HOME/nvim/dein/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $XDG_CONFIG_HOME/nvim/dein/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $XDG_CONFIG_HOME/nvim/dein/repos/github.com/Shougo/dein.vim"))
endif
if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.config/nvim/dein'))
  call dein#begin(expand('~/.config/nvim/dein'))
" }}}
" PLUGINS {{{
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add ('mhinz/vim-startify')
  call dein#add ('morhetz/gruvbox')
  call dein#add ('bling/vim-airline')
  call dein#add ('vim-airline/vim-airline-themes')
  if has("gui_running")
    call dein#add ('lyokha/vim-xkbswitch')
  endif
  call dein#add ('othree/eregex.vim', {'on_func': 'eregex#toggle'})
  call dein#add ('vim-scripts/TaskList.vim')
  call dein#add ('Shougo/neosnippet.vim')
  call dein#add ('Shougo/neosnippet-snippets')
  call dein#add ('honza/vim-snippets')
  call dein#add ('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
  call dein#add ('fholgado/minibufexpl.vim')
  call dein#add ('majutsushi/tagbar')
  call dein#add ('jiangmiao/auto-pairs')
  call dein#add ('tpope/vim-repeat')
  call dein#add ('tpope/vim-surround')
  call dein#add ('tpope/vim-rsi')
  call dein#add ('tpope/vim-commentary')
  call dein#add ('Keithbsmiley/investigate.vim')
  call dein#add ('triglav/vim-visual-increment')
  call dein#add ('AndrewRadev/switch.vim')
  call dein#add ('sergtat/vim-numbered')
  call dein#add ('sergtat/increment.vim')
  call dein#add ('godlygeek/tabular')
  call dein#add ('dhruvasagar/vim-table-mode')
  call dein#add ('subosito/vim-translator')
  call dein#add ('gabrielelana/vim-markdown', {'on_ft': 'markdown'})
  call dein#add ('sergtat/vim-markdown-stuff', {'on_ft': 'markdown'})
  call dein#add ('kchmck/vim-coffee-script', {'on_ft': 'coffee'})
  call dein#add ('posva/vim-vue', {'on_ft': 'vue'})
  call dein#add ('ap/vim-css-color', {'on_ft': 'css'})
  call dein#add ('scrooloose/syntastic')
  call dein#add ('gentoo/gentoo-syntax')
" }}}
" dein end {{{
call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" }}}
" PLUGINS Setup {{{
let g:deoplete#enable_at_startup = 1
" neosnippet {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}}
" vim-airline {{{
let g:airline_theme='powerlineish'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
" }}}
" vim-xkbswitch {{{
if has("gui_running")
  let g:XkbSwitchEnabled = 1
  let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
  let g:XkbSwitchNLayout = 'us'
endif
" }}}
" mhinz/vim-startify {{{
let g:startify_list_order = [
  \ ['   My most recently used files'],
  \ 'files',
  \ ['   My most recently used files in the current directory:'],
  \ 'dir',
  \ ['   These are my sessions:'],
  \ 'sessions',
  \ ['   These are my bookmarks:'],
  \ 'bookmarks',
  \ ]
let g:startify_bookmarks = [ {'v': '~/.vim/vimrc'}, {'z': '~/.zshrc'}, {'w': '~/repo/wiki/pages/'}]
" }}}
" auto-pairs {{{
let g:AutoPairsFlyMode = 1
" }}}
" investigate.vim {{{
nnoremap <F1> :call investigate#Investigate()<CR>
" }}}
" tpope/vim-commentary {{{
set commentstring=#%s
" }}}
" switch yes/no {{{
let g:switch_mapping = "-"
let g:switch_custom_definitions =
    \ [
    \   ['-', '—']
    \ ]
" }}}
" vim-translator {{{
let g:goog_user_conf = {'langpair':'en|ru','cmd':'node','v_key':'T'}
" }}}
" Syntax {{{
" MarkDown {{{
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript=js']
let g:markdown_include_jekyll_support = 1
" }}}
" Coffee {{{
au! BufRead,BufNewFile *.coffee set filetype=coffee
" }}}
" JSON {{{
au! BufRead,BufNewFile *.json set filetype=json
" }}}
" }}}
" END PLUGINS Setup }}}
" VIM Setup {{{
" Disable Uganda children {{{
set shortmess+=I
" }}}
" Set mouse {{{
set mouse=a
set mousetime=200
" }}}
" Colorscheme {{{
set background=dark            " set a dark background
if &term == "linux"
    " colorscheme solarized
    colorscheme peachpuff
else
    colorscheme gruvbox
endif
highlight Comment ctermbg=235 ctermfg=lightgreen cterm=italic gui=italic
highlight htmlItalic cterm=Italic term=italic gui=italic
highlight htmlBoldItalic cterm=BoldItalic term=BoldItalic gui=BoldItalic
highlight markdownItalic cterm=Italic term=italic gui=italic
highlight markdownBoldItalic cterm=BoldItalic term=BoldItalic gui=BoldItalic
" Toggle Background Function
function! ToggleBackground()
if (&background=='dark')
    set background=light
else
    set background=dark
endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <Leader>bg :Togbg<CR>
vnoremap <Esc><Leader>bg :Togbg<CR>
" }}}
" Language & keymap {{{
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set helpheight=100
set helplang=ru,en
language messages C
" }}}
" <Leader> & <LocalLeader> mapping {{{
let mapleader=','
" }}}
" Basic options {{{
" Use :help 'option' to see the documentation for the given option.
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set linebreak
set showbreak='\'
set wrap
set textwidth=0

set laststatus=2
set ruler
set showcmd
set wildmenu
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file

if !&scrolloff
  set scrolloff=5
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

if &shell =~# 'zsh$'
  set shell=/bin/bash
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=256
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>
" }}}
" Persistent Undo {{{
" Keep undo history across sessions by storing it in a file
if v:version >= 703
  if has("persistent_undo")
    let myUndoDir = expand(nvimDir . '/undo')
    " Create dirs
    " call system('mkdir ' . nvimDir)
    " call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set history=64
    set undofile
    set undolevels=1000
    set undoreload=10000
  endif
endif
" }}}
" Indent {{{
set autoindent
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
" }}}
" set filetypes {{{
" set formatoptions {{{
if has("autocmd")
  filetype on
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=2
  autocmd FileType json set expandtab
  autocmd FileType json set conceallevel=0
  autocmd FileType json set foldmethod=syntax nofoldenable
  autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
  autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noet
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 et
  autocmd FileType html setlocal ts=2 sts=2 sw=2 et wrap
  autocmd FileType xhtml setlocal ts=2 sts=2 sw=2 noet wrap
  autocmd FileType xml setlocal ts=2 sts=2 sw=2 noet wrap
  autocmd FileType css setlocal ts=2 sts=2 sw=2 et
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 et
  autocmd FileType apache setlocal ts=2 sts=2 sw=2 noet
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
  autocmd FileType markdown setlocal ts=2 sts=2 sw=2 et wrap
  autocmd FileType markdown setlocal conceallevel=0
endif
" }}}
" MARKDOWN {{{
" syn region markdownBoldItalic matchgroup=markdownInlineDelimiter
"   \ start="\%(\s\|_\|^\)\@<=_\*\*\%(\s\|\*\|$\)\@!" end="\%(\s\|\*\)\@<!\*\*_"
"   \ contains=@markdownInline
" syn region markdownBoldItalic matchgroup=markdownInlineDelimiter
"   \ start="\%(\s\|\*\|^\)\@<=\*__\%(\s\|_\|$\)\@!" end="\%(\s\|_\)\@<!__\*"
"   \ contains=@markdownInline

autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
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
autocmd FileType markdown :nmap <localLeader>` :s@\(.*\)@```\r\1\r```@ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :vmap <localLeader>` :\<,\>s@@`\1`@<Enter>
autocmd FileType markdown :nnoremap <localLeader>- :s/^\s*/- /<CR> :nohlsearch<CR>
autocmd FileType markdown :vnoremap <localLeader>- :s/^\s*/- /<CR> :nohlsearch<CR>
autocmd FileType markdown :nmap <localLeader>> :s/^\s*/> / <CR> :nohlsearch <CR>
autocmd FileType markdown :vmap <localLeader>> :s/^\s*/> / <CR> :nohlsearch <CR>
autocmd FileType markdown :vmap <localLeader>n :s@^\s*@1. @<CR> gv :Numbered<CR> :nohlsearch<CR>
autocmd FileType markdown :nmap <localLeader>ti ^i![<C-R>%]<LEFT><BS><BS><BS><RIGHT>( ~/repo/sites/wiki/public/images/Kulinar '<C-R>%')<LEFT><BS><LEFT><BS><BS><BS><ESC>^/'<CR><LEFT>i/
autocmd FileType markdown :map  <localLeader>di :%s@(.*/images@(/images@<CR> :nohlsearch<CR>
autocmd FileType markdown :map  <localLeader>si "iyy
autocmd FileType markdown :map  <localLeader>gi "ip^<C-a>"iyy^
autocmd FileType markdown :nmap <localLeader>tt o<CR>**Источник**:<Space>
autocmd FileType markdown :nmap <localLeader>tn ggi# <C-R>%<BS><BS><CR><CR><ESC>
autocmd FileType markdown :vmap <localLeader>` :s@\%V\(.*\)\%V@`\1`@ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :vmap <localLeader>[ :s@\%V\(.*\)\%V@[\1]()@ <Enter> :nohlsearch <Enter>
autocmd FileType markdown :nmap <localLeader>y ^i**Видео**:<CR><CR><div class="youtube" id="" style="width: 560px; height: 315px;"></div><CR><ESC>
autocmd FileType markdown let g:airline#extensions#whitespace#enabled = 0

" }}}
" }}}
" Line number {{{
set number
set numberwidth=4
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
" }}}
" AutoPaste mode {{{
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
set pastetoggle=<Esc>[201~
set paste
return ""
endfunction
" }}}
" Show hidden chars {{{
nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
" }}}
" Maps {{{
set confirm
map  <F2> :w<CR>
map! <F2> <Esc>:w<CR>
map  <F3> :q<CR>
map! <F3> <Esc>:q<CR>
nmap <F8> :TagbarToggle<CR>
map <F9> :NERDTreeToggle<CR>
vmap < <gv
vmap > >gv
nmap <Enter> i<CR><Esc>
nmap <Space> i<Space><Esc>
" Tabs {{{
map <C-t> :tabnew<CR>
if &term == "linux"
nnoremap L gt
nnoremap H gT
else
nnoremap Oc gt
nnoremap Od gT
endif
" }}}
" }}}
" Edit & autoload configuration when this file changes ($MYIMRC) {{{
map <Leader>vr :tabnew $MYVIMRC<CR>
map! <Esc><Leader>vr :tabnew $MYVIMRC<CR>
augroup reload_vimrc
autocmd!
autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC | AirlineRefresh
autocmd! BufWritePost *.vim nested source $MYVIMRC | AirlineRefresh
augroup END
" }}}
" My Function {{{
let g:bufcleaner_max_save = 2

command! -bar -nargs=? CleanBuffers call s:cleanBuffers(<f-args>)
function! s:cleanBuffers(...) abort
let force = a:0 >= 1 && a:1 ==# '-f' ? 1 : 0
redir => bufs
silent! buffers
redir END

let hidden = []
for buf in map(split(bufs, '\n'), 'split(v:val)')
let bufnr = buf[0] + 0
let flags = matchstr(join(buf[1:]), '^.*\ze\s\+"')
let mod = substitute(flags, '\s*', '', 'g')
let hide = mod ==# 'h' || mod ==# 'h+'
  \ && (force || input(printf("\n%s not saved.\nDelete anyway? [Y]es, (N)o: ",
  \ bufname(bufnr))) =~? '^y\%[es]$')
if hide
  call add(hidden, bufnr)
endif
endfor

let saved = get(g:, 'bufcleaner_max_save', 2)
let target = len(hidden) > saved ? join(hidden[0:-saved-1], ' ') : ''
if !empty(target)
silent! execute 'bwipeout!' target
endif
endfunction

augroup buffer-cleaner
autocmd!
autocmd BufHidden * CleanBuffers
augroup END

" Autoexecute scripts
" function ModeChange()
"   if getline(1) =~ "^#!"
"     if getline(1) =~ "bin/"
"       silent !chmod a+x <afile>
"     endif
"   endif
" endfunction
" au BufWritePost * call ModeChange()

" }}}
" END VIM SETUP }}}
" ABBREVIATE {{{
iab bb **Ингридиенты**<CR>
iab ии **Ингридиенты**<CR>
iab gg **Приготовление**<CR>
iab пп **Приготовление**<CR>
" }}}
" TODO {{{
" Number List
" :let i=1 | '<,'>g/^/ s//\=i . ". "/ | let i+=1 | nohlsearch
"		or
" Select your lines in visual mode with: V, then type:
" :'<,'>s/^\s*\zs/\=(line('.') - line("'<")+1).'. '
" Which is easy to put in a command:
" command! -nargs=0 -range=% Number <line1>,<line2>s/^\s*\zs/\=(line('.') - <line1>+1).'. '
" }}}

" vim:foldmethod=marker
