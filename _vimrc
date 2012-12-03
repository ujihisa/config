" legacy pathogen {{{
" http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
  try
    call pathogen#helptags()
  catch /Duplicate tag/
    " do nothing
  endtry
end
" }}}
" active neobundle {{{
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=expand('~/.vimbundles/neobundle.vim')
  call neobundle#rc(expand('~/.vimbundles'))
endif

"NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/unite-ssh.git'
NeoBundle 'git://github.com/Shougo/unite-build.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/Shougo/vesting'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'git://gist.github.com/187578.git', {'directory': 'h2u_white'}
NeoBundle 'tsukkee/lingr-vim'
NeoBundle 'thinca/vim-ft-clojure'
"NeoBundle "osyo-manga/shabadou.vim"
"NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle 'kana/vim-tabpagecd', {'directory': 'tabpagecd'}
NeoBundle 'kana/vim-filetype-haskell', {'directory': 'filetype-haskell'}
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'veloce/vim-aldmeris', {'directory': 'aldmeris'}
NeoBundle 'thinca/vim-quickrun', {'directory': 'quickrun'}
NeoBundle 'thinca/vim-poslist', {'directory': 'poslist'}
NeoBundle 'git://github.com/trapd00r/neverland-vim-theme.git'
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'pocket7878/presen-vim'
NeoBundle 'pocket7878/curses-vim'
NeoBundle 'thinca/vim-showtime', {'directory': 'showtime'}
NeoBundle 'thinca/vim-unite-history', {'directory': 'unite-history'}
NeoBundle 'chikatoike/concealedyank.vim'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'git://github.com/pasela/unite-webcolorname.git'
NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'vim-scripts/IndentAnything'
NeoBundle 'git@github.com:ujihisa/ref-hoogle.git'
NeoBundle 'vim-scripts/zenesque.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kossnocorp/perfect.vim'
NeoBundle 'git@github.com:ujihisa/tabpagecolorscheme.git'
NeoBundle 'fsouza/go.vim'

filetype plugin on
filetype indent on

"nnoremap snu :<C-u>Unite neobundle/update<Cr>
" }}}
" vimproc {{{
let g:V = vital#of('vital')
if g:V.is_mac()
  " TODO
else
  let g:vimproc_dll_path = expand('~/.vimbundles/vimproc/autoload/vimproc_unix.so')
  " '/home/ujihisa/vimproc2/autoload/vimproc_unix.so'
endif
" }}}
" settings {{{
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
set ignorecase
set smartcase
set number
set ruler
set autoindent
set nosmartindent
set nocindent
set shiftwidth=2
set tabstop=2
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
" set noequalalways " http://vim-users.jp/2009/06/hack31/ paradox: see 89
set t_Co=256
set cmdheight=3
" http://vim-users.jp/2009/06/hack32/
set directory-=.
" http://vim-users.jp/2010/07/hack162/
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif
set equalalways
set updatetime=500

" }}}
" mappings {{{
"let mapleader=" "
"let maplocalleader=' '

let g:transparency = 10
if g:V.is_mac()
  " for MacVim's bug
  nnoremap <Esc><Esc> :<C-u>set nohlsearch<Cr>:let &transparency = g:transparency<Cr><C-l>
else
  nnoremap <Esc><Esc> :<C-u>set nohlsearch<Cr>
end
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

command! -nargs=0 Amp execute 'normal!' printf('/\<%s\><Cr>', expand('<cword>'))
nnoremap & :<C-u>set hlsearch<Return>:Amp<Cr>


nnoremap -- :<C-u>e %:h<Cr>

omap <Space>p %
nmap <Space>p %
vmap <Space>p %

nnoremap vv <C-v>
nnoremap ]p p`[=`]

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

" for plugins rewrite j/k
nnoremap <C-j> j
nnoremap <C-k> k

nnoremap <Space>w :<C-u>write<Return>
nnoremap <Space>q :<C-u>quit<Return>
nnoremap <Space>Q :<C-u>quit!<Return>
nnoremap <Space>. :<C-u>OpenVimrcTab<Cr>
"nnoremap <Space>cz :<C-u>new ~/git/config/_zshrc<Cr>
"nnoremap <Space>ct :<C-u>new ~/git/config/_termtter.erb<Cr>
"nnoremap <Space>h :help<space>
"nnoremap <Space>] <C-w>]
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" inoremap <C-t> 「」<left>
" inoremap <C-t><C-t> 【】<left>

" undoable
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

inoremap <M-BS> <C-w>
cnoremap <M-BS> <C-w>

"nnoremap <Space>a  <Nop>
nnoremap <Space>aa  :<C-u>tabnew<CR>:pwd<Cr>:VimShell<Cr>
nnoremap <Space>an  :<C-u>tabnew<CR>:CD ~/<Cr>
"nnoremap <Space>ac  :<C-u>tabclose<CR>
nnoremap <silent> <Space>aj  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
nnoremap <silent> <D-j>      :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
nnoremap <silent> <A-j>      :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
if g:V.is_mac()
  inoremap <silent> <D-j>      <Esc>:execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
endif
inoremap <silent> <A-j>      <Esc>:execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
nnoremap <Space>ak  gT
nnoremap <D-k>  gT
nnoremap <A-k>  gT
if g:V.is_mac()
  inoremap <D-k>  <Esc>gT
endif
inoremap <A-k>  <Esc>gT

nnoremap Y y$
nnoremap co zo
nnoremap cc zc

" inoremap <expr><Tab> TabOrCompl()
" function! TabOrCompl()
"   return (col('.') == 1 || matchstr(getline('.'), '.', col('.')-2) == "\t") ? "\<C-q>\<Tab>" : "\<C-p>"
" endfunction

nnoremap <Space>s q:set filetype=
nnoremap <Space>sr :<C-u>set filetype=ruby<Cr>
"nnoremap <Space>sm :<C-u>set filetype=markdown<Cr>
"nnoremap <Space>sh :<C-u>set filetype=haskell<Cr>
"nnoremap <Space>sj :<C-u>set filetype=javascript<Cr>
nnoremap <Space>spp :<C-u>set filetype=php<Cr>i<?php<Cr>error_reporting(E_ERROR \| E_WARNING \| E_PARSE \| E_NOTICE \| E_STRICT);<Cr><esc>
"nnoremap <Space>shs :<C-u>set filetype=haskell<Cr>i{-# LANGUAGE OverloadedStrings #-}<Cr>import qualified Data.Text as T<Cr>import qualified Data.Text.IO as T<Cr><Cr>main = do<Cr>print $ <Esc>
nnoremap <Space>shs :<C-u>set filetype=haskell<Cr>imain = do<Cr>print $<Esc>
nnoremap <Space>ssl :<C-u>set filetype=scala<Cr>
nnoremap <Space>scl :<C-u>set filetype=clojure<Cr>

nnoremap <Space>b :w blogger:create
"let g:blogger_ruby_path = '/Users/ujihisa/git/ruby193/local/bin/ruby'
if filereadable("/Users/ujihisa/git/ruby200/local/bin/ruby")
  let g:blogger_ruby_path = "/Users/ujihisa/git/ruby200/local/bin/ruby"
else
  let g:blogger_ruby_path = "/home/ujihisa/git/ruby/local/bin/ruby"
endif
let g:blogger_gist = 0
nnoremap <Space>I $i
"nnoremap <Space>C $C
nnoremap X ^x
nnoremap cp Pjdd
nnoremap Q <nop>

nnoremap // /^
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

"}}}
" = for completion and <bs> for cancel {{{
inoremap <expr> = pumvisible() ? "\<C-n>" : '='
inoremap <expr> <Plug>(vimrc_bs) neocomplcache#close_popup() . (pumvisible() ? '' : "\<BS>")
imap <BS> <Plug>(vimrc_bs)
"function! s:wrapmap(key)
"  return pumvisible() ? "\<Plug>(vimrc_bs)" : a:key
"endfunction

"inoremap <expr> <s-space> pumvisible() ? neocomplcache#close_popup() . ' ' : ' '
" }}}
" Cr in Insert Mode always means newline {{{
function! CrInInsertModeAlwaysMeansNewline()
  "let a = (exists('b:did_indent') ? "\<C-f>" : "") . "\<CR>X\<BS>"
  let a = "\<CR>X\<BS>"
  return pumvisible() ? neocomplcache#close_popup() . a : a
endfunction
"inoremap <expr> <CR> pumvisible() ? neocomplcache#close_popup()."\<C-f>\<CR>X\<BS>" : "\<C-f>\<CR>X\<BS>"
inoremap <expr> <CR> CrInInsertModeAlwaysMeansNewline()
" }}}
" Flip Arguments {{{
"   f(a, b) to f(b, a) when your cursol is on '('.
function! FlipArguments()
  normal! y%
  let @" = split(system('flipper "' . @" . '"'), "\n")[0]
  execute "normal! %p\<C-o>d%"
endfunction
nnoremap <space>flip :<C-u>call FlipArguments()<Cr>
" }}}
" vimshell {{{
function! EmptyBufferP()
  return expand('%') == '' && !&modified
endfunction
"nnoremap <expr> <Space>v EmptyBufferP() ? ":<C-u>VimShell<Cr>" : ":<C-u>new<Cr>:VimShell<Cr>"
"nnoremap <expr> <Space>V EmptyBufferP() ? ":<C-u>VimShell<Cr>" : ":<C-u>vnew<Cr>:VimShell<Cr>"

"nmap <Space>V <Plug>(vimshell_split_switch)
"nmap <Space>v <Plug>(vimshell_switch)
nmap <Space>v <Plug>(vimshell_split_switch)
nnoremap <Space>V :<C-u>VimShellCreate -split<Cr>

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
let g:vimshell_split_command = 'split'
let g:vimshell_scrollback_limit = 2000
let g:vimshell_interactive_update_time = 400

augroup vimrc-vimshell
  autocmd!
  autocmd FileType vimshell call s:vimshell_local()
augroup END

function! s:vimshell_local()
  imap <buffer><expr> <BS>  pumvisible() ? "\<Plug>(vimrc_bs)" : "\<Plug>(vimshell_another_delete_backward_char)"
  nmap <buffer> j <Plug>(vimshell_next_prompt)
  nmap <buffer> k <Plug>(vimshell_previous_prompt)
  " deleting <Plug>(vimshell_delete_previous_output)
  nunmap <buffer> <C-k>
  nmap <buffer> <C-S-k> <Plug>(vimshell_delete_previous_output)
endfunction

autocmd FileType int-* call s:vimshell_iexe() " TODO
function! s:vimshell_iexe()
  "imap <buffer> <BS>  <Plug>(vimshell_int_another_delete_backward_char)
  nmap <buffer> j <Plug>(vimshell_int_next_prompt)
  nmap <buffer> k <Plug>(vimshell_int_previous_prompt)
endfunction

let g:vimshell_escape_colors = [
      \'#3c3c3c', '#ff6666', '#66ff66', '#ffd30a', '#1e95fd', '#ff13ff', '#1bc8c8', '#C0C0C0',
      \'#686868', '#ff6666', '#66ff66', '#ffd30a', '#6699ff', '#f820ff', '#4ae2e2', '#ffffff'
      \]

"let g:VimShell_UsePopen2 = 0

" experimental
vnoremap <Space>r :VimShellSendString<Cr>
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
" }}}
" MacBook Battery http://d.hatena.ne.jp/lurker/20060801/1154443551 {{{
command! Battery echo split(system("pmset -g ps | egrep -o '[0-9]+%'"), "\n")[0]
" }}}
" remote {{{
command! -nargs=1 RunOnVm !run_on_vm <args> %
" }}}
" Neocomplecache {{{
let g:neocomplcache_enable_at_startup = 1
"let g:NeoComplCache_EnableQuickMatch = 0
"inoremap <expr><silent><C-y> neocomplcache#undo_completion()
"let g:neocomplcache_manual_completion_length = 2
let g:neocomplcache_source_completion_length = {
      \ 'include_complete': 1}
let g:neocomplcache_source_rank = {
      \ 'include_complete': 11}
let g:neocomplcache_max_list = 200
let g:neocomplcache_max_keyword_width = 70
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_text_mode_filetypes = {}
let g:neocomplcache_text_mode_filetypes.markdown = 1
imap <C-l> <Plug>(neocomplcache_start_unite_complete)
" see also
"   * snippets section

autocmd FileType haskell nnoremap <buffer> <C-l> :<C-u>NeoComplCacheCachingGhc<Cr>
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_skip_auto_completion_time = "" " disabling it
" }}}
" thinca's local vimrc http://vim-users.jp/2009/12/hack112/ {{{
" Load settings for eacy location.
augroup vimrc-local
  autocmd!
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
command! -nargs=1 OpenRubydoc new ~/rubydoc/doctree/refm/api/src/<args>.rd
command! -nargs=0 Ctags call Ctags()

function! Ctags()
  let cmdname = globpath(&rtp, 'plugin/vimproc.vim') != '' ? 'VimProcBang' : '!'
  execute cmdname 'ctags -R'
  if globpath(&rtp, 'plugin/unite.vim') != ''
    NeoComplCacheCachingTags
  endif
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
  nnoremap ss :<C-u>Unite file_rec -default-action=vsplit -direction=rightbelow<Cr>
  nnoremap se :<C-u>Unite file_rec<Cr>
  nnoremap so :<C-u>Unite outline -auto-preview<Cr>
  nnoremap sc :<C-u>Unite colorscheme font -auto-preview<Cr>
  nnoremap sf :<C-u>Unite file -default-action=split<Cr>
  nnoremap sm :<C-u>Unite file_mru -default-action=split<Cr>
  nnoremap sb :<C-u>Unite buffer -default-action=split<Cr>
  "nnoremap sra :<C-u>Unite rake<Cr>
  nnoremap sre :<C-u>Unite ref/man ref/hoogle ref/pydoc -default-action=split<Cr>
  nnoremap su :<C-u>Unite history/command source command<Cr>
  "nnoremap sd :<C-u>Unite command<Cr>
  nnoremap sp :<C-u>Unite process -no-split<Cr>
  nnoremap sq :<C-u>UniteClose build<Cr>
  nnoremap <space>R :<C-u>Unite quicklearn -immediately<Cr>
  nnoremap <space>M :Unite -buffer-name=build -no-focus build::
  nnoremap <space>m :<C-u>write<Cr>:Unite -buffer-name=build -no-focus build:<Cr>
endif
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 1

" g:unite_source_file_rec_ignore_pattern is deprecated
"let g:unite_source_file_rec_ignore_pattern = 'phpdoc\|\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|dll\|bak\|sw[po]\|class\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)'
call unite#custom_source('file_rec', 'ignore_pattern', '\$global\|\.class$')

let g:unite_quick_match_table = {
      \'a' : 1, 's' : 2, 'd' : 3, 'f' : 4, 'g' : 5, 'h' : 6, 'j' : 7, 'k' : 8, 'l' : 9, ':' : 10,
      \'q' : 11, 'w' : 12, 'e' : 13, 'r' : 14, 't' : 15, 'y' : 16, 'u' : 17, 'i' : 18, 'o' : 19, 'p' : 20,
      \'1' : 21, '2' : 22, '3' : 23, '4' : 24, '5' : 25, '6' : 26, '7' : 27, '8' : 28, '9' : 29, '0' : 30,
      \}
" in other words, it just swaps : and ;

function! s:unite_my_settings()"{{{
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! iunmap <buffer> <Up>
  silent! iunmap <buffer> <Down>

  " swapping q and Q
  nmap <buffer> Q <Plug>(unite_exit)
  nmap <buffer> q <Plug>(unite_all_exit)
endfunction"}}}
augroup vimrc-unite
  autocmd!
  autocmd FileType unite call s:unite_my_settings()
augroup END
" }}}
augroup MyVim " {{{
  autocmd!
  if has('gui_running')
    autocmd FileType vim nnoremap <buffer> gs :<C-u>source %<Cr>:source $MYGVIMRC<Cr>
  else
    autocmd FileType vim nnoremap <buffer> gs :<C-u>source %<Cr>
  endif
augroup END
" }}}
" Big and Man {{{
command! Big wincmd _ | wincmd |
" }}}
" fuzzyfinder {{{
if 0
nnoremap <silent> <Space>ff :<C-u>FuzzyFinderFile<Cr>
nnoremap <silent> <Space>fm :<C-u>FuzzyFinderMruFile<Cr>
nnoremap <silent> <Space>fr :<C-u>FuzzyFinderBuffer<Cr>
if !exists('g:FuzzyFinderOptions')
  let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}
  let g:FuzzyFinderOptions.Base.key_open = '<C-j>'
  let g:FuzzyFinderOptions.Base.key_open_split = '<Space>'
  let g:FuzzyFinderOptions.Base.key_open_vsplit = '<CR>'
endif
endif
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
"legacy {{{
"set formatoptions=tcq
" http://subtech.g.hatena.ne.jp/secondlife/20080603/1212489817
"let git_diff_spawn_mode=1
"}}}
" for git {{{
augroup MyGit
  autocmd!
  autocmd BufWinEnter,BufNewFile COMMIT_EDITMSG set filetype=git
augroup END
let g:git_diff_spawn_mode = 2
" }}}
" command! GitGol call s:git_gol() " {{{
" function! s:git_gol()
"   vnew
"   read!for i in $(git log --pretty=oneline | head -n 10 | cut -d ' ' -f 1); do git show $i --color-words; done
" endfunction
" }}}
" motemen's escape sequence {{{
function! HighlightConsoleCodes()
    0
    let register_save = @"
    while search('^[\[[0-9;]*m', 'c')
        normal! dfm

        let [lnum, col] = getpos('.')[1:2]
        if len(getline('.')) == col
            let col += 1
        endif
        let syntax_name = 'ConsoleCodeAt_' . bufnr('%') . '_' . lnum . '_' . col
        execute 'syntax region' syntax_name 'start=+\%' . lnum . 'l\%' . col . 'c+ end=+\%$+' 'contains=ALL'

        let highlight = ''
        for color_code in split(matchstr(@", '[0-9;]\+'), ';')
            if color_code == 0
                let highlight .= ' ctermfg=NONE ctermbg=NONE'
            elseif color_code == 1
                let highlight .= ' cterm=bold'
            elseif 30 <= color_code && color_code <= 37
                let highlight .= ' ctermfg=' . (color_code - 30)
            elseif color_code == 38
                " TODO
            elseif color_code == 39
                " TODO
            elseif 40 <= color_code && color_code <= 47
                let highlight .= ' ctermbg=' . (color_code - 40)
            elseif color_code == 49
                " TODO
            endif
        endfor
        if len(highlight)
            execute 'highlight' syntax_name highlight
        endif
    endwhile
    let @" = register_save
    0
endfunction


autocmd BufRead,StdinReadPost * if search('^[[\d*m', 'n') | call HighlightConsoleCodes() | set buftype=nofile nomodifiable | endif
" `:set modifiable | undo | syntax clear' to revert
" }}}
augroup MySomething " {{{
  autocmd!
  autocmd BufWinEnter,BufNewFile *.io setfiletype io
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  autocmd BufWinEnter,BufNewFile *.tex.erb set filetype=tex.eruby


  " set filetype=twitter and then...
  autocmd FileType twitter inoremap <buffer> <silent> <Cr> <Esc>:execute '!twitter post "' . escape(getline('.'), '"!#%') . '" >&/dev/null &'<Cr>o

  "autocmd FileType mixiim inoremap <buffer> <CR> <Esc>2GdG:<C-u>MixiEchoGet<Cr>ddO
  "autocmd FileType mixispam inoremap <buffer> <Cr> <Esc>:<C-u>MixiEcho<Cr>o

  "autocmd FileType spamspam inoremap <buffer> <silent> <Cr> <Esc>:execute '!twitter post "' . escape(getline('.'), '"!#') . '" >&/dev/null &'<Cr>:<C-u>MixiEcho<Cr>o
augroup END
" }}}
augroup RubyTrunk " {{{
  autocmd!
  autocmd BufWinEnter,BufNewFile ~/git/ruby/*.c setl ts=8 noexpandtab
  autocmd BufWinEnter,BufNewFile ~/git/ruby/*.y setl ts=8 noexpandtab
  "autocmd BufWinEnter,BufNewFile ~/rubies/src/**/*.c setl ts=8 noexpandtab
augroup END
" }}}
"augroup RubySpec " {{{
"  autocmd!
"  autocmd BufWinEnter,BufNewFile ~/git/ruby-trunk/spec/rubyspec/*.rb
"        \ let b:quickrun_command =
"        \ '/usr/bin/ruby ~/git/ruby-trunk/spec/mspec/bin/mspec -t ~/rubies/bin/ruby192'
"        "\ '/usr/bin/ruby ~/git/ruby-trunk/spec/mspec/bin/mspec -t ~/git/ruby-trunk/ruby19/bin/ruby'
"augroup END
" }}}
" irb {{{
" augroup MyIRB
"   autocmd!
"   autocmd FileType irb inoremap <buffer> <silent> <Cr> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, '#=> ' + eval(v[v.line_number]).inspect)<Cr>jo
" augroup END
" nnoremap <Space>irb :<C-u>vnew<Cr>:setfiletype irb<Cr>
" }}}
" quickrun {{{ for mine
let g:quickrun_direction = 'rightbelow vertical'
let g:quickrun_no_default_key_mappings = 0 " suspend to map <leader>r

" nnoremap <Space>r :<C-u>call <SID>quickrun_of_buffer()<Cr>
" function! s:quickrun_of_buffer()
"   if !exists('b:quickrun_of_buffer')
"     let b:quickrun_of_buffer = ''
"   endif
"   echo 'QuickRun' b:quickrun_of_buffer
"   execute 'QuickRun' b:quickrun_of_buffer
" endfunction

" function! Quickrun_open_test_window()
"   new
"   setfiletype ruby
"   execute "normal <Plug>(quickrun)"
"   execute "normal <C-w>H<C-w>7_"
"   execute "normal <C-w>p"
"   q!
" endfunction
" }}}
" quickrun for thinca {{{
"nmap <Space>r :<C-u>QuickRun<Cr>
nmap <Space>r <Plug>(quickrun)

let g:quickrun_config = {}
let g:quickrun_config._ = {'runner': 'vimproc', 'split': 'below'}
let g:quickrun_config.coffee = {'command': 'coffee', 'exec': '%c -cpb %s'}

let g:quickrun_config.asm = {'command': 'gcc', 'exec': ['gcc %s -o ./aaaaa', './aaaaa', 'rm ./aaaaa']}
let g:quickrun_config['ruby.rspec'] = {'command': "spec -l {line('.')}"}
let g:quickrun_config.textile = {
      \ 'command': 'redcloth',
      \ 'tempfile': '%{tempname()}.textile',
      \ 'exec': ['%c %s > %s:p:r.html', 'open %s:p:r.html', 'sleep 1', 'rm %s:p:r.html'] }
"let g:quickrun_config.go = {
"\    'command': '8g',
"\    'exec': ['8g %s', '8l -o %s:p:r %s:p:r.8', '%s:p:r %a', 'rm -f %s:p:r']
"\  }
let g:quickrun_config['ruby'] = {'command': 'ruby'}
let g:quickrun_config['R'] = {'command': 'R', 'exec': ['%c -s --no-save -f %s', ':%s/.\b//g']}

let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'browser'
      \ }

" let g:quickrun_config['scala'] = {
"       \ 'cmdopt': g:quickrun#default_config.scala.cmdopt . ' -unchecked -cp .:' . join(reverse(split(vimproc#system('find ~/.ivy2/cache/ -name "*.jar"'), "\n")), ":")}
" ... to make it lazy

augroup vimrc-lazy-quickrun-scala
  autocmd!
  autocmd FileType scala if !has_key(g:quickrun_config, 'scala') |
        \ let g:quickrun_config['scala'] = {
        \   'cmdopt': g:quickrun#default_config.scala.cmdopt . ' -unchecked -cp .:' . join(reverse(split(vimproc#system('find ~/.ivy2/cache/ -name "*.jar"'), "\n")), ":")}
        \ | endif
augroup END

"let g:quickrun_config.haskell = {'exec': ['runghc ~/.vim/sortimport.hs %s > %s.tmp', 'mv %s.tmp %s', '%c %s -o %s:p:r'], 'command': 'runghc', 'runner': 'system'}

"     \ 'erlang': {
"     \   'command': 'escript',
"    +\   'exec': ['echo "#!escript\n%%%%! -smp enable -sname quickrun -mnesia debug verbose" > %s.tmp', 'cat %s >> %s.tmp', 'mv %s.tmp %s', '%c %s %a', ':call delete("%s.tmp")', ':call delete("%s")'],
"    +\   'tempfile': '{fnamemodify(tempname(), ":h")}/quickrun',
"     \ },


"call watchdogs#setup(g:quickrun_config)
"let g:watchdogs_check_BufWritePost_enable = 1

" }}}
" filetype aliases http://vim-users.jp/2010/04/hack138/ {{{
augroup FiletypeAliases
  autocmd!
  autocmd FileType js set filetype=javascript
  autocmd FileType cf set filetype=coffee
augroup END

" }}}
" for git-vim (motemen) {{{
"let g:git_command_edit = 'rightbelow vnew'
nnoremap <Space>gd :<C-u>GitDiff --no-prefix --cached<Enter>
nnoremap <Space>gD :<C-u>GitDiff --no-prefix<Enter>
nnoremap <Space>gs :<C-u>GitStatus<Enter>
nnoremap <Space>gS :<C-u>Git submodule foreach git status<Enter>
"nnoremap <Space>gl :<C-u>GitLog<Enter>
"nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>
if globpath(&rtp, 'plugin/shadow.vim') != ''
  nnoremap <Space>ga :<C-u>call GitAddBoth()<Enter>
else
  nnoremap <Space>ga :<C-u>GitAdd<Enter>
endif
nnoremap <Space>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Space>gc :<C-u>GitCommit<Enter>
nnoremap <Space>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Space>gp :<C-u>Git push
" }}}
" TeX Supports {{{
" F5 to --
"augroup LatexSuite
"  au LatexSuite User LatexSuiteFileType
"   \ imap <silent> <buffer> -- <Plug>Tex_FastEnvironmentInsert
"augroup END
" lates-suite is so evil. don't use it.

" LaTeX-Suite
let g:Tex_SmartKeyQuote = 0

" beamer.tex support
let g:Tex_FoldedSections = 'part,chapter,section,%%fakesection,frame,'
            \. 'subsection,subsubsection,paragraph'

" flymake/tex
"augroup FlymakeTex
"  autocmd!
"  autocmd BufWritePost *.tex silent !rake tex &>/dev/null &
"augroup END

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'bib,dvi'
let g:Tex_CompileRule_bib = 'bibtex $*.aux'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
if has('mac')
  let g:Tex_CompileRule_dvi = 'platex -kanji=utf8 -interaction=nonstopmode $*'
  let g:Tex_ViewRule_pdf = 'open'
else
  let g:Tex_CompileRule_dvi = '/opt/ptexlive/bin/platex -kanji=utf8 -interaction=nonstopmode $*'
  let g:Tex_ViewRule_pdf = 'acroread'
endif
" }}}
" misc {{{
augroup MyKeywordprg
  autocmd!
  autocmd FileType twitter setl keywordprg=dictionary
augroup END

" save with growl
"nnoremap <Space>w :<C-u>write<Return>:<C-u>silent !growlnotify -n vim -m '[write] %' >&/dev/null<Return>:echo expand('%')<Return>
"nnoremap <Space>q :<C-u>silent !growlnotify -n vim -m '[quit] %' >&/dev/null<Return>:<C-u>quit<Return>

"set cursorline
"set cursorcolumn
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
" for quicklaunch {{{
"let g:quicklaunch_commands = [
"      \   'ruby launch.rb',
"      \   'ls',
"      \   'ls -a',
"      \   'ls -l',
"      \   'ruby check_gmail.rb',
"      \   'twitter timeline',
"      \   'port outdated',
"      \   '',
"      \   '',
"      \   'tail -n 30 ~/.zsh_history'
"      \ ]
"for i in range(10)
"  execute "silent! nmap <unique> <Space>" . i . "  <Plug>(quicklaunch-" . i . ")"
"endfor
"silent! nmap <unique> <Space>l  <Plug>(quicklaunch-list)
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
" shell-like guyon cd {{{
"command! CD call CD()
"function! CD()
"  let b:old_dir = getcwd()
"  execute "lcd " . expand("%:p:h")
"endfunction
"command! CDB call CDB()
"function! CDB()
"  let tmp = getcwd()
"  execute "lcd " . b:old_dir
"  let b:old_dir = tmp
"endfunction " }}}
" open lib and corresponding test at a new tab {{{
command! -nargs=1 Lib  call s:open_lib_and_corresponding_test(<f-args>)

function! s:open_lib_and_corresponding_test(fname)
  execute 'tabnew lib/' . a:fname . '.rb'
  execute 'vnew spec/' . a:fname . '_test.rb'
  execute "normal \<Plug>(quickrun)\<C-w>J\<C-w>7_"
endfunction " }}}
" gist.vim {{{
let g:gist_clip_command = 'pbcopy'
" }}}
" color {{{
" colorscheme desert
" highlight Cursor ctermbg=black
" highlight Pmenu cterm=standout ctermfg=2 ctermbg=black
" highlight PmenuSel cterm=bold ctermfg=2 ctermbg=black
" highlight PmenuSbar ctermbg=0
" highlight StatusLine term=standout cterm=underline ctermfg=2
" highlight StatusLineNC cterm=underline
" highlight VertSplit cterm=NONE
" highlight LineNr ctermfg=2
" highlight TabLineFill ctermfg=0


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
" kana's smartword {{{

if 0
  if globpath(&rtp, 'autoload/smartword.vim') != ''
    map w  <Plug>(smartword-w)
    map b  <Plug>(smartword-b)
    map e  <Plug>(smartword-e)
    map ge  <Plug>(smartword-ge)
    noremap W  w
    "noremap B  b
    noremap E  e
    noremap gE ge
  endif
endif

" }}}
" Require secret password file {{{
if filereadable(expand('~/.vimrc_secret'))
  source ~/.vimrc_secret
endif
" This file should let following variables:
" Blogger.vim
"   * g:blogger_blogid
"   * g:blogger_email
"   * g:blogger_pass
"   * g:lingr_vim_user
"   * g:lingr_vim_password
" }}}
" XML, HTML completion {{{
"augroup MyXML
"  autocmd!
"  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
"augroup END
" }}}
" Rename (See Vim Hacks #17 {{{
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
" }}}
" C/C++ compiler {{{
if 0
augroup MyCompiler
  autocmd!

  " run save&compile
  autocmd Filetype c compiler gcc
  autocmd Filetype cpp compiler gcc
  autocmd Filetype c setl makeprg=gcc\ -Wall\ %\ -o\ %:r.o
  autocmd Filetype cpp setl makeprg=g++\ -Wall\ %\ -o\ %:r.o
  "autocmd Filetype c nmap <buffer> <Space>m :<C-u>w<Cr>:make<Cr>
  "autocmd Filetype cpp nmap <buffer> <Space>m :<C-u>w<Cr>:make<Cr>
augroup END
endif
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
" capslock.vim {{{
imap <C-a> <C-O><Plug>CapsLockToggle
"set statusline=...%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
" }}}
" Haskell Tag {{{
" see also: ~/bin/update-cabal-tags
set tag+=~/.cabal/tags
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
  imap     <buffer><expr><BS> col('.') == 1 ? "\<Plug>(vimrc_cmdwin_close)" : "\<Plug>(vimrc_bs)"

  inoremap <buffer><expr>: col('.') == 1 ? "VimProcBang " : col('.') == 2 && getline('.')[0] == 'r' ? "<BS>VimProcRead " : ":"
  "inoremap <buffer><expr> \  smartchr#one_of('~/', '\')
  inoremap <buffer><expr> \ pumvisible() ? neocomplcache#close_popup() : <SID>cmdwin_backslash()

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
function s:vimrc_few()
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

"function! unite#sources#locate#define()
"  return executable('locate') ? s:unite_source : []
"endfunction
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
command -nargs=0 ForFastCycle call ForFastCycle()
if 0
  nnoremap <D-j> :<C-u>ForFastCycle<Cr>
  nnoremap <D-k> :<C-u>qa!<Cr>
endif
" }}}
" Restart.vim {{{
let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages'
" }}}
let g:shadow_debug = 1
" PATH {{{
"command! -nargs=1 AddPath let $PATH="<args>:".$PATH
command! -nargs=1 AddPath   let $PATH = expand(<q-args>) . ':' .$PATH
"command! -nargs=1 AddPath0e let $PATH = $PATH . ':' . expand(<q-args>)

" if filereadable(expand('~/.zshrc'))
"   "execute 'let $PATH="' . system('zsh -c "source ~/.zshrc; echo -n \$PATH"') . '"'
"   let $PATH='/Users/ujihisa/git/ruby193/local/bin:/Users/ujihisa/git/ruby192/local/bin:/Users/ujihisa/git/ruby187/local/bin:/Users/ujihisa/git/jruby/bin:/usr/local/bin:/Users/ujihisa/git/epitaph/bin:/Users/ujihisa/git/cbc/usr/bin:/Users/ujihisa/src/llvm/usr/bin:/Users/ujihisa/src/javacc-5.0/bin:/Users/ujihisa/.cabal/bin:/Users/ujihisa/.gem/jruby/1.8/bin:/Users/ujihisa/.gem/ruby/1.9/bin:/Users/ujihisa/.gem/ruby/1.8/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/ujihisa/git/jark:/Users/ujihisa/src/llvm-git-build/local/bin:/Users/ujihisa/Library/Haskell/bin:/Users/ujihisa/git/mdv:/Users/ujihisa/git/ruby193/local/bin:/Users/ujihisa/git/ruby192/local/bin:/Users/ujihisa/git/ruby187/local/bin:/Users/ujihisa/git/jruby/bin:/Users/ujihisa/git/epitaph/bin:/Users/ujihisa/git/cbc/usr/bin:/Users/ujihisa/src/llvm/usr/bin:/Users/ujihisa/src/javacc-5.0/bin:/Users/ujihisa/.cabal/bin:/Users/ujihisa/.gem/jruby/1.8/bin:/Users/ujihisa/.gem/ruby/1.9/bin:/Users/ujihisa/.gem/ruby/1.8/bin:/opt/local/bin:/opt/local/sbin:/Applications/MacVim.app/Contents/MacOS:/Users/ujihisa/bin/:/Users/ujihisa/appengine-java-sdk-1.2.1/bin:/Users/ujihisa/android-sdk-mac_x86-1.5_r2/tools/:/Users/ujihisa/git/termtter/bin:/Users/ujihisa/.gem/ruby/1.9.1/bin:/Users/ujihisa/bin/scala-2.6.0-final/:/Users/ujihisa/git/rubinius/local/bin:/Users/ujihisa/node_modules/coffee-script/bin/:/Users/ujihisa/git/git-hg/bin:/usr/local/Cellar/python/2.7.1/bin/:/Users/ujihisa/bin/:/Users/ujihisa/appengine-java-sdk-1.2.1/bin:/Users/ujihisa/android-sdk-mac_x86-1.5_r2/tools/:/Users/ujihisa/git/termtter/bin:/Users/ujihisa/.gem/ruby/1.9.1/bin:/Users/ujihisa/bin/scala-2.6.0-final/::/Users/ujihisa/git/rubinius/local/bin:/Users/ujihisa/node_modules/coffee-script/bin/:/Users/ujihisa/git/git-hg/bin:/usr/local/Cellar/python/2.7.1/bin/'
" else
  AddPath /usr/bin
  AddPath /usr/local/bin
  AddPath /sbin
  AddPath /usr/sbin
" endif

AddPath /Users/ujihisa/git/mdv
AddPath /Users/ujihisa/Library/Haskell/bin
if isdirectory('/Users/ujihisa/pear/bin/pear')
  AddPath /Users/ujihisa/pear/bin
endif
if isdirectory('/Users/ujihisa/src/llvm-git-build/local/bin')
  AddPath /Users/ujihisa/src/llvm-git-build/local/bin
endif
"if isdirectory('/Users/ujihisa/git/jark')
"  AddPath /Users/ujihisa/git/jark
"endif

if isdirectory(expand('~/git/ruby200/local/bin'))
  AddPath ~/git/ruby200/local/bin
endif

if isdirectory(expand('~/bin'))
  AddPath ~/bin
endif

if g:V.is_mac()
  AddPath /Users/ujihisa/git/termtter/bin
else
  AddPath /home/ujihisa/git/termtter/bin
  AddPath /home/ujihisa/git/ruby/local/bin
  AddPath /home/ujihisa/src/llvm-git-build/local/bin
  "AddPath /home/ujihisa/src/haskell-platform-2011.2.0.1/local/bin
  "AddPath /home/ujihisa/src/ghc-7.0.3/local/bin
  " AddPath /home/ujihisa/.cabal/bin
  "AddPath /home/ujihisa/git/ghc/local/bin
  AddPath /home/ujihisa/git/Gyazo-for-Linux/
endif
AddPath ~/git/leiningen/bin
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
let g:echodoc_hoogle_cache = {}
let s:doc_dict = {
      \ 'name': 'haskell',
      \ 'rank': 10,
      \ 'filetypes' : {'haskell': 1},
      \ }
function! s:doc_dict.search(cur_text)
  let tmp = matchlist(a:cur_text, "\\([a-z][a-z0-9.'_]*\\)\\s*$")
  let tmp = filter(tmp, 'v:val != ""')
  if len(tmp) == 2
    let query = tmp[1]
  else
    return []
  endif
  let result = s:haskell_type(expand('%'), query)
  if has_key(result, 'left')
    return []
  endif
  return [{'text': query, 'highlight': 'Identifier'}, {'text': ' :: ' . substitute(result.right, "\n", "", "")}]

  if mode() !=# 'i'
    echo a:cur_text
    let query .= neocomplcache#get_next_keyword()
  endif
  if len(query) < 3
    return []
  endif
  let the_type = s:hoogle(query)
  if split(the_type, ' ')[1] == query
    return [{'text': the_type}]
  else
    return []
  endif
endfunction
function! s:hoogle(cur_text)
  if !has_key(g:echodoc_hoogle_cache, a:cur_text)
    let g:echodoc_hoogle_cache[a:cur_text] = split(neocomplcache#system('hoogle ' . a:cur_text), "\n")[0]
  endif
  return g:echodoc_hoogle_cache[a:cur_text]
endfunction
call echodoc#register('haskell', s:doc_dict)
" }}}
" rsense {{{
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:rsenseUseOmniFunc = 1
"if filereadable(expand('~/git/rsense/bin/rsense'))
"  let g:rsenseHome = expand('~/git/rsense')
"
"  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"endif

if filereadable(expand('~/git/rsense/bin/rsense'))
  let g:neocomplcache#sources#rsense#home_directory = expand('~/git/rsense')
endif
" }}}
" testing neco-ghc {{{
"nnoremap <D-0> :<C-u>e ~/.vimbundles/neco-ghc/fixtures/a.hs<Cr>
" }}}
" vim-ref {{{
let g:ref_phpmanual_path = expand("~/src/php-chunked-xhtml/")
let g:ref_phpmanual_cmd = 'elinks -dump -dump-charset utf-8 -no-numbering -no-references %s' " charset is important
"let g:ref_man_cmd = "man -P cat"
let g:ref_erlang_manpath = '/usr/local/share/man'
let $MANPAGER='cat'
call ref#rmcache()
" }}}
" special git log viewer {{{
function! s:git_log_viewer()
  vnew
  "VimProcRead git log -u 'HEAD@{1}..HEAD' --reverse
  VimProcRead git log -u 'ORIG_HEAD..HEAD'
  set filetype=git-log.git-diff
  setl foldmethod=expr
  setl foldexpr=getline(v:lnum)!~'^commit'
endfunction
command! GitLogViewer call s:git_log_viewer()
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
nnoremap ` :!<C-u>setl list!<Cr>
" }}}
" too much t). I dont' use ). ) should be t). {{{
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(
" }}}
" hack 104 http://vim-users.jp/2009/11/hack104/ {{{
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
" }}}
" hootsuite {{{
"command! -nargs=0 HootSuiteVim new /Users/ujihisa/.vimbundles/hootsuite/plugin/hootsuite.vim
"command! -nargs=0 HootSuiteSpec new /Users/ujihisa/git/hstools/spec/committer.rb
" }}}
" MacVim is unko {{{
let rtp = split(&rtp, ',')
unlet rtp[index(rtp, '/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya')]
let &rtp = join(rtp, ',')
" }}}
" golden ratio {{{
command! -nargs=0 GoldenRatio execute 'vertical resize' &columns * 5 / 8
nnoremap <silent><Space>] :<C-u>GoldenRatio<Cr>
" }}}
" unite-launch {{{
let g:unite_launch_apps = [
      \ 'sbt compile',
      \ 'sbt clean update',
      \ 'git stash save && git pull --rebase && git stash pop',
      \ 'sbt test']
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
" vimerl {{{
let g:erlangManPath = '/usr/local/share/man'
"let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'
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
  nunmap <buffer> L
  nunmap <buffer> H
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
imap <expr> <Bslash> (pumvisible() && neosnippet#expandable() % 2 == 1) ?
      \ "\<Plug>(neosnippet_expand)" : '\'

nnoremap <C-s> :<C-u>Unite snippet<Cr>
imap <C-\> <Plug>(neosnippet_jump_or_expand)
smap <C-\> <Plug>(neosnippet_jump_or_expand)
nmap <C-\> a<C-\>
xmap <C-\> <Plug>(neosnippet_expand_target)

" uses system snippet as personal snippet!
let g:neosnippet#snippets_directory = '~/.vimbundles/neosnippet/autoload/neosnippet/snippets/'

" }}}
" vimshell platform-dependent aliases {{{
let s:is_gentoo = vimproc#system('uname -a') =~ 'gentoo'
function! s:vimshell_settings()
  if s:is_gentoo
    call vimshell#set_alias('time', 'exe time -p')
  else
    call vimshell#set_alias('eix', 'exe brew search')
  endif

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
" platform-dependencies {{{
if s:is_gentoo
  " col('$') <= col('.'): at the end of line or not, considering virtualedit.

  " it didn't work for some reason...
  " nnoremap <expr> <Plug>(vimrc-cmd-v-paste) col('$') <= col('.') ? '"+p' : '"+P'
  " inoremap <Plug>(vimrc-temporary-normal-mode) <C-o>
  " imap ö <Plug>(vimrc-temporary-normal-mode)<Plug>(vimrc-cmd-v-paste)
  imap <expr> ö col('$') <= col('.') ? '<C-o>"+p' : '<C-o>"+P'


  vnoremap ã "+y
  set lsp=2
endif
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
" coffeescript {{{
function! s:vimrc_coffeescript()
  setl sw=2
  setl sts=2
  setl expandtab
  setl list

  return

  function! JavaScriptUnderScoreBecomesCamelCase()
    if matchstr(getline('.'), '.', col('.')-2) =~ '\w'
      return "\<Plug>(stickykey-shift)"
    else
      return '_'
    endif
  endfunction!

  imap <buffer><expr> _ JavaScriptUnderScoreBecomesCamelCase()
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
command! -nargs=0 StartSBT execute 'VimShellInteractive sbt' | let t:sbt_bufname = bufname('%')

function! s:sbt_run()
  let cmds = get(t:, 'sbt_cmds', 'run')

  let sbt_bufname = get(t:, 'sbt_bufname')
  if sbt_bufname !=# ''
    call vimshell#interactive#set_send_buffer(sbt_bufname)
    call vimshell#interactive#send(cmds)
  else
    echoerr 'try StartSBT'
  endif
endfunction

function! s:vimrc_scala()
  nnoremap <buffer> <Space>m :<C-u>write<Cr>:call <SID>sbt_run()<Cr>
endfunction

augroup vimrc_scala
  autocmd!
  autocmd FileType scala call s:vimrc_scala()
  autocmd FileType scala nnoremap <buffer> <Space>st :<C-u>StartSBT
augroup END
" }}}
" clojure {{{

" for clojure.tools.cli/cli
let g:clojure#indent#special = '\<cli$'

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
vmap <M-c> <Plug>(vimrc-yankprefix-clipboard)<Plug>(operator-concealedyank)
" }}}
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
