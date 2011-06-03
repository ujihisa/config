" pathogen {{{
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
" settings {{{
filetype plugin indent on
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
set noequalalways " http://vim-users.jp/2009/06/hack31/
set t_Co=256
set cmdheight=2
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
let maplocalleader=' '

"nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Cr>:let &transparency = g:transparency<Cr><C-l>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

"nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

"nnoremap <Space>c :<C-u>!wc %<Cr>

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

" for plugins rewrites j/k
nnoremap <C-j> j
nnoremap <C-k> k

nnoremap <Space>w :<C-u>write<Return>
nnoremap <Space>q :<C-u>quit<Return>
nnoremap <Space>Q :<C-u>quit!<Return>
nnoremap <Space>. :<C-u>OpenVimrcTab<Cr>
"nnoremap <Space>cz :<C-u>new ~/git/config/_zshrc<Cr>
"nnoremap <Space>ct :<C-u>new ~/git/config/_termtter.erb<Cr>
"nnoremap <Space>h :help<space>
"nnoremap <Space>n :<C-u>new<space>
"nnoremap <Space>] <C-w>]
noremap <Space>j <C-f>
noremap <Space>k <C-b>

inoremap <C-t> 「」<left>
inoremap <C-t><C-t> 【】<left>

inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

inoremap <M-BS> <C-w>
cnoremap <M-BS> <C-w>

"nnoremap <Space>a  <Nop>
nnoremap <Space>aa  :<C-u>tabnew<CR>:pwd<Cr>:VimShell<Cr>
nnoremap <Space>an  :<C-u>tabnew<CR>:CD ~/<Cr>
"nnoremap <Space>ac  :<C-u>tabclose<CR>
nnoremap <Space>aj  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
nnoremap <F10>      :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>:redraw<CR>
nnoremap <Space>ak  gT
nnoremap <F9>       gT

nnoremap Y y$
nnoremap co zo
nnoremap cc zc

inoremap <expr><Tab> TabOrCompl()
function! TabOrCompl()
  return (col('.') == 1 || matchstr(getline('.'), '.', col('.')-2) == "\t") ? "\<C-q>\<Tab>" : "\<C-p>"
endfunction

nnoremap <Space>s q:set filetype=
nnoremap <Space>sr :<C-u>set filetype=ruby<Cr>
"nnoremap <Space>sm :<C-u>set filetype=markdown<Cr>
"nnoremap <Space>sh :<C-u>set filetype=haskell<Cr>
"nnoremap <Space>sj :<C-u>set filetype=javascript<Cr>
nnoremap <Space>spp :<C-u>set filetype=php<Cr>i<?php<Cr>error_reporting(E_ERROR \| E_WARNING \| E_PARSE \| E_NOTICE \| E_STRICT);<Cr><esc>
nnoremap <Space>spn :<C-u>set filetype=python<Cr>

nnoremap <Space>b :w blogger:create
let g:blogger_ruby_path = '/Users/ujihisa/git/ruby192/local/bin/ruby'
let g:blogger_gist = 0
nnoremap <Space>I $i
nnoremap <Space>C $C
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

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
let g:vimshell_split_command = 'vnew'

autocmd FileType vimshell call s:vimshell_local()
function! s:vimshell_local()
  imap <buffer> <BS>  <Plug>(vimshell_another_delete_backward_char)
  nmap <buffer> j <Plug>(vimshell_next_prompt)
  nmap <buffer> k <Plug>(vimshell_previous_prompt)
  " deleting <Plug>(vimshell_delete_previous_output)
  nunmap <buffer> <C-k>
  nmap <buffer> <C-S-k> <Plug>(vimshell_delete_previous_output)
endfunction

autocmd FileType int-* call s:vimshell_iexe()
function! s:vimshell_iexe()
  "imap <buffer> <BS>  <Plug>(vimshell_int_another_delete_backward_char)
  nmap <buffer> j <Plug>(vimshell_int_next_prompt)
  nmap <buffer> k <Plug>(vimshell_int_previous_prompt)
endfunction
" }}}
" tag opens in a new window {{{
"if 0 " if you want to use gtags
"  function! s:tagjump_in_new_window()
"    if filereadable("GTAGS")
"      sp
"      GtagsCursor
"    else
"      execute "normal! \<C-w>\<C-]>"
"    endif
"  endfunction
"
"  function! s:tagjump_or_cr()
"    if bufname('%') == '[Command Line]' || &buftype == 'quickfix'
"      execute "normal! \<Cr>"
"    else
"      if filereadable("GTAGS")
"        GtagsCursor
"      else
"        execute "normal! \<C-]>"
"      endif
"    endif
"  endfunction
"  let Gtags_OpenQuickfixWindow = 0
"else
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
" {{{ thinca/poslist.vim
nmap <C-o> <Plug>(poslist_prev)
nmap <C-i> <Plug>(poslist_next)
" }}}
" MacBook Battery http://d.hatena.ne.jp/lurker/20060801/1154443551 {{{
command! Battery echo split(system("pmset -g ps | egrep -o '[0-9]+%'"), "\n")[0]
" }}}
" Backslashes in the commands :e and :cd are ~/ {{{
"function! HomedirOrBackslash()
"  if getcmdtype() == ':'
"    for i in split('e cd CD new vnew so', ' ')
"      if getcmdline() =~# printf('^%s ', i)
"        return '~/'
"      endif
"    endfor
"    if getcmdline() =~# '^?\?!'
"      return '~/'
"    endif
"  endif
"  return '\'
"endfunction
"cnoremap <expr> <Bslash> HomedirOrBackslash()

"cnoremap <expr> \  smartchr#one_of('~/', '\')
" }}}
" http://vim-users.jp/2009/11/hack96/ {{{
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif

"}}}
" remote {{{
command! -nargs=1 RunOnVm !run_on_vm <args> %
" }}}
" Neocomplecache {{{
let g:neocomplcache_enable_at_startup = 1
"let g:NeoComplCache_EnableQuickMatch = 0
"cnoreabbrev ne NeoComplCacheEnable
"inoremap <expr><silent><C-y> neocomplcache#undo_completion()
"if !exists('g:NeoComplCache_OmniPatterns')
"  let g:NeoComplCache_OmniPatterns = {}
"endif
" below is the copy from ruby's.
"let g:NeoComplCache_OmniPatterns.haskell = '[^. *\t]\.\h\w*'
"let g:NeoComplCache_CachingDisablePattern = '\[Command line\]'
"let g:neocomplcache_manual_completion_length = 2
let g:neocomplcache_max_list = 200
let g:neocomplcache_max_keyword_width = 70
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_ignore_case = 0
"let g:neocomplcache_text_mode_filetypes = {
"      \ 'text': 0, 'help': 0, 'tex': 0, 'gitcommit': 0, 'nothing': 0}
let g:neocomplcache_text_mode_filetypes = {}
let g:neocomplcache_text_mode_filetypes.markdown = 1
imap <C-l> <Plug>(neocomplcache_start_unite_complete)
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
  TabpageCD ~/git/config
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
" rak {{{
command! -nargs=* Rak call Rak("<args>")
function Rak(args)
  new
  execute "r!rak --nocolour" a:args
  nnoremap <buffer> o :<C-u>sp<Cr>gf
endfunction

call altercmd#load()
command!
\ -bar -nargs=+
\ AlterCommandWrapper
\ CAlterCommand <args> | AlterCommand <cmdwin> <args>

AlterCommandWrapper rak Rak
" }}}
" unite {{{
if globpath(&rtp, 'plugin/unite.vim') != ''
  nnoremap ss :<C-u>Unite file_rec -default-action=split<Cr>
  nnoremap se :<C-u>Unite file_rec<Cr>
  nnoremap so :<C-u>Unite outline -auto-preview<Cr>
  nnoremap sc :<C-u>Unite colorscheme font -auto-preview<Cr>
  nnoremap sf :<C-u>Unite file -default-action=split<Cr>
  nnoremap sm :<C-u>Unite file_mru -default-action=split<Cr>
  nnoremap sb :<C-u>Unite buffer -default-action=split<Cr>
  nnoremap sra :<C-u>Unite rake<Cr>
  nnoremap sre :<C-u>Unite ref/man ref/hoogle ref/pydoc -default-action=split<Cr>
  nnoremap su q:Unite<Space>
  AlterCommandWrapper unite Unite
endif
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 1
let g:unite_cd_command = 'CD'

let g:unite_quick_match_table = {
      \'a' : 1, 's' : 2, 'd' : 3, 'f' : 4, 'g' : 5, 'h' : 6, 'j' : 7, 'k' : 8, 'l' : 9, ':' : 10,
      \'q' : 11, 'w' : 12, 'e' : 13, 'r' : 14, 't' : 15, 'y' : 16, 'u' : 17, 'i' : 18, 'o' : 19, 'p' : 20,
      \'1' : 21, '2' : 22, '3' : 23, '4' : 24, '5' : 25, '6' : 26, '7' : 27, '8' : 28, '9' : 29, '0' : 30,
      \}
" in other words, it just swaps : and ;

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! iunmap <buffer> <Up>
  silent! iunmap <buffer> <Down>
endfunction"}}}
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
AlterCommandWrapper big Big
AlterCommandWrapper man Man
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
"set formatoptions=tcq
" http://subtech.g.hatena.ne.jp/secondlife/20080603/1212489817
"let git_diff_spawn_mode=1
augroup MyGit
  autocmd!
  autocmd BufWinEnter,BufNewFile COMMIT_EDITMSG set filetype=git
augroup END
let g:git_diff_spawn_mode = 2

command! GitGol call s:git_gol() " {{{
function! s:git_gol()
  vnew
  read!for i in $(git log --pretty=oneline | head -n 10 | cut -d ' ' -f 1); do git show $i --color-words; done
endfunction
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
  autocmd BufWinEnter,BufNewFile ~/rubies/src/**/*.c setl ts=8 noexpandtab
augroup END
" }}}
augroup DrEnglish " {{{
  autocmd!
  autocmd BufWinEnter,BufNewFile ~/blog/dre/*.txt setl spell
  autocmd BufWinEnter,BufNewFile ~/blog/dre/*.txt nnoremap <buffer> <Space>y 3G"+yG
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
" irb
augroup MyIRB
  autocmd!
  autocmd FileType irb inoremap <buffer> <silent> <Cr> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, '#=> ' + eval(v[v.line_number]).inspect)<Cr>jo
augroup END
nnoremap <Space>irb :<C-u>vnew<Cr>:setfiletype irb<Cr>

" quickrun {{{ for mine
let g:quickrun_direction = 'rightbelow vertical'
let g:quickrun_no_default_key_mappings = 0 " suspend to map <leader>r
map <Space>r  <Plug>(quickrun)
"map <Space>r :<C-u>QuickRun<Cr>

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

"if !exists('g:quickrun_config')
"  let g:quickrun_config = {}
"endif
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner': 'vimproc', 'split': 'below'}
let g:quickrun_config.haskell = {
      \ 'command': 'ghc -package yaml -package yaml -package test-framework-hunit',
      \ 'tempfile': '{tempname()}.hs',
      \ 'exec': ['%c %s -o %s:p:r', '%s:p:r', 'rm %s:p:r'] }
let g:quickrun_config.haskell = {'command': 'runghc'}
let g:quickrun_config.asm = {'command': 'gcc', 'exec': ['gcc %s -o ./aaaaa', './aaaaa', 'rm ./aaaaa']}
let g:quickrun_config['ruby.rspec'] = {'command': "spec -l {line('.')}"}
let g:quickrun_config.textile = {
      \ 'command': 'redcloth',
      \ 'tempfile': '{tempname()}.textile',
      \ 'exec': ['%c %s > %s:p:r.html', 'open %s:p:r.html', 'sleep 1', 'rm %s:p:r.html'] }
"let g:quickrun_config.go = {
"\    'command': '8g',
"\    'exec': ['8g %s', '8l -o %s:p:r %s:p:r.8', '%s:p:r %a', 'rm -f %s:p:r']
"\  }
" }}}
let g:quickrun_config['ruby'] = {'command': 'ruby'}
let g:quickrun_config['R'] = {'command': 'R', 'exec': ['%c -s --no-save -f %s', ':%s/.\b//g']}
let g:quickrun_config['clojure'] = {'command': 'java -cp /Users/ujihisa/git/clojure/clojure.jar clojure.main'}

let g:quickrun_config['markdown'] = {
\   'command': 'pandoc',
\   'exec': ['%c -s -f markdown -t html -o %s:p:r.html %s', 'open %s:p:r.html', 'sleep 1', 'rm %s:p:r.html'],
\   'tempfile': '{tempname()}.md',
\   'outputter': 'null',
\ }

"     \ 'erlang': {
"     \   'command': 'escript',
"    +\   'exec': ['echo "#!escript\n%%%%! -smp enable -sname quickrun -mnesia debug verbose" > %s.tmp', 'cat %s >> %s.tmp', 'mv %s.tmp %s', '%c %s %a', ':call delete("%s.tmp")', ':call delete("%s")'],
"    +\   'tempfile': '{fnamemodify(tempname(), ":h")}/quickrun',
"     \ },
let g:clj_highlight_builtins=1
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
nnoremap <Space>gl :<C-u>GitLog<Enter>
nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>
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
" F5 to --
"augroup LatexSuite
"  au LatexSuite User LatexSuiteFileType
"   \ imap <silent> <buffer> -- <Plug>Tex_FastEnvironmentInsert
"augroup END
" TeX Supports {{{

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
augroup MyKeywordprg
  autocmd!
  autocmd FileType twitter setl keywordprg=dictionary
augroup END

" save with growl
"nnoremap <Space>w :<C-u>write<Return>:<C-u>silent !growlnotify -n vim -m '[write] %' >&/dev/null<Return>:echo expand('%')<Return>
"nnoremap <Space>q :<C-u>silent !growlnotify -n vim -m '[quit] %' >&/dev/null<Return>:<C-u>quit<Return>

"set cursorline
"set cursorcolumn

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
" kana's tabpagecd with my fix {{{
"let s:TRUE = 1
"augroup MyAutoCmd
"  autocmd!
"augroup END
"
"command! -complete=customlist,s:complete_cdpath -nargs=+ CD  TabpageCD <args>
"function! s:complete_cdpath(arglead, cmdline, cursorpos)
"  return split(globpath(&cdpath,
"  \                     join(split(a:cmdline, '\s', s:TRUE)[1:], ' ') . '*/'),
"  \            "\n")
"endfunction
"
"AlterCommandWrapper cd  CD
"" TabpageCD - wrapper of :cd to keep cwd for each tabpage
"
"command! -nargs=? TabpageCD
"\   execute 'cd' fnameescape(<q-args>)
"\ | let t:cwd = getcwd()
"
"autocmd MyAutoCmd TabEnter *
"\   if !exists('t:cwd')
"\ |   let t:cwd = getcwd()
"\ | endif
"\ | execute 'cd' fnameescape(t:cwd)
" }}}
" shougo's tabpagecd {{{
" Each tab has current directory
command! -bar -complete=dir -nargs=?
      \   CD
      \   TabpageCD <args>
command! -bar -complete=dir -nargs=?
      \   TabpageCD
      \   execute 'cd' fnameescape(expand(<q-args>))
      \   | let t:cwd = getcwd()

autocmd TabEnter *
      \   if exists('t:cwd') && !isdirectory(t:cwd)
      \ |     unlet t:cwd
      \ | endif
    \ | if !exists('t:cwd')
      \ |   let t:cwd = getcwd()
      \ | endif
    \ | execute 'cd' fnameescape(expand(t:cwd))

" Exchange ':cd' to ':TabpageCD'.
"cnoreabbrev <expr> cd (getcmdtype() == ':' && getcmdline() ==# 'cd') ? 'TabpageCD' : 'cd'

AlterCommandWrapper cd  CD
"}}}
" open lib and corresponding test at a new tab {{{
command! -nargs=1 Lib  call s:open_lib_and_corresponding_test(<f-args>)
AlterCommandWrapper lib Lib
function! s:open_lib_and_corresponding_test(fname)
  execute 'tabnew lib/' . a:fname . '.rb'
  execute 'vnew spec/' . a:fname . '_test.rb'
  execute "normal \<Plug>(quickrun)\<C-w>J\<C-w>7_"
endfunction " }}}
" for textobj-indent
omap ii ii<C-o>

let g:gist_clip_command = 'pbcopy'
" color {{{
colorscheme desert
highlight Cursor ctermbg=black
highlight Pmenu cterm=standout ctermfg=2 ctermbg=black
highlight PmenuSel cterm=bold ctermfg=2 ctermbg=black
highlight PmenuSbar ctermbg=0
highlight StatusLine term=standout cterm=underline ctermfg=2
highlight StatusLineNC cterm=underline
highlight VertSplit cterm=NONE
highlight LineNr ctermfg=2
highlight TabLineFill ctermfg=0


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
AlterCommandWrapper leftspace LeftSpace
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
" replace v_p {{{
vnoremap p :<C-u>call <SID>yank_paste_without_yanking()<CR>
function! s:yank_paste_without_yanking()
  let a = @"
  normal! gvp
  let @" = a
endfunction " }}}
" smartword {{{
if exists('*smartword#move') " It's a little bit tricky.
  map w  <Plug>(smartword-w)
  map b  <Plug>(smartword-b)
  map e  <Plug>(smartword-e)
  map ge  <Plug>(smartword-ge)
  noremap W  w
  "noremap B  b
  noremap E  e
  noremap gE ge
endif
"nnoremap B :<C-u>edit %:h<Cr>

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
" }}}
" XML, HTML completion {{{
"augroup MyXML
"  autocmd!
"  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
"augroup END
" }}}
" Rename (See Vim Hacks #?? {{{
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
" }}}
" C/C++ semicolon support {{{
"function! s:smartsemicolon()
"  let s = getline('.')
"  if s != "" && match(s, '#.*\|.*//.*\|/\*\|\*/\|\s*$\|.*[;({},]$')
"    normal! a;
"  endif
"endfunction
"augroup MyCSemicolon
"  autocmd!
"  "autocmd Filetype c inoremap <buffer> <Cr> <C-o>:call <SID>smartsemicolon()<Cr><Cr>
"  "autocmd Filetype cpp inoremap <buffer> <Cr> <C-o>:call <SID>smartsemicolon()<Cr><Cr>
"
"  autocmd FileType c inoremap <buffer> : ;
"  autocmd FileType c inoremap <buffer> ; :
"
"  autocmd FileType cpp inoremap <buffer> : ;
"  autocmd FileType cpp inoremap <buffer> ; :
"augroup END
" }}}
" C/C++ compiler {{{
augroup MyCompiler
  autocmd!

  " run save&compile
  autocmd Filetype c compiler gcc
  autocmd Filetype cpp compiler gcc
  autocmd Filetype c setl makeprg=gcc\ -Wall\ %\ -o\ %:r.o
  autocmd Filetype cpp setl makeprg=g++\ -Wall\ %\ -o\ %:r.o
  autocmd Filetype c nmap <buffer> <Space>m :<C-u>w<Cr>:make<Cr>
  autocmd Filetype cpp nmap <buffer> <Space>m :<C-u>w<Cr>:make<Cr>

  " run splint
  autocmd Filetype c nmap <buffer> <Space>M :<C-u>!splint %<Cr>
  autocmd Filetype cpp nmap <buffer> <Space>M :<C-u>!splint %<Cr>
augroup END
" }}}
" vimshell supports {{{
let g:vimshell_escape_colors = [
      \'#3c3c3c', '#ff6666', '#66ff66', '#ffd30a', '#1e95fd', '#ff13ff', '#1bc8c8', '#C0C0C0',
      \'#686868', '#ff6666', '#66ff66', '#ffd30a', '#6699ff', '#f820ff', '#4ae2e2', '#ffffff'
      \]
let g:vimshell_split_command = 'split'
let g:vimshell_cd_command = 'TabpageCD'
let g:VimShell_UsePopen2 = 0
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
" PATH {{{
command! -nargs=1 AddPath let $PATH="<args>:".$PATH
AddPath /Users/ujihisa/git/mdv
AddPath /Users/ujihisa/Library/Haskell/bin
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
" = for completion and \ for cancel {{{
inoremap <expr> = pumvisible() ? "\<C-n>" : '='
inoremap <expr> \ pumvisible() ? neocomplcache#close_popup() : '\'
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
" No Command-line window by Shougo http://vim-users.jp/2010/07/hack161/ {{{
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

nmap :  <sid>(command-line-enter)
xmap :  <sid>(command-line-enter)

" I added
nnoremap q: q:<Esc>

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

function! s:init_cmdwin()
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  "inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  "I added
  inoremap <buffer><expr><BS> col('.') == 1 ? "\<ESC>:quit\<CR>" : pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr>: col('.') == 1 ? "VimProcBang " : col('.') == 2 && getline('.')[0] == 'r' ? "<BS>VimProcRead " : ":"
  "inoremap <buffer><expr> \  smartchr#one_of('~/', '\')
  inoremap <buffer><expr> \ pumvisible() ? neocomplcache#close_popup() : <SID>cmdwin_backslash()

  " Completion.
  "inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction
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
function! GuifontChanger()
  if !exists('s:guifont_changer_index')
    let s:guifont_changer_index = 0
  else
    let s:guifont_changer_index += 1
  endif
  if !exists('s:guifont_changer_list')
    let s:guifont_changer_list = [
          \ 'Andale Mono:h14',
          \ 'Menlo:h13',
          \ 'Inconsolata:h14',
          \ 'Handwriting - Dakota:h32',
          \ 'Handwriting - Dakota:h64',
          \ ]
  endif
  let font = s:guifont_changer_list[
        \ s:guifont_changer_index % len(s:guifont_changer_list)]
  let cmd = "set guifont=" . substitute(font, " ", "\\\\ ", 'g')
  execute cmd
  call WindowsizeMaximize13()
  echo cmd " for some reason it doesn't show up...
endfunction
"command! -nargs=0 GuifontChanger call GuifontChanger()
nnoremap <Space>ff :<C-u>call GuifontChanger()<Cr>
" }}}
" hitode909's Mac Screen Blackout {{{
command! MacScreen silent !osascript -e 'tell application "System Events" to key code 28 using {command down, option down, control down}'
" }}}
" few itself {{{
command! -nargs=0 Few QuickRun ruby /Users/ujihisa/git/few/bin/few
AlterCommandWrapper few Few
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
AlterCommandWrapper copythecurrentfilename CopyTheCurrentFileName
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
" FIXME
execute 'let $PATH="' . system('zsh -c "source ~/.zshrc; echo -n \$PATH"') . '"'
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
let g:rsenseUseOmniFunc = 1
if 0 && filereadable(expand('~/git/rsense/bin/rsense'))
  let g:rsenseHome = expand('~/git/rsense')

  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif
" }}}
" testing neco-ghc {{{
nnoremap <D-0> :<C-u>e ~/.vimbundles/neco-ghc/fixtures/a.hs<Cr>
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
  VimProcRead git log -u 'HEAD@{1}..HEAD' --reverse
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
nnoremap <C-d> :<C-u>call SGoDiff()<Cr>

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
command! -nargs=0 HootSuiteVim new /Users/ujihisa/.vimbundles/hootsuite/plugin/hootsuite.vim
command! -nargs=0 HootSuiteSpec new /Users/ujihisa/git/hstools/spec/committer.rb
" }}}
" MacVim is unko {{{
let rtp = split(&rtp, ',')
unlet rtp[index(rtp, '/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya')]
let &rtp = join(rtp, ',')
echo &rtp
" }}}
" golden ratio {{{
command! -nargs=0 GoldenRatio execute 'vertical resize' &columns * 5 / 8
nnoremap <Space>] :<C-u>GoldenRatio<Cr>
" }}}
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
