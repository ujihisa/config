if !has('gui') " {{{
  finish
endif
" }}}
" neobundle {{{
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vimbundles/neobundle.vim
endif

call neobundle#begin(expand('~/.vimbundles'))

let g:neobundle#enable_name_conversion = 1
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neobundle-vim-recipes'
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/neocomplete', {'depends': [
      \ 'Shougo/neoinclude.vim',
      \ 'Shougo/neco-syntax',
      \ 'Shougo/neco-vim',
      \ 'Shougo/neopairs.vim']}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/tabpagebuffer.vim'
if has('mac')
  call neobundle#local("~/.vimbundles2", {},
        \ ['vimproc'])
else
  NeoBundle 'Shougo/vimproc', {'build': {
        \     'windows': 'tools\\update-dll-mingw',
        \     'cygwin': 'make -f make_cygwin.mak',
        \     'mac': 'make -f make_mac.mak',
        \     'linux': 'make',
        \     'unix': 'gmake'}}
endif
" NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets', {'depends': 'Shougo/neosnippet'}
NeoBundle 'Shougo/vesting'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'eagletmt/ghcmod-vim'
" NeoBundle 'git://gist.github.com/187578.git', {'directory': 'h2u_white'}
NeoBundle 'thinca/vim-ft-clojure'
NeoBundle 'kana/vim-tabpagecd'
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'veloce/vim-aldmeris'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-poslist'
NeoBundle 'trapd00r/neverland-vim-theme'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'thinca/vim-showtime'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'chikatoike/concealedyank.vim'
NeoBundle 'ujihisa/vimshell-ssh'
" NeoBundle 'pasela/unite-webcolorname'
" NeoBundle 'vim-scripts/IndentAnything'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'vim-scripts/zenesque.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kossnocorp/perfect.vim'
NeoBundle 'ujihisa/tabpagecolorscheme'
" NeoBundle 'fsouza/go.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-scripts/groovyindent'
NeoBundle 'kana/vim-textobj-syntax', {'depends': 'kana/vim-textobj-user'}
NeoBundle 'basyura/J6uil.vim'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'vim-scripts/Colour-Sampler-Pack'
" NeoBundleLazy 'AndrewRadev/switch.vim', {
"       \ 'autoload': {'commands': ['Switch']}}
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
      \ 'autoload': {'mappings': ['gS', 'gJ']}}
NeoBundle 'Pychimp/vim-luna'
"NeoBundle 'BirdseyeSoftware/tracker.vim'
" NeoBundle 'KamunagiChiduru/unite-javaimport'
NeoBundle 'git@github.com:ujihisa/unite-ruby-require.vim.git'
NeoBundle 'osyo-manga/jplus'
" NeoBundle 'osyo-manga/snowdrop'
" let g:snowdrop#libclang_directory = '/usr/lib64'
" let g:snowdrop#libclang#default_binding = "python_interpreter"
" NeoBundle 'rbtnn/puyo.vim'
NeoBundle 'deris/rengbang'
" NeoBundle 'thinca/vim-portal'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'lambdalisue/vim-gita'

NeoBundle 'mopp/autodirmake.vim'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
" NeoBundleLazy 'lambdalisue/vim-gista', {
"       \ 'autoload': {
"       \    'commands': ['Gista'],
"       \    'mappings': '<Plug>(gista-',
"       \    'unite_sources': 'gista'}}
NeoBundle 'vim-scripts/haskell.vim'
NeoBundle 'mrkn/mrkn256.vim', 'light_background'
NeoBundle 'git@github.com:ujihisa/nclipper.vim.git'
" NeoBundle 'ujihisa/quicklearn'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'vim-scripts/Rainbow-Parenthsis-Bundle'
NeoBundle 'shiracha/shiracha-vim'
NeoBundle 'rhysd/textobj-wiw', {'depends': 'kana/vim-textobj-user'}
" NeoBundle 'terryma/vim-expand-region'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-equery'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'ujihisa/unite-gem'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundleLazy 'thinca/vim-painter', {
      \ 'autoload': {
      \   'commands': 'PainterStart',
      \ }}
NeoBundleLazy 'Shougo/javacomplete'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'ujihisa/vimport'
NeoBundle 'leafo/moonscript-vim'
NeoBundle 'tyru/caw.vim'
NeoBundle 'ujihisa/ft-cmake'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundleLazy 'vim-jp/cpp-vim', {
      \ 'autoload': {'filetypes': 'cpp'}}
NeoBundle 'ujihisa/unite-include-reversed'
NeoBundle 'itchyny/calendar.vim'
" NeoBundle 'kovisoft/slimv'
NeoBundle 'guns/vim-sexp'
NeoBundle 'Shougo/neomru.vim', {
      \ 'depends': [
      \   'Shougo/unite.vim']}
NeoBundle 'jimenezrick/vimerl'
" NeoBundle 'thinca/vim-threes'
NeoBundle 'sickill/vim-monokai'
" NeoBundle 'osyo-manga/vim-brightest'
NeoBundle 'itchyny/vim-cursorword'
NeoBundle 'ujihisa/neoclojure.vim'
" NeoBundle 'ujihisa/ft-mongo.vim'
call neobundle#local("~/.vimbundles", {},
      \ ['ft-mongo', 'metaffer', 'neochat.vim'])
NeoBundle 'chase/vim-ansible-yaml'
" NeoBundle 'rbtnn/mario.vim', {
"       \ 'depends': [
"       \   'rbtnn/game_engine.vim'] }
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'kana/vim-operator-replace', {
      \ 'depends': [
      \   'kana/vim-operator-user'] }
NeoBundle 'syngan/vim-vimlint', {
      \ 'depends': 'ynkdir/vim-vimlparser'}
NeoBundle 'cohama/agit.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/vim-asterisk'
NeoBundle 'thinca/vim-themis'
" NeoBundleLazy 'haya14busa/incsearch.vim', {
"       \   'autoload': {
"       \     'mappings': ['<Plug>(incsearch-']}}
NeoBundle 'kana/vim-altr'

call neobundle#end()
" call neobundle#local("~/.vimbundles", {})

filetype plugin indent on

" }}}
" augroup ujihisa-vimrc {{{
augroup ujihisa-vimrc
  autocmd!
augroup END
" }}}
" g:V {{{
if !has_key(g:, 'V')
  let g:V = vital#of('vital')
  call extend(g:V, g:V.import('Prelude'))
endif
" }}}
" settings {{{
set encoding=utf-8
set termencoding=utf-8
set fileformats=unix,dos,mac
set ignorecase
set smartcase
set number
set ruler
set expandtab
set hlsearch
set splitbelow
set splitright
set switchbuf=useopen
set background=dark
syntax enable
set wildmode=list:longest
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set hidden
set autoread
set title
set backspace=indent,eol,start
set modeline
set t_Co=256
set cmdheight=3
" http://vim-users.jp/2009/06/hack32/
set directory-=.
" http://vim-users.jp/2010/07/hack162/
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup ujihisa-vimrc
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif
set equalalways
set eadirection=ver
set updatetime=500
"set scrolljump=10
set timeoutlen=300
set synmaxcol=700
set history=1000
set viminfo+=:1000
set display=lastline

setglobal cindent
setglobal cinkeys-=:

setglobal shiftwidth=2
setglobal tabstop=2

" Some ftplugin sets tw=78 is tw is 0. Set this to extremely high
" so that those ftplugins give up.
"   bad e.g. /usr/share/vim/vim74/ftplugin/gitcommit.vim
set textwidth=9999999999999

set nobackup
set spelllang=en,cjk

" scala
" set wildignore+=*/target/*
"   disabled because this also disables <C-x><C-f> :(

" }}}
" landscape / portrait detect {{{
function! s:is_display_landscape()
  return &lines * 2 < &columns
endfunction
" }}}
" mappings {{{

let g:incsearch#auto_nohlsearch = 1
if g:V.is_mac()
  let g:transparency = 10
  " for MacVim's bug
  nnoremap <Esc><Esc> :<C-u>set nohlsearch<Cr>:let &transparency = g:transparency<Cr><C-l>
else
  " incsearch
  " nnoremap <Esc><Esc> :<C-u>set nohlsearch<Cr>
end

" insearch uses them
" nnoremap / :<C-u>set hlsearch<Return>/
" nnoremap ? :<C-u>set hlsearch<Return>?
" nnoremap * :<C-u>set hlsearch<Return>*
" nnoremap # :<C-u>set hlsearch<Return>#

command! -nargs=0 Amp execute 'normal!' printf('/\<%s\><Cr>', expand('<cword>'))
nnoremap & :<C-u>set hlsearch<Return>:Amp<Cr>

vmap p <Plug>(operator-replace)

nnoremap -- :<C-u>e %:h<Cr>

omap <Space>p %
omap <M-9> %
nmap <Space>p %
nmap <M-9> %
vmap <Space>p %
vmap <M-9> %

nnoremap vv <C-v>
"nnoremap ]p p`[=`]

nnoremap sh <C-w>h:call <SID>good_width()<Cr>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l:call <SID>good_width()<Cr>
nnoremap H <C-w>H:call <SID>good_width()<Cr>
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap L <C-w>L:call <SID>good_width()<Cr>
function! s:good_width()
  let size = 84
  if winwidth(0) < size
    execute "vertical resize" size
  endif
endfunction

nnoremap q <NOP>
nnoremap Q q

" for plugins rewrite j/k
nnoremap <C-j> j
nnoremap <C-k> k

nnoremap <Space>w :<C-u>write<Cr>
nnoremap <Space>q :<C-u>quit<Cr>
nnoremap <Space>Q :<C-u>quit!<Cr>
nnoremap <Space>. :<C-u>OpenVimrcTab<Cr>
"nnoremap <Space>] <C-w>]
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" undoable
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

inoremap <M-BS> <C-w>
cnoremap <M-BS> <C-w>

"nnoremap <Space>a  <Nop>
nnoremap <Space>aa  :<C-u>tabnew<CR>:pwd<Cr>:VimShell<Cr>
nnoremap <Space>av  :<C-u>tabnew<CR>:cd ~/.vimbundles<Cr>:VimShell<Cr>
nnoremap <Space>an  :<C-u>tabnew<CR>:cd ~/<Cr>:VimShell<Cr>
"nnoremap <Space>ac  :<C-u>tabclose<CR>
nnoremap <silent> <Space>aj  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
" nnoremap <silent> <D-j>      :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
nnoremap <silent> <M-j>      :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
inoremap <silent> <M-j>      <Esc>:execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
nnoremap <Space>ak  gT
" nnoremap <D-k>  gT
nnoremap <M-k>  gT
inoremap <M-k>  <Esc>gT

nnoremap <M-[> :<C-u>e #<Cr>

nnoremap <M-n> :<C-u>NeoSnippetEdit -split<Cr>

nnoremap Y y$
nnoremap co zo
nnoremap cc zc


" use mark `m for <M-a>, and <M-c>
nnoremap <M-a> mmggVG
vnoremap <M-c> "+yG`m

"inoremap <expr> k smartchr#one_of('k', "\<Esc>")

" memo:
"   MacBook Pro Apple Keyboard (both built-in and bluetooth) Gentoo (with xmodmap?)
"     Command = <A-*> and <M-*>


" inoremap <expr><Tab> TabOrCompl()
" function! TabOrCompl()
"   return (col('.') == 1 || matchstr(getline('.'), '.', col('.')-2) == "\t") ? "\<C-q>\<Tab>" : "\<C-p>"
" endfunction

nnoremap <Space>s q:set filetype=
nnoremap <Space>S q:set filetype=
nnoremap <Space>sr :<C-u>set filetype=ruby<Cr>
"nnoremap <Space>sm :<C-u>set filetype=markdown<Cr>
"nnoremap <Space>sh :<C-u>set filetype=haskell<Cr>
"nnoremap <Space>sj :<C-u>set filetype=javascript<Cr>
nnoremap <Space>spp :<C-u>set filetype=php<Cr>i<?php<Cr>error_reporting(E_ERROR \| E_WARNING \| E_PARSE \| E_NOTICE \| E_STRICT);<Cr><esc>
"nnoremap <Space>shs :<C-u>set filetype=haskell<Cr>i{-# LANGUAGE OverloadedStrings #-}<Cr>import qualified Data.Text as T<Cr>import qualified Data.Text.IO as T<Cr><Cr>main = do<Cr>print $ <Esc>
nnoremap <Space>shs :<C-u>set filetype=haskell<Cr>imain = do<Cr>print $<Esc>
nnoremap <Space>ssl :<C-u>set filetype=scala<Cr>
nnoremap <Space>scl :<C-u>set filetype=clojure<Cr>
nnoremap <Space>ssh :<C-u>set filetype=sh<Cr>

nnoremap <space>b <C-w>100+

nnoremap <Space>I $i
"nnoremap <Space>C $C
nnoremap X ^x
nnoremap cp Pjdd

" nnoremap // /^
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

nnoremap <Space>n :<C-u>new<Cr>
nnoremap <Space>N :<C-u>call <SID>new_with_the_filetype()<Cr>
function! s:new_with_the_filetype()
  let f = &filetype
  new
  let &filetype = f
endfunction

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" paste in insert mode is <C-o>p while paste in command-line mode is <C-r>".
" it's confusing.
cnoremap <C-o>p <C-r>"
" for speedup
nnoremap /<C-o>p /<C-r>"

" filetype specific key mappings
silent nnoremap <space>M :<C-u>echo 'space-M Not defined'<Cr>
silent nnoremap <space>m :<C-u>echo 'space-m Not defined'<Cr>

" <C-g> is to swap visual mode and select mode. <C-g> is difficult to type.
" Use Alt-g instead
vnoremap <M-g>g <C-g>
snoremap <M-g>g <C-g>

nnoremap <M-g>f <C-w><C-f>

nmap <M-o> <Plug>(openbrowser-open)
vmap <M-o> <Plug>(openbrowser-open)

" yank without newlines
vnoremap gy y:<C-u>let @" = substitute(@", "\n\s\*", ' ', 'g')<Cr>

" go insert new line below directly from insert mode
inoremap <M-o> <Esc>o<Esc>

" }}}
" kana/vim-smartinput {{{

" call smartinput#clear_rules()
let g:smartinput_no_default_key_mappings = 1

function! s:vimrc_smartinput_rules_add(x, ys) abort
  call smartinput#map_to_trigger('i', a:x[0], a:x[0], a:x[0])
  call smartinput#map_to_trigger('i', a:x[1], a:x[1], a:x[1])
  for y in a:ys
    call smartinput#define_rule(y)
  endfor
endfunction
" excerpt from smartinput itself
call s:vimrc_smartinput_rules_add('()', [
\   {'at': '\%#', 'char': '(', 'input': '()<Left>'},
\   {'at': '\%#\_s*)', 'char': ')', 'input': '<C-r>=smartinput#_leave_block('')'')<Enter><Right>'},
\   {'at': '(\%#)', 'char': '<BS>', 'input': '<BS><Del>'},
\   {'at': '()\%#', 'char': '<BS>', 'input': '<BS><BS>'},
\   {'at': '\\\%#', 'char': '(', 'input': '('},
\   {'at': '(\%#)', 'char': '<Enter>', 'input': '<Enter><Enter><Up><Esc>"_S'},
\ ])
call s:vimrc_smartinput_rules_add('[]', [
\   {'at': '\%#', 'char': '[', 'input': '[]<Left>'},
\   {'at': '\%#\_s*\]', 'char': ']', 'input': '<C-r>=smartinput#_leave_block('']'')<Enter><Right>'},
\   {'at': '\[\%#\]', 'char': '<BS>', 'input': '<BS><Del>'},
\   {'at': '\[\]\%#', 'char': '<BS>', 'input': '<BS><BS>'},
\   {'at': '\\\%#', 'char': '[', 'input': '['},
\ ])
call s:vimrc_smartinput_rules_add('{}', [
\   {'at': '\%#', 'char': '{', 'input': '{}<Left>'},
\   {'at': '\%#\_s*}', 'char': '}', 'input': '<C-r>=smartinput#_leave_block(''}'')<Enter><Right>'},
\   {'at': '{\%#}', 'char': '<BS>', 'input': '<BS><Del>'},
\   {'at': '{}\%#', 'char': '<BS>', 'input': '<BS><BS>'},
\   {'at': '\\\%#', 'char': '{', 'input': '{'},
\   {'at': '{\%#}', 'char': '<Enter>', 'input': '<Enter><Enter><Up><Esc>"_S'},
\ ])


call smartinput_endwise#define_default_rules()

call smartinput#map_to_trigger('i', '<Plug>(vimrc-smartinput-bs)', '<Bs>', '<Bs>')

" jlj = <Esc>
call smartinput#map_to_trigger('i', 'j', 'j', 'j')
call smartinput#define_rule({
      \   'at': 'jl\%#',
      \   'char': 'j',
      \   'input': '<BS><BS><Esc>'})

" uiu = ()
call smartinput#map_to_trigger('i', 'u', 'u', 'u')
call smartinput#define_rule({
      \   'at': 'ui\%#',
      \   'char': 'u',
      \   'input': '<BS><BS>()<Left>'})

" {{ in scala string literal = ${}
call smartinput#map_to_trigger('i', '{', '{', '{')
call smartinput#define_rule({
      \   'at': '{\%#}',
      \   'char': '{',
      \   'input': '<BS>${',
      \   'filetype': ['scala'],
      \   'syntax': ['String']})
call smartinput#define_rule({
      \   'at': '{\%#',
      \   'char': '{',
      \   'input': '<BS>${}<Left>',
      \   'filetype': ['scala'],
      \   'syntax': ['String']})
" {{ in clojure string literal = ~{}
call smartinput#define_rule({
      \   'at': '{\%#}',
      \   'char': '{',
      \   'input': '<BS>~{',
      \   'filetype': ['clojure'],
      \   'syntax': ['String']})
call smartinput#define_rule({
      \   'at': '{\%#',
      \   'char': '{',
      \   'input': '<BS>~{}<Left>',
      \   'filetype': ['clojure'],
      \   'syntax': ['String']})
" (( in clojure string literal = ~()
call smartinput#map_to_trigger('i', '(', '(', '(')
call smartinput#define_rule({
      \   'at': '(\%#)',
      \   'char': '(',
      \   'input': '<BS>~(',
      \   'filetype': ['clojure'],
      \   'syntax': ['String']})
call smartinput#define_rule({
      \   'at': '(\%#',
      \   'char': '(',
      \   'input': '<BS>~()<Left>',
      \   'filetype': ['clojure'],
      \   'syntax': ['String']})

" s: in c++ = std::
call smartinput#map_to_trigger('i', ':', ':', ':')
call smartinput#define_rule({
      \   'at': '\<s\%#',
      \   'char': ':',
      \   'input': 'td::',
      \   'filetype': ['cpp']})
      " \   'syntax': ['cBlock']
" std:: + : in c++ = s:
call smartinput#define_rule({
      \   'at': '\<std::\%#',
      \   'char': ':',
      \   'input': '<BS><BS><BS><BS>:',
      \   'filetype': ['cpp']})
      " \   'syntax': ['cBlock']})

" <Cr> in vimshell closes popup in advance.
call smartinput#map_to_trigger('i', '<Cr>', '<Cr>', '<Cr>')
call smartinput#define_rule({
      \   'at': '$\%#',
      \   'char': '<Cr>',
      \   'input': '<C-e><Cr>',
      \   'filetype': ['vimshell', 'int-*']})

" <Bs> in vimshell closes it when it's on the head
" call smartinput#map_to_trigger('i', '<Bs>', '<Bs>', '<Bs>')
" call smartinput#define_rule({
"       \   'at': '\%#',
"       \   'char': '<Bs>',
"       \   'input': '<Plug>(vimshell_another_delete_backward_char)',
"       \   'filetype': ['vimshell']})

"}}}
" = for completion and <bs> for cancel {{{
inoremap <expr> = pumvisible() ? "\<C-n>" : '='
inoremap <M-=> =

imap <expr> <BS> neocomplete#smart_close_popup() . "\<Plug>(vimrc-smartinput-bs)"

" }}}
" vimshell {{{
function! EmptyBufferP()
  return expand('%') ==# '' && !&modified
endfunction
"nnoremap <expr> <Space>v EmptyBufferP() ? ":<C-u>VimShell<Cr>" : ":<C-u>new<Cr>:VimShell<Cr>"
"nnoremap <expr> <Space>V EmptyBufferP() ? ":<C-u>VimShell<Cr>" : ":<C-u>vnew<Cr>:VimShell<Cr>"

"nmap <Space>V <Plug>(vimshell_split_switch)
"nmap <Space>v <Plug>(vimshell_switch)
nmap <Space>v <Plug>(vimshell_split_switch)
"nnoremap <Space>V :<C-u>VimShellCreate -split<Cr>

" close vimshell from anywhere
" nmap <space>V <Plug>(vimshell_split_switch)<Plug>(vimshell_hide)
nnoremap <space>V :<C-u>VimShellClose<Cr>

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
let g:vimshell_split_command = 'split'
let g:vimshell_scrollback_limit = 4000
let g:vimshell_interactive_update_time = 400
let g:vimshell_max_command_history = 100000 " default is 1000

augroup ujihisa-vimrc
  autocmd FileType vimshell call s:vimshell_local()
augroup END

function! s:vimshell_local()
  imap <buffer><expr> <BS>  pumvisible() ?
        \ "\<C-y>\<BS>" :
        \ "\<Plug>(vimshell_another_delete_backward_char)"
  " to use smartinput
  " iunmap <buffer> <Bs>

  nmap <buffer> j <Plug>(vimshell_next_prompt)
  nmap <buffer> k <Plug>(vimshell_previous_prompt)
  " deleting <Plug>(vimshell_delete_previous_output)
  nunmap <buffer> <C-k>
  nmap <buffer> <C-S-k> <Plug>(vimshell_delete_previous_output)
  inoremap <buffer> <expr><M-l>  unite#sources#vimshell_history#start_complete(!0)
endfunction

augroup ujihisa-vimrc
  autocmd FileType int-* call s:vimshell_iexe() " TODO
augroup END
function! s:vimshell_iexe()
  "imap <buffer> <BS>  <Plug>(vimshell_int_another_delete_backward_char)
  nmap <buffer> j <Plug>(vimshell_int_next_prompt)
  nmap <buffer> k <Plug>(vimshell_int_previous_prompt)
  inoremap <buffer> <expr><M-l>  unite#sources#vimshell_history#start_complete(!0)
endfunction

let g:vimshell_escape_colors = [
      \'#3c3c3c', '#ff6666', '#66ff66', '#ffd30a', '#1e95fd', '#ff13ff', '#1bc8c8', '#C0C0C0',
      \'#686868', '#ff6666', '#66ff66', '#ffd30a', '#6699ff', '#f820ff', '#4ae2e2', '#ffffff'
      \]
" }}}
" tag opens in a new window {{{
function! s:tagjump_in_new_window()
  execute "normal! \<C-w>\<C-]>"
  "http://d.hatena.ne.jp/thinca/20110202
  "UniteWithCursorWord -immediately -no-start-insert -auto-preview -default-action=split tag
endfunction

function! s:tagjump_or_cr()
  if bufname('%') == '[Command Line]' || &buftype == 'quickfix'
    execute "normal! \<Cr>"
  else
    execute "normal! \<C-]>"

    "http://d.hatena.ne.jp/thinca/20110202
    "UniteWithCursorWord -immediately -no-start-insert -auto-preview tag
  endif
endfunction

nnoremap <C-]> :<C-u>call <SID>tagjump_in_new_window()<Cr>
nnoremap <Cr> :<C-u>call <SID>tagjump_or_cr()<Cr>
" }}}
" unite-grep {{{
nnoremap sg :<C-u>Unite grep:. -default-action=split<Cr>
nnoremap sG :<C-u>execute 'Unite grep:.:-iR:' . expand('<cword>') . ' -default-action=split'<Cr>
" }}}
" {{{ thinca/poslist.vim
nmap <C-o> <Plug>(poslist-prev-pos)
nmap <C-i> <Plug>(poslist-next-pos)
vmap <C-o> <Plug>(poslist-prev-pos)
" }}}
" remote {{{
command! -nargs=1 RunOnVm !run_on_vm <args> %
" }}}
" Neocomplecache/Neocomplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 200

imap <M-l> <Plug>(neocomplete_start_unite_complete)
" see also
"   * snippets section

let g:neocomplete#skip_auto_completion_time = "" " disabling it

let g:necoghc_enable_detailed_browse = 1
let g:neocomplete#lock_iminsert = 1
" }}}
" thinca's local vimrc http://vim-users.jp/2009/12/hack112/ {{{
" Load settings for eacy location.
augroup ujihisa-vimrc
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" }}}
function! OpenVimrcTab() " {{{
  tabnew
  cd ~/git/config
  edit ~/git/config/_vimrc
endfunction

" }}}
" My commands {{{
command! -nargs=0 OpenVimrcTab call OpenVimrcTab()
command! -nargs=0 Ctags call Ctags()

function! Ctags()
  let cmdname = globpath(&rtp, 'plugin/vimproc.vim') != '' ? 'VimProcBang' : '!'
  execute cmdname 'ctags -R'
  NeoCompleteTagMakeCache
endfunction

" }}}
command! SplitNicely  call s:split_nicely() " {{{
function! s:split_nicely()
  if 80*2 * 15/16 <= winwidth(0)  " FIXME: threshold customization
    vsplit
  else
    split
  endif
endfunction

" }}}
" unite {{{
if globpath(&rtp, 'plugin/unite.vim') != ''
  nnoremap s <Nop>
  nnoremap sS :<C-u>Unite file_rec -default-action=split -direction=rightbelow<Cr>
  " nnoremap sS :<C-u>Unite file_rec/async:! -default-action=split -direction=rightbelow<Cr>
  nnoremap ss :<C-u>Unite file_rec/git file -default-action=split -direction=rightbelow -hide-source-names<Cr>
  nnoremap se :<C-u>Unite file_rec/async<Cr>
  nnoremap so :<C-u>Unite outline -auto-preview -buffer-name=outline<Cr>
  nnoremap sc :<C-u>Unite colorscheme font -auto-preview<Cr>
  nnoremap sf :<C-u>UniteWithBufferDir file_rec -default-action=split<Cr>
  nnoremap sm :<C-u>Unite file_mru -default-action=split<Cr>
  nnoremap sb :<C-u>Unite buffer -default-action=split<Cr>
  nnoremap sre :<C-u>Unite ref/man ref/hoogle ref/pydoc -default-action=split<Cr>
  nnoremap su :<C-u>Unite history/command source command<Cr>
  nnoremap sp :<C-u>Unite process -no-split -buffer-name=process<Cr>
  nnoremap sq :<C-u>UniteClose build<Cr>
  " nnoremap <space>R :<C-u>Unite quicklearn -immediately<Cr>
  "nnoremap <space>M :Unite -buffer-name=build -no-focus build::
  "nnoremap <space>m :<C-u>write<Cr>:Unite -buffer-name=build -no-focus build:<Cr>
endif
augroup ujihisa-vimrc
  autocmd GUIEnter *
        \ call unite#custom#profile('default', 'context', {
        \  'vertical': 1,
        \  'no_split': !s:is_display_landscape(),
        \  'start_insert': 1})
  autocmd VimResized *
        \ call unite#custom#profile('default', 'context', {
        \  'vertical': 1,
        \  'no_split': !s:is_display_landscape(),
        \  'start_insert': 1})
augroup END


" I wanted to simply refer the default ignore pattern with using g:unite_source_file_rec_ignore_pattern, but unite sets it lazily.
" here I force unite defining file_rec and referes the default value.
"let s:file_rec_ignore_pattern = (unite#sources#rec#define()[0]['ignore_pattern']) . '\|\$global\|\.class$\|\<target\>'
" added "lib_managed"
if 0
  let s:file_rec_ignore_pattern = (unite#sources#rec#define()[0]['ignore_pattern']) . '\|\$global\|\.class$\|\<target\>\|\<lib_managed\>'
  call unite#custom#source('file_rec', 'ignore_pattern', s:file_rec_ignore_pattern)
  call unite#custom#source('grep', 'ignore_pattern', s:file_rec_ignore_pattern)
else
  " let s:unite_file_rec_ignore_globs = unite#sources#rec#define()[0]['ignore_globs'] + ['**/target/**', 'lib_managed']
  let s:unite_file_rec_ignore_globs = ['**/target/**', 'lib_managed', '.vagrant/**']
  call unite#custom#source('file_rec', 'ignore_globs', s:unite_file_rec_ignore_globs)

  let s:unite_grep_ignore_globs = unite#sources#grep#define()['ignore_globs'] + ['**/target/**', 'lib_managed', '.vagrant']
  call unite#custom#source('grep', 'ignore_globs', s:unite_grep_ignore_globs)
endif

let g:unite_source_file_rec_max_cache_files = 9000

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore tags --ignore target'
  let g:unite_source_grep_recursive_opt = ''
endif

"let g:unite_quick_match_table = {
"      \'a' : 1, 's' : 2, 'd' : 3, 'f' : 4, 'g' : 5, 'h' : 6, 'j' : 7, 'k' : 8, 'l' : 9, ':' : 10,
"      \'q' : 11, 'w' : 12, 'e' : 13, 'r' : 14, 't' : 15, 'y' : 16, 'u' : 17, 'i' : 18, 'o' : 19, 'p' : 20,
"      \'1' : 21, '2' : 22, '3' : 23, '4' : 24, '5' : 25, '6' : 26, '7' : 27, '8' : 28, '9' : 29, '0' : 30,
"      \}
" in other words, it just swaps : and ;

let g:unite_source_process_enable_confirm = 0

function! s:unite_my_settings()
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! iunmap <buffer> <Up>
  silent! iunmap <buffer> <Down>

  silent! nunmap <buffer> <Space>

  " swapping q and Q
  nmap <buffer> Q <Plug>(unite_exit)
  nmap <buffer> q <Plug>(unite_all_exit)

  " overwrite p (preview) as print
  nmap <buffer> p <Plug>(unite_print_candidate)
endfunction

augroup ujihisa-vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
" }}}
" Big {{{
"
" ^big = Big
call smartinput#map_to_trigger('i', 'g', 'g', 'g')
call smartinput#define_rule({
      \   'at': '^bi\%#',
      \   'char': 'g',
      \   'input': '<BS><BS>Big',
      \   'filetype': ['vim']})

command! Big wincmd _ | wincmd |
" }}}
if has('mac') " {{{
  " Option+Arrow keys
  set <xRight>=OC
  set <xLeft>=OD
  set <xUp>=OA
  set <xDown>=OB
  nnoremap <xRight> <C-w>>
  nnoremap <xLeft> <C-w><LT>
  nnoremap <xUp> <C-w>+
  nnoremap <xDown> <C-w>-

  " Arrow keys
  nnoremap [C l
  nnoremap [D h
  nnoremap [A <C-b>
  nnoremap [B <C-f>
  " Shift+Arrow keys (actually I cannot use it on a terminal)
  nnoremap O2C :bn<Cr>
  nnoremap O2D :bp<Cr>
  nnoremap O2A i上<Esc>
  nnoremap O2B i下<Esc>
  " arrow and arrow keys
  nnoremap [B[B <C-w>j
  nnoremap [A[A <C-w>k
endif " }}}
augroup RubyTrunk " {{{
  autocmd!
  autocmd BufWinEnter,BufNewFile ~/git/ruby/*.c setl ts=8 noexpandtab
  autocmd BufWinEnter,BufNewFile ~/git/ruby/*.y setl ts=8 noexpandtab
  "autocmd BufWinEnter,BufNewFile ~/rubies/src/**/*.c setl ts=8 noexpandtab
augroup END
" }}}
" quickrun for thinca {{{
let g:quickrun_no_default_key_mappings = 0 " suspend to map <leader>r
nmap <Space>r <Plug>(quickrun)
vmap <Space>r <Plug>(quickrun)
nmap <Space>R <Plug>(quickrun-op)

let g:quickrun_config = {}
let g:quickrun_config._ = {'runner': 'vimproc', 'split': 'below'}

"let g:quickrun_config.coffee = {'command': 'coffee', 'exec': '%c -cpb %s'}
let g:quickrun_config.coffee = {'command': '~/node_modules/.bin/coffee', 'cmdopt': '-pb'}

let g:quickrun_config.asm = {'command': 'gcc', 'exec': ['gcc %s -o ./aaaaa', './aaaaa', 'rm ./aaaaa']}

" let g:quickrun_config.textile = {
"       \ 'command': 'redcloth',
"       \ 'tempfile': '%{tempname()}.textile',
"       \ 'exec': ['%c %s > %s:p:r.html', 'open %s:p:r.html', 'sleep 1', 'rm %s:p:r.html'] }

" let g:quickrun_config['R'] = {'command': 'R', 'exec': ['%c -s --no-save -f %s', ':%s/.\b//g']}

let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'browser'
      \ }

let g:quickrun_config.lua = {'type': 'lua/vim'}
let g:quickrun_config.javascript = {'type': 'javascript/nodejs'}

" let s:clojure_libs = split(glob('~/.m2/repository/org/clojure/core.*/*/*.jar'), "\n")
" let g:quickrun_config.clojure = {
"       \ 'type': 'clojure/concurrent_process',
"       \ 'command': printf(
"       \   'java -cp %s:/usr/share/clojure-1.6/lib/clojure.jar clojure.main',
"       \   join(s:clojure_libs, ':'))}
let g:quickrun_config.clojure = {
      \ 'runner': 'neoclojure', 'command': 'dummy',
      \ 'tempfile': '%{tempname()}.clj'}
      " \ 'unnamed_projdir': '/tmp/neoclojure-quickrun'}

" let g:quickrun_config.scala = {
"       \ 'cmdopt': g:quickrun#default_config.scala.cmdopt . ' -deprecation'}

" let g:quickrun_config.scala = {'type': 'scala/concurrent_process', 'command': 'scala-2.11'}
let g:quickrun_config.scala = {'type': 'scala/concurrent_process', 'command': 'sbt console'}

let g:quickrun_config.cpp = {
      \ 'type': 'cpp/clang++',
      \ 'cmdopt': '-std=c++11 -Wall -Wextra'}

let g:quickrun_config.jq = {
      \ 'cmdopt': '.'}

"     \ 'erlang': {
"     \   'command': 'escript',
"    +\   'exec': ['echo "#!escript\n%%%%! -smp enable -sname quickrun -mnesia debug verbose" > %s.tmp', 'cat %s >> %s.tmp', 'mv %s.tmp %s', '%c %s %a', ':call delete("%s.tmp")', ':call delete("%s")'],
"    +\   'tempfile': '{fnamemodify(tempname(), ":h")}/quickrun',
"     \ },

" }}}
" filetype aliases http://vim-users.jp/2010/04/hack138/ {{{
augroup FiletypeAliases
  autocmd!
  autocmd FileType md set filetype=markdown
  autocmd FileType js set filetype=javascript
  autocmd FileType cf set filetype=coffee
augroup END

" }}}
" for fugitive {{{
augroup vimrc-fugitive
  autocmd!
  autocmd FileType gitcommit setl nolist
augroup END

"let g:git_command_edit = 'rightbelow vnew'
"nnoremap <Space>gd :<C-u>GitDiff --no-prefix --cached<Enter>
nnoremap <Space>gd :<C-u>Gdiff<Cr>
nnoremap <Space>gD :<C-u>GitDiff --no-prefix<Enter> " motemen's
" nnoremap <Space>gs :<C-u>Gita status<Cr>
nnoremap <Space>gs :<C-u>Gstatus<Cr>
nnoremap <Space>gh :<C-u>call <SID>vimrc_git_show()<Cr>

function! s:vimrc_git_show()
  new
  VimProcRead git show
  normal! dd
  set filetype=git-log.git-diff
  nnoremap <buffer> q :<C-u>quit!<Cr>
  setl nomodifiable readonly
endfunction

"nnoremap <Space>gS :<C-u>Git submodule foreach git status<Enter>

"nnoremap <Space>gl :<C-u>GitLog<Enter>
"nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>

" if globpath(&rtp, 'plugin/shadow.vim') != ''
"   nnoremap <Space>ga :<C-u>call GitAddBoth()<Enter>
" else
"   nnoremap <Space>ga :<C-u>GitAdd<Enter>
" endif

nnoremap <silent> <Space>ga :<C-u>Gwrite<Cr>
nnoremap <Space>gc :<C-u>Gcommit --verbose<Cr>
"nnoremap <Space>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Space>gp :<C-u>Git push

command! FugitiveIsTerrible unlet b:git_dir | edit
" }}}
" html {{{
function! s:HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction
function! s:HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction
vnoremap <silent> <space>e :call <SID>HtmlEscape()<CR>
vnoremap <silent> <space>ue :call <SID>HtmlUnEscape()<CR>
" }}}
" kana's useful tab function {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction " }}}
" <space>ao move current buffer into a new tab. {{{
"nnoremap <silent> <Space>ao :<C-u>call <SID>move_window_into_tab_page(0)<Cr>
nnoremap <silent> <Space>ao <C-w>T
" }}}
" open lib and corresponding test at a new tab {{{
command! -nargs=1 Lib  call s:open_lib_and_corresponding_test(<f-args>)

function! s:open_lib_and_corresponding_test(fname)
  execute 'tabnew lib/' . a:fname . '.rb'
  execute 'vnew spec/' . a:fname . '_test.rb'
  execute "normal \<Plug>(quickrun)\<C-w>J\<C-w>7_"
endfunction " }}}
" gist.vim {{{
if g:V.is_mac()
  let g:gist_clip_command = 'pbcopy'
else
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" }}}
command! LeftSpace call s:left_space() " {{{
function! s:left_space()
  let bufname = printf('[leftspace:%s]', tabpagenr())
  let bufnr = bufnr(bufname)  " FIXME: escape.
  let winnr = bufwinnr(bufnr)

  if winnr == -1
    " create
    execute "topleft 20vnew " . bufname
    setlocal nomodifiable
    wincmd p
  else
    " destroy
    execute winnr "wincmd w"
    wincmd c
    wincmd p
  endif
endfunction
" }}}
" Say supports {{{
command! Say silent execute '!say "' . escape(getline('.'), '"') . '" &>/dev/null &'
augroup SayCurrentLine
  autocmd!
  autocmd FileType say nnoremap <buffer> j j:Say<Cr>
  autocmd FileType say nnoremap <buffer> k k:Say<Cr>
augroup END

" }}}
" Substitute all spaces for indentation to underlines {{{
"
" before:
"   def aaa
"     hi
"   end
" after:
"   def aaa
"   __hi
"   end
command! -nargs=0 LeadUnderscores %s/^\s*/\=repeat('_', strlen(submatch(0)))/g
" }}}
" Require secret password file {{{
if filereadable(expand('~/.vimrc_secret'))
  source ~/.vimrc_secret
endif
" This file should let following variables:
"   * g:lingr_vim_user
"   * g:lingr_vim_password
" }}}
" Rename (See Vim Hacks #17) {{{
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
" }}}
" mspec/rubyspec supports {{{
function! DoMspec()
  new
  read! /usr/bin/ruby ~/git/ruby-trunk/spec/mspec/bin/mspec -t ~/git/ruby-trunk/ruby19/bin/ruby #

  call append(line('$'), '--------------------------------------------------------------')
  normal G
  read! /usr/bin/ruby ~/git/ruby-trunk/spec/mspec/bin/mspec -t ~/rubies/bin/ruby191 #

  call append(line('$'), '--------------------------------------------------------------')
  normal G
  read! /usr/bin/ruby ~/git/ruby-trunk/spec/mspec/bin/mspec -t ~/rubies/bin/ruby187 #

  call append(line('$'), '--------------------------------------------------------------')
  normal G
  read! /usr/bin/ruby ~/git/ruby-trunk/spec/mspec/bin/mspec -t /opt/local/bin/ruby #

  call append(line('$'), '--------------------------------------------------------------')
  normal G
  read! /usr/bin/ruby ~/git/ruby-trunk/spec/mspec/bin/mspec -t /usr/bin/ruby #
endfunction
" }}}
" Haskell Tag {{{
if 0
  " see also: ~/bin/update-cabal-tags
  set tag+=~/.cabal/tags
endif
" }}}
" thinca vim development environment {{{
" http://d.hatena.ne.jp/thinca/20100216/1266294717
" Load settings for each location.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('vimrc_local.vim', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction


if exists('g:loaded_vimrc') && g:loaded_vimrc == 0
  call s:vimrc_local(getcwd())
endif
let g:loaded_vimrc = 1

" }}}
" ] for completion (dirty hack) {{{
" see also: hack #135
"augroup CloseOrCompl
"  autocmd!
"  autocmd BufWinEnter,BufNewFile ~/blog/dre/*.txt inoremap <buffer> <expr> ] CloseOrCompl()
"augroup END

"inoremap <expr> ] searchpair('\[', '', '\]', 'nbW', 'synIDattr(synID(line("."), col("."), 1), "name") =~? "String"') ? ']' : "\<C-n>"
" inoremap <expr> ] searchpair('\[', '', '\]', 'nbW', 'synIDattr(synID(line("."), col("."), 1), "name") =~? "String"') ? ']' : pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" }}}
" Open junk file. by Shougo "{{{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.Trash/vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif
  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction

" }}}
" vim filetype specific conf in general  {{{
" also for No Command-line window by Shougo http://vim-users.jp/2010/07/hack161/
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

nmap :  <sid>(command-line-enter)
xmap :  <sid>(command-line-enter)
imap <M-:> <Esc><sid>(command-line-enter)

" I added
"nnoremap q: q:<Esc>

autocmd CmdwinEnter * call s:init_cmdwin()

" MacVim is shit
autocmd CmdwinEnter * nnoremap <buffer><expr> <Cr> CmdwinRun()
autocmd CmdwinEnter * inoremap <buffer><expr> <Cr> CmdwinRun()
function! CmdwinRun()
  let a = getline(line('.'))
  return "\<Esc>\<C-c>\<C-c>:" . a . "\<Cr>"
endfunction

function! s:cmdwin_backslash()
  return matchstr(getline('.'), '\w\+') =~# '^s\(ubstitute\)\?$' ? '\' : smartchr#one_of('~/', '\')
endfunction

inoremap <Plug>(vimrc_cmdwin_close) <ESC>:<C-u>quit<CR>
function! s:init_cmdwin()
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  "inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  "I added
  imap <buffer><expr><BS> col('.') == 1 ?
        \ "\<Plug>(vimrc_cmdwin_close)" :
        \ pumvisible() ?
        \   "\<C-y>\<BS>" :
        \   "\<BS>"

  inoremap <buffer><expr>: col('.') == 1 ? "VimProcBang " : col('.') == 2 && getline('.')[0] == 'r' ? "<BS>VimProcRead " : ":"
  "inoremap <buffer><expr> \  smartchr#one_of('~/', '\')
  inoremap <buffer><expr> \ neocomplete#close_popup() . <SID>cmdwin_backslash()

  " Completion.
  "inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction

"function! s:vimrc_vim()
"  " to disable sw= -> swapfile= auto completion
"  inoremap <buffer> w= w=
"endfunction
"augroup vimrc-vim
"  autocmd!
"  autocmd FileType vim call <SID>vimrc_vim()
"augroup END
" }}}
" load PATH from ~/.zshrc {{{
"function! LoadPathFromZshrc()
"  for cmd in split(system("~/bin/loadpathfromzshrc"), "\n")
"    execute cmd
"  endfor
"endfunction
"call LoadPathFromZshrc()
" }}}
" guifont changer {{{
"  function! GuifontChanger()
"    if !exists('s:guifont_changer_index')
"      let s:guifont_changer_index = 0
"    else
"      let s:guifont_changer_index += 1
"    endif
"    if !exists('s:guifont_changer_list')
"      let s:guifont_changer_list = [
"            \ 'Andale Mono:h14',
"            \ 'Menlo:h13',
"            \ 'Inconsolata:h14',
"            \ 'Handwriting - Dakota:h32',
"            \ 'Handwriting - Dakota:h64',
"            \ ]
"    endif
"    let font = s:guifont_changer_list[
"          \ s:guifont_changer_index % len(s:guifont_changer_list)]
"    let cmd = "set guifont=" . substitute(font, " ", "\\\\ ", 'g')
"    execute cmd
"    call WindowsizeMaximize13()
"    echo cmd " for some reason it doesn't show up...
"  endfunction
"  "command! -nargs=0 GuifontChanger call GuifontChanger()
"  nnoremap <Space>ff :<C-u>call GuifontChanger()<Cr>
" }}}
" few {{{
function! s:vimrc_few() abort
  let path = expand('~/git/few/bin/few')
  if filereadable(path)
    execute 'QuickRun ruby' path
  else
    echoerr printf("'%s' not found", path)
  endif
endfunction
command! -nargs=0 Few call <SID>vimrc_few()
" }}}
" Swap window without moving cursor {{{
" https://gist.github.com/654701
"nmap <Space>j <SID>(swap-window-down-no-cursor-move)
"nmap <Space>k <SID>(swap-window-up-no-cursor-move)
nmap <Space>h <SID>(swap-window-left-no-cursor-move)
nmap <Space>l <SID>(swap-window-right-no-cursor-move)

nnoremap <SID>(swap-window-down-no-cursor-move) :<C-u>call <SID>swap_with_wincmd(v:count1, 'j')<CR>
nnoremap <SID>(swap-window-up-no-cursor-move) :<C-u>call <SID>swap_with_wincmd(v:count1, 'k')<CR>
nnoremap <SID>(swap-window-left-no-cursor-move) :<C-u>call <SID>swap_with_wincmd(v:count1, 'h')<CR>
nnoremap <SID>(swap-window-right-no-cursor-move) :<C-u>call <SID>swap_with_wincmd(v:count1, 'l')<CR>

function! s:swap_with_wincmd(n, dir)
  let curwin = winnr()
  execute a:n 'wincmd' a:dir
  let targetwin = winnr()
  wincmd p
  call s:swap_window(curwin, targetwin)
endfunction

function! s:swap_window(curwin, targetwin)
    let curbuf = winbufnr(a:curwin)
    let targetbuf = winbufnr(a:targetwin)

    if curbuf == targetbuf
        " TODO: Swap also same buffer!
    else
        execute 'hide' targetbuf . 'buffer'
        execute a:targetwin 'wincmd w'
        execute curbuf 'buffer'
        wincmd p    " Behave like <C-w>x ?
    endif
endfunction
" }}}
" copy the current file name {{{
command! -nargs=0 CopyTheCurrentFileName let @+ = expand('%')
" }}}
" unite-neco {{{
let s:unite_source = {'name': 'neco'}

function! s:unite_source.gather_candidates(args, context)
  let necos = [
        \ "~(-'_'-) goes right",
        \ "~(-'_'-) goes right and left",
        \ "~(-'_'-) goes right quickly",
        \ "~(-'_'-) skips right",
        \ "~(-'_'-)  -8(*'_'*) go right and left",
        \ "(=' .' ) ~w",
        \ ]
  return map(necos, '{
        \ "word": v:val,
        \ "source": "neco",
        \ "kind": "command",
        \ "action__command": "Neco " . v:key,
        \ }')
endfunction

call unite#define_source(s:unite_source)
" }}}
" unite-evalruby {{{
"let s:unite_source = {
"      \ 'name': 'evalruby',
"      \ 'is_volatile': 1,
"      \ 'required_pattern_length': 1,
"      \ 'max_candidates': 30,
"      \ }
"
"function! s:unite_source.gather_candidates(args, context)
"  if a:context.input[-1:] == '.'
"    let methods = split(
"          \ unite#util#system(printf('ruby -e "puts %s.methods"', a:context.input[:-2])),
"          \ "\n")
"    call map(methods, printf("'%s' . v:val", a:context.input))
"  else
"    let methods = [a:context.input]
"  endif
"  return map(methods, '{
"        \ "word": v:val,
"        \ "source": "evalruby",
"        \ "kind": "command",
"        \ "action__command": printf("!ruby -e \"p %s\"", v:val),
"        \ }')
"endfunction
"
"call unite#define_source(s:unite_source)
" }}}
" for fast cycle {{{
function! ForFastCycle()
  Unite evalruby
endfunction
command! -nargs=0 ForFastCycle call ForFastCycle()
if 0
  nnoremap <D-j> :<C-u>ForFastCycle<Cr>
  nnoremap <D-k> :<C-u>qa!<Cr>
endif
" }}}
let g:shadow_debug = 1
" PATH {{{
command! -nargs=1 AddPath   let $PATH = expand(<q-args>) . ':' .$PATH

AddPath /usr/bin
AddPath /usr/local/bin
AddPath /sbin
AddPath /usr/sbin
AddPath ~/.vimbundles/themis/bin/
" pip install --user
AddPath ~/.local/bin

if isdirectory(expand('~/bin'))
  AddPath ~/bin
endif

AddPath /home/ujihisa/git/termtter/bin
" AddPath /home/ujihisa/git/ruby/local/bin
AddPath /home/ujihisa/src/llvm-git-build/local/bin
AddPath /home/ujihisa/git/Gyazo-for-Linux/
AddPath ~/.gem/bin
" }}}
" macvim proportional {{{
function! Proportional()
  set guifontwide=
  set macproportionalfont
endfunction
command! -nargs=0 Proportional call Proportional()
" }}}
" last two digit move {{{
" inspired by tavis' emacs voice line number movement feature
"command! -count=1 -nargs=0 LastTwoDigitMove call LastTwoDigitMove(<count>)
"function! LastTwoDigitMove(bound)
"  " for example when you are at line num 123 and typed 3gl
"  "   getpos('.')[1] is 123
"  "   a:bound is 125
"  "   the goal is 103
"  let current = getpos('.')[1]
"  let to = current / 100 * 100 + a:bound - current + 1
"  execute to
"endfunction
"nnoremap <silent> gl :LastTwoDigitMove<Cr>

" version 2.0
" thanks MarcWeber
" not it's not only two-digit
command! -count=1 -nargs=0 GoToTheLine silent execute getpos('.')[1][:-len(v:count)-1] . v:count
nnoremap <silent> gl :GoToTheLine<Cr>
" }}}
" Haskell Type {{{
function! s:haskell_type(fname, expression)
  if filereadable(a:fname)
    let fname = a:fname
  else
    let fname = tempname()
    call writefile(getline(0, '$'), fname, 'b')
    "return {'left': printf("File not found: %s", a:fname)}
  endif
  let r = ref#system(['ghc-mod', 'type', fname, 'main', a:expression])
  if r.result != 0
    return {'left': r.stderr}
  endif
  return {'right': r.stdout}
endfunction
command! -nargs=1 HaskellType echo s:haskell_type(expand('%'), <q-args>)
" }}}
" echodoc {{{
let g:echodoc_enable_at_startup = 0
" }}}
" echodoc for clojure {{{
"let s:clojure_doc_dict = {
"      \ 'name': 'clojure',
"      \ 'rank': 10,
"      \ 'filetypes' : {'clojure': 1},
"      \ }
"let s:P = g:V.import('ProcessManager')
"function! s:clojure_doc_dict.search(cur_text)
"  let tmp = matchlist(a:cur_text, "\\([a-z][a-z0-9.'_]*\\)\\s*$")
"  let tmp = filter(tmp, 'v:val != ""')
"  if len(tmp) == 2
"    let query = tmp[1]
"  else
"    return []
"  endif
"  let t = s:P.touch('vimrc-echodoc-clojure', 'clojure-1.5')
"  if t ==# 'new'
"    call s:P.read_wait('vimrc-echodoc-clojure', 2.0)
"    call s:P.writeln('vimrc-echodoc-clojure', '(ns vim-ref (:use [clojure.repl :only (doc find-doc)]))')
"  endif
"  call s:P.writeln('vimrc-echodoc-clojure', printf('(doc %s)', query))
"  let result = s:P.read('vimrc-echodoc-clojure')[0]
"  let result = get(matchlist(result, printf('[a-z.]\+/%s', query)), 0, '')
"  return [
"        \ {'text': query, 'highlight': 'Identifier'},
"        \ {'text': ' ' . substitute(string(result), '\n', "", "")}]
"endfunction
"call echodoc#register('clojure', s:clojure_doc_dict)
" }}}
" testing neco-ghc {{{
"nnoremap <D-0> :<C-u>e ~/.vimbundles/neco-ghc/fixtures/a.hs<Cr>
" }}}
" vim-ref {{{
let g:ref_phpmanual_path = expand("~/src/php-chunked-xhtml/")
let g:ref_phpmanual_cmd = 'elinks -dump -dump-charset utf-8 -no-numbering -no-references %s' " charset is important
"let g:ref_man_cmd = "man -P cat"
" let g:ref_erlang_manpath = '/usr/local/share/man'
let $MANPAGER='cat'
"call ref#rmcache()

" let g:ref_clojure_cmd = [
"       \ 'java', '-XX:+TieredCompilation', '-XX:TieredStopAtLevel=1', '-Xverify:none',
"       \ '-cp', '/usr/share/clojure-1.5/lib/clojure.jar', 'clojure.main']

let g:ref_clojure_use_persistent = 1
" }}}
" special git log viewer {{{
function! s:git_log_viewer() abort
  if s:is_display_landscape()
    vnew
  else
    new
  endif
  "VimProcRead git log -u 'HEAD@{1}..HEAD' --reverse
  VimProcRead git log -u 'ORIG_HEAD..HEAD' --
  set filetype=git-log.git-diff
  setl foldmethod=expr
  setl foldexpr=getline(v:lnum)!~'^commit'
endfunction

command! GitLogViewer call s:git_log_viewer()

function! s:cd_pull_log(path) abort
  tabnew
  execute 'cd' expand(a:path)
  VimShell
  GitLogViewer
  wincmd L
endfunction

command! -nargs=1 CdPullLog call s:cd_pull_log(<q-args>)
" }}}
" disable macvim vimrc_examples {{{
let g:no_vimrc_example = 1
" }}}
" Git Diff -> The file {{{
function! SGoDiff()
  let [maybe, fname] = s:latest_fname()
  if maybe ==# 'nothing'
    echoerr 'failed to find the filename'
    return
  endif

  let [maybe, linenum] = s:latest_linenum()
  if maybe ==# 'nothing'
    echoerr 'failed to find the linenum'
    return
  endif

  execute "vnew" fname
  execute linenum
  execute "normal! z\<Cr>"
endfunction

augroup vimrc-sgodiff
  autocmd!
  autocmd FileType git-diff nnoremap <buffer> <C-d> :<C-u>call SGoDiff()<Cr>
augroup END

function! s:latest_fname()
  for i in reverse(range(1, line('.')))
    if getline(i) =~ '^+++ '
      return ['just', substitute(getline(i)[4:], '\t.*$', '', 'b')]
    endif
  endfor
  return ['nothing', '']
endfunction

function! s:latest_linenum()
  for i in reverse(range(1, line('.')))
    if getline(i) =~ '^@@ '
      let a = matchlist(getline(i), '^@@ -.\{-},.\{-} +\(.\{-}\),')
      if exists('a[1]')
        return ['just', a[1]]
      endif
    endif
  endfor
  return ['nothing', '']
endfunction
" }}}
" yet another star {{{
"function! s:star_with_smartcase()
"  set hlsearch
"  echo expand('<cWORD>')
"  execute printf('/\<%s\>', expand('<cWORD>'))
"endfunction
"nnoremap * :<C-u>call <SID>star_with_smartcase()<Cr>
" }}}
" vital toplevel func for hand-testing {{{
command! Letv let V = vital#__latest__#new() | echo 'V: ' . string(keys(V))
" }}}
" setl list is very often {{{

" nnoremap ` :<C-u>setl list!<Cr>
function! s:toggle_wrap()
  setlocal wrap!
  if exists('b:interactive.terminal.wrap')
    let b:interactive.terminal.wrap = &l:wrap
  endif
endfunction
nnoremap ` :<C-u>silent call <SID>toggle_wrap()<Cr>
" }}}
" too much t). I dont' use ). ) should be t). {{{
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(
" I don't use [(, so I remap [.
onoremap ] t]
onoremap [ t[
vnoremap ] t]
"vnoremap [ t[

" }}}
" hack 104 http://vim-users.jp/2009/11/hack104/ {{{
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
" }}}
" MacVim is unko {{{
function! s:macvim_is_unko() abort
  let rtp = split(&rtp, ',')
  unlet rtp[index(rtp, '/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya')]
  let &rtp = join(rtp, ',')
endfunction
call s:macvim_is_unko()
" }}}
" golden ratio {{{
command! -nargs=0 GoldenRatio execute 'vertical resize' &columns * 5 / 8
nnoremap <silent><Space>] :<C-u>GoldenRatio<Cr>
" }}}
" unite-transparency {{{
let s:unite_source = {'name': 'transparency', 'action_table': {'*': {}} } " avoid triple closes
function! s:unite_source.gather_candidates(args, context)
  return map(range(0, 100, 4), '{
        \ "word": v:val,
        \ "source": "transparency",
        \ "kind": "command",
        \ "action__command": "set transparency=" . v:val,
        \ }')
endfunction
let s:unite_source.action_table.preview = {
      \ 'description': 'preview this transparency', 'is_quit': 0 }
function! s:unite_source.action_table.preview.func(candidate)
  execute a:candidate.action__command
endfunction
call unite#define_source(s:unite_source)
" }}}
" quickrun + haskell = infinite loop {{{
command! -nargs=0 KillHaskell execute '!killall runghc' | execute '!killall ghc'
" }}}
" remote {{{
function! s:_vim(x)
  if filereadable('/Applications/MacVim.app/Contents/MacOS/Vim')
    return g:V.system('/Applications/MacVim.app/Contents/MacOS/Vim ' . a:x)
  endif
endfunction

function! s:new(...)
  let name = a:0 == 1 ? a:1 : s:_remote_name()
  return {'name': name, 'send': function('s:_send'), 'focus': function('s:_focus')}
endfunction

function! s:_send(key) dict
  return s:_vim('--servername ' . self.name . ' --remote-send ' . string(a:key))
endfunction

function! s:_focus() dict
  VimProcBang open ~/.vim/macvimfocus.app
endfunction

function! s:_remote_name()
  for server in split(s:_vim('--serverlist'), "\n")
    if server !=# v:servername
      return server
    endif
  endfor
  call g:V.print_error('No remote server')
endfunction

function! VimrcRemoteInit()
  let remote = s:new()
  " echo remote.send('<Esc>:h client-server<Cr>')
  command! -nargs=* R call remote.send('<Esc>:' . <q-args> . '<Cr>') | call remote.focus()
  nnoremap <silent><space>[ :<C-u>VimProcBang osascript ~/.vim/macvimfocus.scpt<Cr>
endfunction

" }}}
" conceallevel changer {{{
nnoremap <space>` :<C-u>setl conceallevel=0<Cr>
" }}}
" vimfiler {{{
let g:vimfiler_as_default_explorer = 1

autocmd FileType vimfiler call s:vimfiler_local()
function! s:vimfiler_local()
  silent! nunmap <buffer> L
  silent! nunmap <buffer> H

  " don't loop j/k
  silent! nunmap <buffer> j
  silent! nunmap <buffer> k

  " default is g?
  nmap <buffer> ? <Plug>(vimfiler_help)
endfunction
" }}}
" :TOhtmlAndBrowse {{{
" http://d.hatena.ne.jp/tyru/20110710/tenuki
" changing command name from TOhtmlAndBrowse to TOhtmAndBrowse to avoid Vim bug
" also.. it doesn't delete the file because this computer is slow..
command!
\   TOhtmAndBrowse
\   call s:TOhtmlAndBrowse()
function! s:TOhtmlAndBrowse()
  TOhtml
  " begin callback...?
  %s/font-family: monospace/font-family: Myriad Pro/
  %s/.lnr { /\0font-family: monospace; /
  %s/^<span class="lnr">[ 0-9]\+<\/span> */<font family="monospace">\0<\/font>/
  %s/<span class="lnr">\s*[0-9]\+\s*<\/span>\zs \+\ze/\='<font color=white>' . repeat("_", len(submatch(0))) . "<\/font>"/g
  " end
  saveas `=tempname()`
  let save = get(g:, 'openbrowser_open_filepath_in_vim')
  let g:openbrowser_open_filepath_in_vim = 0
  try
    OpenBrowser file://%
  finally
    let g:openbrowser_open_filepath_in_vim = save
  endtry
  "sleep 1
  "call delete(expand('%'))
endfunction
" }}}
" keynote integration {{{
command! -nargs=0 TOkeynote call s:keynote()
function! s:keynote()
  let before = g:colors_name
  Tcolorscheme martin_krischik
  ToggleRaibowParenthesis
  setl conceallevel=0
  TOhtmAndBrowse
  execute "Tcolorscheme" before
endfunction
" }}}
" ENV {{{
if !$LANG
  let $LANG='en_US.UTF-8'
endif
" http://lingr.com/room/vim/archives/2011/09/19#message-4881743
" }}}
" for vital spec {{{
" /Users/ujihisa/git/MacVim/src/MacVim/build/Release/MacVim.app/Contents/MacOS/Vim -g -u NONE -i NONE -N --cmd 'filetype indent on' -S spec/data/string.vim -c 'Fin /tmp/prelude.result'
" }}}
" neosnippet {{{
imap <expr> <Bslash> (pumvisible() && neosnippet#expandable()) ?
      \ "\<Plug>(neosnippet_expand)" : '\'

nnoremap <C-s> :<C-u>Unite neosnippet<Cr>
imap <M-\> <Plug>(neosnippet_jump_or_expand)
smap <M-\> <Plug>(neosnippet_jump_or_expand)
nmap <M-\> a<M-\>
xmap <M-\> <Plug>(neosnippet_start_unite_snippet_target)

" only for MacBook Pro (gentoo)
imap <C-\> <Plug>(neosnippet_jump_or_expand)
smap <C-\> <Plug>(neosnippet_jump_or_expand)
nmap <C-\> a<M-\>
xmap <C-\> <Plug>(neosnippet_start_unite_snippet_target)


" uses system snippet as personal snippet!
" let g:neosnippet#snippets_directory = '~/.vimbundles/neosnippet/autoload/neosnippet/snippets/'
let g:neosnippet#snippets_directory = '~/.vimbundles/neosnippet-snippets/neosnippets/'

" }}}
" vimshell platform-dependent aliases {{{
let s:is_gentoo = vimproc#system('uname -a') =~ 'gentoo'
function! s:vimshell_settings()
  if s:is_gentoo
    call vimshell#set_alias('time', 'exe time -p')

    let xfce4_docker_cmd = 'xfce4-terminal --maximize -e "docker exec -it `docker ps -lq` /bin/bash" && wmctrl -a `wmctrl -l | tail -1 | sed "s/ .*//"` -i'
    call vimshell#set_alias('dockersh', printf('sh -c %s', string(xfce4_docker_cmd)))
  endif

  " from vimshell's doc
  call vimshell#set_alias('j', ':Unite -buffer-name=files
        \ -default-action=lcd -no-split -input=$$args directory_mru')

  " it's the default behaviour of <Cr> in vimshell's insert mode
  imap <buffer> <S-CR> <C-]><Plug>(vimshell_enter)
  " <Cr> expands snippet!
  imap <buffer><expr> <CR> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand)\<Plug>(vimshell_enter)" : "\<Plug>(vimshell_enter)"
endfunction
augroup vimshell-settings
  autocmd!
  autocmd FileType vimshell call s:vimshell_settings()
augroup END
" }}}
" copy&paste {{{

" col('$') <= col('.'): at the end of line or not, considering virtualedit.

" it didn't work for some reason...
" nnoremap <expr> <Plug>(vimrc-cmd-v-paste) col('$') <= col('.') ? '"+p' : '"+P'
" inoremap <Plug>(vimrc-temporary-normal-mode) <C-o>
" imap ö <Plug>(vimrc-temporary-normal-mode)<Plug>(vimrc-cmd-v-paste)
imap <expr> <M-v> col('$') <= col('.') ? '<C-o>"+p' : '<C-o>"+P'

set linespace=2

" }}}
" jruby {{{
function! VimrcJruby()
  if &filetype != 'ruby'
    echoerr 'not ruby'
    return
  endif

  call vimproc#system_bg('jruby --ng-server')
  let b:quickrun_config = {'command': 'jruby', 'cmdopt': '--ng --1.9'}
endfunction
" }}}
" pseudo rm command {{{
command! -nargs=* Rm echo <q-args>
" }}}
" no python preview {{{
set completeopt-=preview
" }}}
" minecraft {{{
function! VimrcSwank()
  VimShellInteractive java -jar /home/ujihisa/git/swank-client/swank-client-1.1.0-standalone.jar -p 4006
  set filetype=clojure
  normal! A(ns mc68.core)
endfunction

"function! VimrcSendSwank()
"  "let @" = substitute(vimclojure#ExtractSexpr(1)[1], '\(;.*\)\?\n *', ' ', 'g')
"  execute 'VimShellSendString' vimclojure#ExtractSexpr(1)[1]
"endfunction

" experimental
nnoremap <space>9 V%y<C-w>jGpkVGJ
" }}}
" vim-scala {{{
let g:scala_use_default_keymappings = 0
" }}}
" haskell snippets {{{
" import qualified Control.Monad.State as S
" import Control.Applicative ((<$>), (<*>))
" import Data.Maybe (fromMaybe)
" import qualified Data.Map as M
" import Control.Monad (unless)
"
" {-# LANGUAGE QuasiQuotes #-}
" import Data.String.Interpolation (str)
" }}}
" unite-file_rec with file-extension {{{
function! s:file_extension()
  let table = {
        \ 'ruby': 'rb',
        \ 'haskell': 'hs',
        \ 'clojure': 'clj' }
  return '.' . get(table, &filetype, &filetype)
endfunction
command! -nargs=0 UniteFilerecWithFiletype execute "Unite file_rec -input=" . <SID>file_extension()
" }}}
" lingr-vim {{{
augroup vimrc-lingr
  autocmd!
  autocmd FileType lingr-messages nmap <buffer> i <Plug>(lingr-messages-show-say-buffer)
  autocmd FileType lingr-say inoremap <buffer> <Cr> <Esc>:wq<Cr>
augroup END
" }}}
" javascript {{{
function! s:vimrc_javascript()
  setl ts=4
  setl sw=4
  setl noexpandtab
  setl nolist

  "inoremap <buffer> <expr> \  smartchr#one_of('function(', '\')
  inoremap <buffer> ` console.log();<Left><Left>
  "runtime! ftplugin/coffee.vim
endfunction
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript call <SID>vimrc_javascript()
augroup END
" }}}
" python {{{
function! s:vimrc_python()
  " setl ts=4
  " setl sw=4
  " setl noexpandtab
  " setl nolist

  "inoremap <buffer> <expr> \  smartchr#one_of('function(', '\')
  inoremap <buffer> ` print()<Left>
endfunction
augroup vimrc-python
  autocmd!
  autocmd FileType python call <SID>vimrc_python()
augroup END
" }}}
" coffeescript {{{
function! s:vimrc_coffeescript()
  setl sw=2
  setl sts=2
  setl expandtab
  setl list
endfunction

augroup vimrc-coffeescript
  autocmd!
  autocmd FileType coffee call <SID>vimrc_coffeescript()
augroup END
" }}}
" yacc {{{
" mostly for ruby/parse.y
augroup vimrc-yacc
  autocmd!
  autocmd FileType yacc setl nolist
  autocmd FileType yacc setl noexpandtab
  autocmd FileType yacc setl ts=8
  autocmd FileType yacc setl sw=4
augroup END
" }}}
" java {{{
function! s:vimrc_java()
  compiler javac
  nnoremap <buffer> <space>m :<C-u>make %<Cr>
  inoremap <buffer> ` System.out.println();<left><left>
endfunction

augroup vimrc-java
  autocmd!
  autocmd FileType java call <SID>vimrc_java()
augroup END
" }}}
" Vital.Vim.Buffer {{{
function! VitalVimBuffer_all()
  redir => output
  silent! ls
  redir END

  let flag_dict = {}
  for out in map(split(output, '\n'), 'split(v:val)')
    let flag_dict[out[0]] = [
          \ matchstr(join(out), '^.*\ze\s\+"'),
          \ matchstr(join(out), '"\zs.*\ze"')]
  endfor

  echo flag_dict
endfunction
" }}}
" scala sbt interaction {{{
function! s:start_sbt(vsm_cmds) abort
  execute 'normal' "\<Plug>(vimshell_split_switch)\<Plug>(vimshell_hide)"
  execute 'VimShellInteractive sbt -no-colors'
  stopinsert
  let t:vsm_bufname = bufname('%')
  wincmd H
  wincmd p
endfunction

function! s:sbt_run(vsm_cmds) abort
  let vsm_bufname = get(t:, 'vsm_bufname', '*not-found*')
  if vsm_bufname == '*not-found*'
    call s:start_sbt(a:vsm_cmds)
    call s:sbt_run(a:vsm_cmds)
  else
    let vsm_cmds = copy(a:vsm_cmds) " copy for later modifications

    " detect subproject
    let known_subprojects = [
          \ 'crypto-common',
          \ 'sdk-crypto',
          \ 'sdk-kms',
          \ 'service-crypto',
          \ 'crypto-cli',
          \ 'service-crypto-root',
          \ 'util-core',
          \ 'service-member',
          \ 'sdk-member',
          \ 'member-common',
          \ 'test-integration-member']
    for subproject in known_subprojects
      if expand('%:.') =~ subproject
        call map(vsm_cmds, printf('v:val == "reload" ? v:val : "%s/" . v:val', subproject))
        break
      endif
    endfor

    " go to the window
    let wn = bufwinnr(vsm_bufname)
    if !bufexists(vsm_bufname)
      unlet! t:vsm_bufname
      return s:sbt_run(a:vsm_cmds) " retry
    elseif wn == -1
      echo "buffer exists but window doesn't exist. opening it."
      execute 'sbuffer' vsm_bufname
      wincmd H
    else
      execute wn . 'wincmd w'
    endif

    " make sure if it's vimshell
    if !has_key(b:, 'interactive')
      close
      unlet t:vsm_bufname
      call s:sbt_run(a:vsm_cmds)
      return
    endif

    normal! Gzt
    " go back to the previous window
    wincmd p

    call vimshell#interactive#set_send_buffer(vsm_bufname)
    call vimshell#interactive#clear()
    let joined_vsm_cmds = "; " . join(vsm_cmds, '; ')
    call vimshell#interactive#send(joined_vsm_cmds)
    " explosion
    "call vimproc#system_bg('curl -s http://localhost:8080/requests/status.xml?command=pl_play')
  endif
endfunction

function! s:vimrc_scala()
  nnoremap <buffer> <Space>m :<C-u>write<Cr>:call <SID>sbt_run(get(t:, 'vsm_cmds', ['compile']))<Cr>
endfunction

augroup vimrc_scala
  autocmd!
  autocmd FileType scala call s:vimrc_scala()
  autocmd FileType sbt.scala call s:vimrc_scala()
augroup END
" }}}
" clojure leininge integrate (deadcopy from scala. really bad.) {{{
function! s:start_leiningen()
  if !has_key(t:, 'vsm_cmds')
    let t:vsm_cmds = ['compile']
  endif
  execute 'normal' "\<Plug>(vimshell_split_switch)\<Plug>(vimshell_hide)"
  execute 'VimShellInteractive lein interactive'
  stopinsert
  let t:vsm_bufname = bufname('%')
  wincmd H
  wincmd p
endfunction

function! s:lein_run()
  let vsm_bufname = get(t:, 'vsm_bufname', '*not-found*')
  if vsm_bufname == '*not-found*'
    call s:start_leiningen()
  else
    if !has_key(t:, 'vsm_cmds')
      echoerr 'please give t:vsm_cmds a list'
      return
    endif

    " go to the window
    let wn = bufwinnr(vsm_bufname)
    if !bufexists(vsm_bufname)
      unlet! t:vsm_bufname
      return s:lein_run() " retry
    elseif wn == -1
      echo "buffer exists but window doesn't exist. opening it."
      execute 'sbuffer' vsm_bufname
      wincmd H
    else
      execute wn . 'wincmd w'
    endif

    " make sure if it's vimshell
    if !has_key(b:, 'interactive')
      close
      unlet t:vsm_bufname
      call s:lein_run()
      return
    endif

    normal! Gzt
    " go back to the previous window
    wincmd p

    call vimshell#interactive#set_send_buffer(vsm_bufname)
    call vimshell#interactive#clear()
    call vimshell#interactive#send(t:vsm_cmds)
  endif
endfunction

function! s:vimrc_clojure()
  nnoremap <buffer> <Space>m :<C-u>write<Cr>:call <SID>lein_run()<Cr>
endfunction

augroup vimrc_clojure
  autocmd!
  autocmd FileType clojure call s:vimrc_clojure()
augroup END
" }}}
" clojure {{{

" for
" * clojure.tools.cli/cli
" * anything that begins with def
let g:clojure#indent#special = '\<cli\|def.\*$'

augroup ujihisa-vimrc
  autocmd FileType clojure setlocal tabstop=2 shiftwidth=2
augroup END

" }}}
" filetype make {{{
augroup vimrc-make
  autocmd!
  autocmd FileType make syn keyword makeKeyword CFLAGS LDFLAGS contained
  autocmd FileType make hi def link makeKeyword Keyword
augroup END
" }}}
" concealedyank.vim {{{
vnoremap <Plug>(vimrc-yankprefix-clipboard) "+
vnoremap <Plug>(vimrc-go-back-to-mark) Gmm
" vmap <M-c> <Plug>(vimrc-yankprefix-clipboard)<Plug>(operator-concealedyank)

vmap <M-c> <Plug>(vimrc-yankprefix-clipboard)<Plug>(operator-concealedyank)<Plug>(vimrc-go-back-to-mark)
" }}}
" iexe-sbt {{{
function! s:vimrc_int_sbt()
  nunmap <buffer> j
  nunmap <buffer> k

  syntax case ignore

  syntax match intsbtPrompt /^> .*/ contains=intsbtPromptBody,intsbtPromptHead
  syntax match intsbtPromptBody /.*/ contained
  syntax match intsbtPromptHead /^> / contained

  syntax match intsbtDebug /^\[debug\] .*\|^\d\d:\d\d:\d\d/ contains=intsbtDebugHead,intsbtDebugBody
  syntax match intsbtDebugBody /.*/ contained
  syntax match intsbtDebugHead /\[debug\]/ contained

  syntax match intsbtInfo /^\[info\] .*/ contains=intsbtInfoHead,intsbtInfoBody
  syntax match intsbtInfoBody /.*/ contained
  syntax match intsbtInfoHead /\[info\]/ contained

  syntax match intsbtWarn /^\[warn\] .*/ contains=intsbtWarnHead,intsbtWarnBody
  syntax match intsbtWarnBody /.*/ contained
  syntax match intsbtWarnHead /\[warn\]/ contained

  syntax match intsbtError /^\[error\] .*/ contains=intsbtErrorHead,intsbtErrorBody
  syntax match intsbtErrorBody /.*/ contained
  syntax match intsbtErrorHead /\[error\]/ contained

  syntax match intsbtSuccess /^\[success\] .*/

  hi def link intsbtPromptBody Statement
  hi def link intsbtPromptHead Operator

  hi def link intsbtDebugBody Comment
  hi def link intsbtDebugHead LineNr

  hi def link intsbtInfoBody Comment
  hi def link intsbtInfoHead LineNr
  " intsbtWarnBody: something easy to read and doesn't look too strong
  hi def link intsbtWarnBody String
  hi def link intsbtWarnHead LineNr
  " intsbtErrorBody: something easy to read and does look strong
  hi def link intsbtErrorBody Normal
  hi def link intsbtErrorHead LineNr
  hi def link intsbtSuccess LineNr
endfunction

augroup vimrc-int-sbt
  autocmd!
  autocmd FileType int-sbt call <SID>vimrc_int_sbt()
augroup END
" }}}
" unite-menu {{{
let g:unite_source_menu_menus = {}
"let g:unite_source_menu_menus.test = {
"      \     'description' : 'Test menu',
"      \ }
"let g:unite_source_menu_menus.test.candidates = {
"      \   'ghci'      : 'VimShellInteractive ghci',
"      \ }
"function g:unite_source_menu_menus.test.map(key, value)
"  return {
"      \       'word' : a:key, 'kind' : 'command',
"      \       'action__command' : a:value,
"      \     }
"endfunction
"
"let g:unite_source_menu_menus.test2 = {
"      \     'description' : 'Test menu2',
"      \ }
"let g:unite_source_menu_menus.test2.command_candidates = {
"      \   'python'    : 'VimShellInteractive python',
"      \ }
"
"let g:unite_source_menu_menus.test3 = {
"      \     'description' : 'Test menu3',
"      \ }
"let g:unite_source_menu_menus.test3.command_candidates = [
"      \   ['ruby', 'VimShellInteractive python'],
"      \   ['python', 'VimShellInteractive python'],
"      \ ]
let g:unite_source_menu_menus.neobundle = {
      \   'description' : 'Test menu',
      \   'command_candidates': [
      \     ['all', 'Unite -no-start-insert -horizontal -log neobundle/update:all'],
      \     ['shougo', 'Unite -no-start-insert -horizontal -log neobundle/update:vimshell neobundle/update:vimproc neobundle/update:unite.vim neobundle/update:neocomplete neobundle/update:neosnippet']
      \   ]
      \ }
let g:unite_source_menu_menus.quickrun_set = {
      \   'description': "change b:quickrun_config to enable more",
      \   'command_candidates': [
      \     ['esprima', 'call <SID>vimrc_esparse()']
      \   ]
      \ }
let g:unite_source_menu_menus.myset = {
      \   'description': 'from vimrc',
      \   'command_candidates': [
      \     ['CopyTheCurrentFileName', 'CopyTheCurrentFileName'],
      \     ['GitLogViewer', 'GitLogViewer'],
      \   ],
      \ }

nnoremap <silent> sn  :<C-u>Unite menu -buffer-name=menu<CR>
" }}}
" clojure completion candidates {{{
function! VimrcClojureComplCand()
  let to_run = "(ns tmp [:require [cloft.cloft]]) (doseq [k (keys (ns-publics 'cloft.cloft))] (println (str \"c/\" k))) (System/exit 0)"
  return vimproc#system(printf('java -cp `lein classpath` clojure.main -e "%s"', to_run))
endfunction
" }}}
" groovy {{{
augroup vimrc-groovy
  autocmd!
  autocmd BufWinEnter,BufNewFile *.gradle set filetype=groovy
augroup END
" }}}
" ghcmod {{{
augroup vimrc-ghcmod
  autocmd!
  autocmd FileType haskell silent nnoremap <buffer> <space>\t :<C-u>GhcModTypeClear<Cr>:GhcModType<Cr>
  autocmd FileType haskell silent nnoremap <buffer> <space>\i :<C-u>GhcModTypeClear<Cr>:GhcModInfo<Cr>
  autocmd FileType haskell silent nnoremap <buffer> <space>\c :<C-u>GhcModTypeClear<Cr>
augroup END
" }}}
" ebuild {{{
augroup vimrc-ebuild
  autocmd!
  autocmd FileType ebuild nnoremap <buffer> <space>m :<C-u>write<Cr>:Unite -buffer-name=build build:repoman:manifest build:repoman:full -horizontal -no-start-insert<Cr>
  " :GitAdd Manifest<Cr>
augroup END
" }}}
" c {{{
let $CPP_STDLIB = '/usr/lib/gcc/x86_64-pc-linux-gnu/4.8.2/include/g++-v4'
augroup vimrc-c
  autocmd!
  autocmd FileType c nnoremap <buffer> <space>m :<C-u>write<Cr>:Unite -buffer-name=build build:make -vertical -no-start-insert -no-focus<Cr>
  autocmd FileType cpp nnoremap <buffer> <space>m :<C-u>write<Cr>:Unite -buffer-name=build build:make -vertical -no-start-insert -no-focus<Cr>
  autocmd FileType cpp setl path+=$CPP_STDLIB cinoptions+=:0,g0
  autocmd FileType cpp nnoremap sB :<C-u>UniteWithCursorWord boost-online-doc
  autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
  "autocmd FileType cpp setl suffixesadd+=.hpp
  " no-focus
augroup END
" }}}
" sound {{{
" augroup vimrc-sound
"   autocmd!
"   autocmd BufWritePost * call vimproc#system_bg('curl -s http://localhost:8080/requests/status.xml?command=pl_play')
" augroup END
" }}}
" iexe git-log -u {{{
function! s:vimrc_git_log_u()
  if bufname('%') =~ '^less-git log -u'
    set filetype=git-log.git-diff
  endif
endfunction

augroup vimrc-git-log-u
  autocmd!
  autocmd FileType vimshell-less call <SID>vimrc_git_log_u()
augroup END
" }}}
" postgresql {{{
let g:quickrun_config['sql/postgresql'] = {
      \ 'cmdopt': '-h 0.0.0.0 mydb postgres'
      \ }
" }}}
" scrot (screenshot by <C-q>) {{{
let g:scrot_n = 0
function! s:scrot()
  call vimproc#system(printf('scrot /tmp/%04d.png', g:scrot_n))
  let g:scrot_n += 1
  return ""
endfunction
nnoremap <silent><C-q> :<C-u>call <SID>scrot()<Cr>
inoremap <silent><expr> <C-q> <SID>scrot()
" }}}
" esparse {{{
function! s:vimrc_esparse()
  if filereadable('/usr/local/share/npm/bin/esparse')
    " Mac
    let b:quickrun_config = {'command': '/usr/local/share/npm/bin/esparse'}
  elseif filereadable('/home/ujihisa/node_modules/esprima/bin/esparse.js')
    let b:quickrun_config = {'command': '/home/ujihisa/node_modules/esprima/bin/esparse.js'}
  endif
endfunction

" }}}
" fontzoom {{{
let g:fontzoom_no_default_key_mappings = 1
nmap <M--> <Plug>(fontzoom-smaller)
nmap <M-=> <Plug>(fontzoom-larger)
" }}}
" bare vim {{{
" $ vim -u NONE -U NONE --noplugin
" }}}
" j6uil {{{
let g:J6uil_display_icon = 1
let g:J6uil_empty_separator = 1
let g:J6uil_open_buffer_cmd = 'new'
let g:J6uil_align_message = 0

augroup my-j6uil
  autocmd!
  autocmd FileType J6uil call s:j6uil_settings()
augroup END

function! s:j6uil_settings()
  nunmap <buffer> s
  nmap <silent> <buffer> i <Plug>(J6uil_open_say_buffer)
  "imap <silent> <buffer> <Cr> <Esc><Cr>
endfunction
" }}}
" spin.vim (rails) {{{
let g:quickrun_config.spin = {
      \ 'command': '~/git/spin.vim/bin/spin serve -Itest',
      \ 'cmdopt': '-Itest',
      \ 'runner': 'concurrent_process',
      \ 'runner/concurrent_process/load': '["%s"]',
      \ 'runner/concurrent_process/prompt': 'spin>>>>> ',
      \ }
" }}}
" mongodb {{{
"function! s:vimrc_filetype_mongodb()
"  setl syntax=javascript
"  " remote mongo
"  let b:quickrun_config = {
"  \   'command': 'ssh -t',
"  \   'runner': 'process_manager',
"  \   'runner/process_manager/load': '(load-file "%s")',
"  \   'runner/process_manager/prompt': 'rs_a:SECONDARY> ',
"  \ },
"  echo 'let b:quickrun_config.cmdopt = '
"endfunction
" }}}
" maxlength {{{
let s:L = g:V.import('Data.List')
function! s:vimrc_currentfile_maxlength(limit)
  let buf_max_len = s:L.max_by(map(getline(1, line('$')), 'len(v:val)'), 'v:val')
  return s:L.min_by([buf_max_len, a:limit], 'v:val')
endfunction
nnoremap <M-]> :<C-u>execute printf(
      \ 'vertical resize %s',
      \ <SID>vimrc_currentfile_maxlength(&columns * 9 / 10))<Cr>
" }}}
" jplus {{{
nmap <M-J> <Plug>(jplus-input)
vmap <M-J> <Plug>(jplus-input)
" }}}
" clojure-ns {{{
if 0
  function! s:vimrc_clojure_current_ns(contents)
    for line in a:contents[:4] " take 5 items
      let x = matchlist(line, '^(ns \(.*\)')[1]
      if len(x)
        return x
      endif
    endfor
    echomsg 'could not find ns'
    return ''
  endfunction

  function! s:vimrc_clojure_current_ns_current_file()
    return s:vimrc_clojure_current_ns(getline(1, '$'))
  endfunction
endif
" }}}
" debug quickrun/process_manager {{{
function! VimrcStopProcess(type)
  "echo vital#of('quickrun').import('ProcessManager').stop('clojure/process_manager')
  echo vital#of('quickrun').import('ProcessManager').stop(a:type)
endfunction
" }}}
" Database.SQLite {{{
" let g:S = g:V.import('Database.SQLite')
" call g:S.debug_mode_to(1)
" }}}
" showtime {{{
augroup vimrc-showtime
  autocmd!
  " By default it's just "s" but it takes time to trigger.
  " Just use <M-u> instead.
  autocmd FileType showtime nmap <buffer> <M-u> <Plug>(showtime-cursor)
augroup END
" }}}
" unite-file/mru {{{
let g:neomru#filename_format = ':~:.'
let g:neomru#file_mru_limit = 50000 " default is 1000
let g:neomru#directory_mru_limit = 50000 " default is 1000
" }}}
" unite-build {{{
augroup vimrc-unite-build
  autocmd!
  "autocmd FileType clojure nnoremap <buffer> <space>m :<C-u>write<Cr>:Unite -buffer-name=build -no-focus -no-start-insert build:lein<Cr>
augroup END

"let g:quickrun_config['lein-test'] = {
"      \   'command': 'lein run -m clojure.main/repl',
"      \   'runner': 'process_manager',
"      \   'runner/process_manager/load': "(do (use 'rabbitmq-client.core-test :reload-all) (clojure.test/run-tests 'rabbitmq-client.core-test))",
"      \   'runner/process_manager/prompt': 'user=> ',
"      \ }
"augroup vimrc-lein-test
"  autocmd!
"  autocmd FileType clojure nnoremap <buffer> <space>m :<C-u>write<Cr>:QuickRun -type lein-test<Cr>
"augroup END

" }}}
" just for now -- vuls {{{
let g:unite_feedback_report_level = 2
let g:unite_feedback_report_destination = 'http://vuls.ap01.aws.af.cm'
" }}}
" jruby {{{
let $GEM_HOME = expand('~/.gem')
" }}}
" vimshell-benri {{{
" let g:B = g:V.import('Vim.Buffer')
" augroup vimshell-benri
"   autocmd!
"   autocmd CursorHold * if !g:B.is_cmdwin() | silent call feedkeys("g\<ESC>", 'n') | endif
" augroup END
" }}}
" lein repl {{{

function! s:ft_lein_repl()
  set filetype=clojure
endfunction

augroup lein-repl
  autocmd!
  autocmd FileType int-lein call s:ft_lein_repl()
augroup END

" }}}
" AndrewRadev/switch {{{

" nnoremap <silent><M-i> :<C-u>Switch<Cr>
" inoremap <silent><M-i> <Esc>:Switch<Cr>a

augroup vimrc-scala-switch
  autocmd!
  autocmd FileType scala let b:switch_custom_definitions =
        \ [{
        \   '\(log[ \.]\+\)info\>': '\1warn',
        \   '\(log[ \.]\+\)warn\>': '\1error',
        \   '\(log[ \.]\+\)error\>': '\1info'},
        \  {
        \   '\<extends\>': 'with',
        \   '\<with\>': 'extends'}]
augroup END
" }}}
" tpope/vim-surround {{{

" To start operator-pending mode
nmap <M-s> <Plug>Ysurround

" To surround from visual mode w/ shortcut.
" Note that there's no {
vmap s <Plug>VSurround
vmap ( <Plug>VSurround(
vmap [ <Plug>VSurround[
vmap ' <Plug>VSurround'
" vmap " <Plug>VSurround"
vmap ` <Plug>VSurround`

" }}}
" moonscript {{{

if isdirectory(expand('~/.luarocks/bin')) && $PATH !~ 'luarocks'
  let $PATH = expand('~/.luarocks/bin') . ':' . $PATH
endif
let g:quickrun_config.moon = {
      \ 'command': 'moon'
      \ }
let g:quickrun_config['moon/moonc'] = {
      \ 'exec': '%c %o %s:.',
      \ 'command': 'moonc',
      \ 'cmdopt': '-p'}

" moonscript on vim
"let g:quickrun_config['moon/vim'] = {
"      \ 'exec': ['moonc -p ']
"      \ 'command': '',
"      \ 'hook/eval/template': "echo %s",
"      \ 'runner': 'vimscript',
"      \ }

" }}}
" tyru/caw.vim {{{
let g:caw_no_default_keymappings = 1
nmap <M-.> <Plug>(caw:i:toggle)
nmap <M-,> <Plug>(caw:i:uncomment)
vmap <M-.> <Plug>(caw:i:toggle)gv
vmap <M-,> <Plug>(caw:i:uncomment)gv
" }}}
" vitalista.vim {{{
function! s:vitalista() abort
  if empty(neobundle#get('vital.vim'))
    call g:V.import('Vim.Message').error('vital.vim not installed globally.')
    return
  endif

  if &l:path =~ 'vital.vim'
    return
  endif
  let &l:path .= printf(
        \ ',%s/autoload/vital/__latest__/',
        \ neobundle#get('vital.vim').path)
  let &l:suffixesadd = '.vim'
  let &l:includeexpr = 'substitute(v:fname, "\\.", "/", "g")'
  let &l:include = '^\s*let\s\+s:\w\+\s*=\s*.\{-}\%(import\|load\)'
endfunction

augroup vitalista
  autocmd!
  " autocmd FileType vim call <SID>vitalista()
augroup END

" }}}
" clang_complete.vim {{{

" from neocomplete's doc
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
"let g:clang_use_library = 1

" mine
let g:clang_user_options = '-std=c++11'


imap <C-l> <Plug>(neocomplete_start_unite_complete)

" }}}
" d.vim {{{
augroup vimrc-d
  autocmd!
  autocmd FileType d setl expandtab shiftwidth=4 tabstop=4 softtabstop=4
augroup END
" }}}
" textobj-wiw {{{

" doesn't seem to be working though...
xmap ,w <Plug>(textobj-wiw-n)
xmap ,e <Plug>(textobj-wiw-p)
omap ,w <Plug>(textobj-wiw-n)
omap ,e <Plug>(textobj-wiw-p)
nmap ,w <Plug>(textobj-wiw-n)

" }}}
" unite-include-reversed {{{
nnoremap <Space>0 :<C-u>source /home/ujihisa/Dropbox/vimbundles/unite-include-reversed/autoload/unite_include_reversed.vim<Cr>:call unite_include_reversed#identifiers()<Cr>
" }}}
" paredit from slimv {{{

" let g:paredit_electric_return = 1
let g:paredit_smartjump = 1

" Don't use all the shortmaps, but use some of them.
let g:paredit_shortmaps = 0
" with different key
augroup vimrc-paredit-clojure
  " (aa bb cc )  anywhere in the expr
  " ->
  " (aa bb cc)
  "          ^
  function! s:expredit_normalize()
    call PareditSmartJumpClosing(0)
    execute 'normal!' "geli\<Cr>\<Esc>kJ"
  endfunction

  " (aa)(b)  or (aa )(b)
  "    ^            ^
  " ->
  " (aa (b))
  function! s:expredit_moveright()
    call s:expredit_normalize()
    execute 'normal!' "a\<Space>\<Esc>h"
    call PareditMoveRight()
  endfunction
  autocmd!
  autocmd FileType clojure nmap <buffer> < ,<
  autocmd FileType clojure nnoremap <buffer> <M-9> :<C-u>silent call PareditMoveLeft()<Cr>
  autocmd FileType clojure inoremap <buffer> <M-9> <Esc>:<C-u>call PareditMoveLeft()<Cr>
  autocmd FileType clojure nmap <buffer> > ,>
  autocmd FileType clojure nnoremap <buffer> <M-0> :<C-u>silent call PareditMoveRight()<Cr>:<C-u>silent call poslist#move_pos(1)<CR>
  autocmd FileType clojure inoremap <buffer> <M-0> <Esc>:<C-u>silent call PareditMoveRight()<Cr>:<C-u>silent call poslist#move_pos(1)<CR>
  autocmd FileType clojure nmap <buffer> R ,W
  autocmd FileType clojure nmap <buffer> S ,S
augroup END


" nnoremap <M-0> :<C-u>echo synIDattr(synID(line("."), col("."), 0), "name")<Cr>
" inoremap <M-0> <Esc>:echo synIDattr(synID(line("."), col("."), 0), "name")<Cr>

" nnoremap <M-o> O

" }}}
" slimv {{{
let g:slimv_disable_clojure = 1
" }}}
" ansible gf {{{

function! Vimrc_ansible_includeexpr(fname)
  let isfname_bak = &g:isfname
  let &g:isfname = &g:isfname . ',32,{,}' " 32 is space
  let memo = expand('<cfile>')
  let memo = substitute(memo, '{{ basedir }}', expand('%:h/../../..'), '')
  for env in ['vagrant', 'dev', 'stage', 'production']
    let tmp = substitute(memo, '{{ env }}', env, '')
    echomsg string([filereadable(tmp), tmp])
    if filereadable(tmp)
      let memo = tmp
      break
    endif
  endfor
  " echomsg string([isfname_bak, &g:isfname, memo])
  let &g:isfname = isfname_bak
  return memo
endfunction

augroup vimrc-ansible
  autocmd!
  " the autocmd is very rough.
  autocmd FileType yaml let &l:includeexpr = 'Vimrc_ansible_includeexpr(v:fname)'
augroup END

" }}}
" Spanish {{{
inoremap <M-?> ¿
inoremap <M-1> ¡
" }}}
" mysql {{{
function! HootsuiteMysqlQuickrunSetup()
  if &l:filetype !=# 'mysql'
    echoerr printf('filetype is not mysql: %s', &l:filetype)
    return
  endif

  if !has_key(t:, 'vimrc_mysql_password')
    let t:vimrc_mysql_password = inputsecret('password: ')
  endif

  let b:quickrun_config = {
        \ 'exec': 'cat %s | %c %o %a',
        \ 'command': 'mysql',
        \ 'cmdopt': printf(
        \   '-h 127.0.0.1 -P 3306 -u uji -p --password=%s hootsuite',
        \   t:vimrc_mysql_password)
        \ }
endfunction
" }}}
" manga-brightest {{{
let g:brightest#highlight = {
      \   "group" : "BrightestUnderline"}
let g:brightest#pattern = '\k\+'
" }}}
" gentoo {{{

" gentoo's vim is terrible
let g:leave_my_textwidth_alone = 1

" }}}
" neoclojure {{{

augroup vimrc-neoclojure
  autocmd!
  autocmd FileType clojure setlocal omnifunc=neoclojure#complete#omni_auto
  autocmd FileType clojure nnoremap <Space><M-r> :<C-u>call neoclojure#killall()<Cr>
augroup END

" let g:neocomplete#sources#omni#functions = get(g:, 'neocomplete#sources#omni#functions', {})
" let g:neocomplete#sources#omni#functions.clojure = 'neoclojure#complete#omni_auto'

" let g:neocomplete#force_omni_input_patterns.clojure = '\.\|/'
let g:neocomplete#sources#omni#input_patterns = get(g:, 'neocomplete#sources#omni#input_patterns', {})
let g:neocomplete#sources#omni#input_patterns.clojure = '\.\|/'

let g:neoclojure_autowarmup = 1
" }}}
" calendar {{{
let g:calendar_first_day = 'sunday'
" }}}
" experimental {{{
function! s:experimental_start()
  let l:P = g:V.import('ProcessManager')
  let p = l:P.of('abcabc', 'ssh kokoro -tt /bin/bash')
  call p.reserve_wait(['.*\$\(\e[.\{-}m\)\? $'])
        \.reserve_writeln('ls; echo')
        \.reserve_read(['.*\$\(\e[.\{-}m\)\? $'])
  while 1
    let result = p.go_bulk()
    if result.done
      return [substitute(result.out, printf("^%s; echo\r\n", 'ls'), '', 'm'), result.err]
    elseif result.fail
      call p.shutdown()
      return
    endif
  endwhile
endfunction
" echo s:experimental_start()
" }}}
" incsearch + asterisk {{{

nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

map *   <Plug>(incsearch-nohl)<Plug>(asterisk-*)
map g*  <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)
map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)

map z*  <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)
map gz* <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)
map z#  <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)
map gz# <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)

" }}}
" PM3 (concproc) -- just for now {{{

" if 0
  function! s:cpcp() abort
    let s:V = vital#of('vital')
    let s:CP = s:V.import('ConcurrentProcess')

    let label = s:CP.of('sh -c "sleep 2; echo done"', '', [
          \ ['*read-all*', 'x']])
    echomsg string([s:CP.consume(label, 'x')])
    echomsg string([s:CP.consume_all_blocking(label, 'x', 3)])
  endfunction
  nnoremap <Space>[ :<C-u>call <SID>cpcp()<Cr>
" endif

" }}}
" cursorword {{{
augroup vimrc-cursorword
  autocmd!
  autocmd WinLeave * let b:cursorword = 0 | call cursorword#matchadd()
  autocmd WinEnter * let b:cursorword = 1
augroup END
" }}}
" kana-altr {{{
call altr#define('main/scala/**/%.scala', 'test/scala/**/%Test.scala')
call altr#define('src/%/%.clj', 'test/%/%_test.clj')

nmap <M-r> <Plug>(altr-forward)
imap <M-r> <Plug>(altr-forward)


" Experimental use of altr to create corresponding file

function! s:altr_guess_forward_file(bufname) abort
  for r in altr#_sort_rules(altr#_rule_table())
    let [matchedp, match] = altr#_match_with_buffer_name(r, a:bufname)
    if matchedp
      let placeholders = filter(match[1 :], 'len(v:val)')
      let forward = r['forward_pattern']
      for placeholder in placeholders
        let forward = substitute(forward, '%', placeholder, '')
      endfor
      return forward
    endif
  endfor
endfunction

function! s:altr_open_forward_file(bufname) abort
  let fname = s:altr_guess_forward_file(a:bufname)
  if len(fname)
    execute 'edit' fname
  endif
endfunction

nnoremap <M-R> :<C-u>call <SID>altr_open_forward_file(expand('%'))<Cr>

" }}}
" kana-operator-replace {{{
map _  <Plug>(operator-replace)
" }}}
" expand_region {{{
" nmap - <Plug>(expand_region_shrink)
" }}}
" ujihisa-scala {{{

function! s:ujihisa_scala_yank_current_package() abort
  let search_maxln = 3 " assumption: package declaration must be at line 1 to 3
  for i in range(1, search_maxln)
    let package = matchstr(getline(i), '^\s*package\s\+\zs.*')
    if len(package)
      break
    endif
  endfor

  if len(package)
    echo printf('Yanked %s', string(package))
    let @@ = package
  else
    echoerr printf('No package declaration found til line %d of this file!', search_maxln)
  endif
endfunction

command! -nargs=0 ScalaYankCurrentPackage call s:ujihisa_scala_yank_current_package()

" }}}
" neochat {{{
" }}}
" go {{{
let $GOPATH = expand('~/gopath')
let $PATH = printf('%s/bin:%s', $GOPATH, $PATH)
" }}}
"fatih/vim-go {{{

" enable af and if
let g:go_textobj_enabled = 1

augroup vimrc-go
  autocmd!
  autocmd FileType go setlocal nolist
augroup END
"}}}
" macvim {{{
if g:V.is_mac()
  augroup vimrc-macvim
    autocmd!
    autocmd BufEnter * set macmeta
  augroup END
endif
" }}}
" vim-sexp {{{

let g:sexp_mappings = {}

" Default is <M-k>
let g:sexp_mappings['sexp_swap_list_backward'] = ''
" Default is <M-j>
let g:sexp_mappings['sexp_swap_list_forward'] = ''
" Default is <M-h>
let g:sexp_mappings['sexp_swap_element_backward'] = ''
" Default is <M-j>
let g:sexp_mappings['sexp_swap_element_forward'] = ''

let g:sexp_mappings['sexp_round_head_wrap_list'] = '<M-i>'

" }}}
" {{{ GithubPRTemplate

" Returns a markdown-ish summary of your git commit messages
" (1) Extract all commits since the newest commit in the `origin`
" (2) Do some text processing, assuming commit messages are like this:
"       "Short summary\n\n* details"
" (3) Return multiple lines as a list of strings
function! s:github_pullreq_review_template() abort
  let git_log_text = vimproc#system('git log origin..HEAD')
  let result = []
  for line in split(git_log_text, "\n")
    if line =~# '^    \u'
      let result += ['* ' . line[4:]]
    elseif line =~# '^    $'
    elseif line =~# '^    '
      let result += [line]
    elseif line =~# '^commit'
    endif
  endfor
  return result
endfunction

function! s:GithubPRTemplate() abort
  let lines = s:github_pullreq_review_template()
  new
  setfiletype markdown
  call append(0, lines)
endfunction

command! -nargs=0 GithubPRTemplate call <SID>GithubPRTemplate()

" }}}
" neopairs {{{
let g:neopairs#enable = 1
" }}}
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
