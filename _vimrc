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
syntax on
set wildmode=list:longest
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set hidden
set autoread
set title
set backspace=indent,eol,start
set modeline




" }}}
" mappings {{{
"let mapleader=" "
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

omap <Space>p %
nmap <Space>p %

nnoremap vv <C-v>
nnoremap ]p p`[=`]

nnoremap sh <C-w>h<C-w>80\|
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l<C-w>80\|
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

nnoremap <Space>w :<C-u>write<Return>
nnoremap <Space>q :<C-u>quit<Return>
nnoremap <Space>Q :<C-u>quit!<Return>
nnoremap <Space>. :<C-u>OpenVimrcTab<Cr>
nnoremap <Space>ort :<C-u>OpenRubyspecTab<Cr>
nnoremap <Space>cz :<C-u>new ~/git/config/_zshrc<Cr>
nnoremap <Space>ct :<C-u>new ~/git/config/_termtter.erb<Cr>
nnoremap <Space>h :help<space>
nnoremap <Space>n :<C-u>new<space>
nnoremap <Space>] <C-w>]
noremap <Space>j <C-f>
noremap <Space>k <C-b>

inoremap <C-t> 「」<left>
inoremap <C-t><C-t> 【】<left>
nnoremap ち a
inoremap <C-h> <left>
inoremap <C-l> <right>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

"nnoremap <Space>a  <Nop>
nnoremap <Space>an  :<C-u>tabnew<CR>
nnoremap <Space>ac  :<C-u>tabclose<CR>
nnoremap <Space>aj  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <Space>ak  gT

nnoremap Y y$
nnoremap co zo
nnoremap cc zc

inoremap <Tab> <C-n>
nnoremap <Space>s :setfiletype<Space>
nnoremap <Space>v :new ~/git/config/vim/
nnoremap <Space>I $i
nnoremap <Space>C $C
nnoremap X ^x
nnoremap cp Pjdd




"}}}

" My commands
command! -nargs=0 OpenVimrcTab tabnew ~/git/config/_vimrc | TabpageCD ~/git/config
command! -nargs=0 OpenRubyspecTab tabnew ~/git/ruby-trunk/spec/rubyspec/ | TabpageCD ~/git/ruby-trunk/spec/rubyspec/

" kana's AlternateCommand {{{
command! -nargs=* AlternateCommand  call s:cmd_AlternateCommand([<f-args>])
function! s:cmd_AlternateCommand(args)
  let buffer_p = (a:args[0] ==? '<buffer>')
  let original_name = a:args[buffer_p ? 1 : 0]
  let alternate_name = a:args[buffer_p ? 2 : 1]

  if original_name =~ '\['
    let [original_name_head, original_name_tail] = split(original_name, '[')
    let original_name_tail = substitute(original_name_tail, '\]', '', '')
  else
    let original_name_head = original_name
    let original_name_tail = ''
  endif
  let original_name_tail = ' ' . original_name_tail

  for i in range(len(original_name_tail))
    let lhs = original_name_head . original_name_tail[1:i]
    execute 'cnoreabbrev <expr>' lhs
    \ '(getcmdtype() == ":" && getcmdline() ==# "' . lhs  . '")'
    \ '?' ('"' . alternate_name . '"')
    \ ':' ('"' . lhs . '"')
  endfor
endfunction "}}}
command! SplitNicely  call s:split_nicely() " {{{
function! s:split_nicely()
  if 80*2 * 15/16 <= winwidth(0)  " FIXME: threshold customization
    vsplit
  else
    split
  endif
endfunction " }}}

augroup MyVim
  autocmd!
  autocmd FileType vim nnoremap <buffer> gs :source %<Cr>
augroup END

command! Big wincmd _ | wincmd |
AlternateCommand big Big
AlternateCommand man Man

AlternateCommand sp  SplitNicely
AlternateCommand vsp SplitNicely

" fuzzyfinder {{{
nnoremap <silent> <Space>ff :<C-u>FuzzyFinderFile<Cr>
nnoremap <silent> <Space>fm :<C-u>FuzzyFinderMruFile<Cr>
nnoremap <silent> <Space>fr :<C-u>FuzzyFinderBuffer<Cr>
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.Base.key_open = '<C-j>'
let g:FuzzyFinderOptions.Base.key_open_split = '<Space>'
let g:FuzzyFinderOptions.Base.key_open_vsplit = '<CR>'
" }}}


" smartchr
augroup MySmartchr
  autocmd!
  autocmd FileType javascript inoremap <expr> \  smartchr#one_of('function(', '\')
augroup END

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

" motemen's
command! -range=% Source split `=tempname()` | call append(0, getbufline('#', <line1>, <line2>)) | write | source % | bwipeout

" http://subtech.g.hatena.ne.jp/secondlife/20080603/1212489817
"let git_diff_spawn_mode=1
augroup MyGit
  autocmd!
  autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=git
augroup END
let g:git_diff_spawn_mode = 2

command! GitGol call s:git_gol()
function! s:git_gol()
  vnew
  read!for i in $(git log --pretty=oneline | head -n 10 | cut -d ' ' -f 1); do git show $i --color-words; done
endfunction

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


augroup MySomething
  autocmd!
  au BufRead,BufNewFile *.io setfiletype io
  autocmd BufRead,BufNewFile *_spec.rb setl filetype=ruby.rspec
  autocmd BufRead,BufNewFile *.tex.erb setl filetype=tex.eruby


  " set filetype=twitter and then...
  autocmd FileType twitter inoremap <buffer> <silent> <Cr> <Esc>:execute '!twitter post "' . escape(getline('.'), '"!#%') . '" >&/dev/null &'<Cr>o

  autocmd FileType mixiim inoremap <buffer> <CR> <Esc>2GdG:<C-u>MixiEchoGet<Cr>ddO
  autocmd FileType mixispam inoremap <buffer> <Cr> <Esc>:<C-u>MixiEcho<Cr>o

  autocmd FileType spamspam inoremap <buffer> <silent> <Cr> <Esc>:execute '!twitter post "' . escape(getline('.'), '"!#') . '" >&/dev/null &'<Cr>:<C-u>MixiEcho<Cr>o
augroup END

augroup RubyTrunk
  autocmd!
  autocmd BufRead,BufNewFile ~/git/ruby-trunk/*.c setl ts=8 noexpandtab
augroup END

augroup RubySpec
  autocmd!
  autocmd BufRead,BufNewFile ~/git/ruby-trunk/spec/rubyspec/*_spec.rb let b:quickrun_command = '~/git/ruby-trunk/spec/mspec/bin/mspec -t ~/git/ruby-trunk/ruby -I ~/git/ruby-trunk/ruby/.ext/i386-darwin9.6.0 -I ~/git/ruby-trunk/lib'
augroup END

" irb
augroup MyIRB
  autocmd!
  autocmd FileType irb inoremap <buffer> <silent> <Cr> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, '#=> ' + eval(v[v.line_number]).inspect)<Cr>jo
augroup END
nnoremap <Space>irb :<C-u>vnew<Cr>:setfiletype irb<Cr>

" quickrun
let g:quickrun_direction = 'rightbelow vertical'
nmap <Space>r  <Plug>(quickrun)
nmap <Space>R <Plug>(quickrun)<C-w>p
" function! Quickrun_open_test_window()
"   new
"   setfiletype ruby
"   execute "normal <Plug>(quickrun)"
"   execute "normal <C-w>H<C-w>7_"
"   execute "normal <C-w>p"
"   q!
" endfunction


" for git-vim (motemen) {{{
let g:git_command_edit = 'rightbelow vnew'
nnoremap <Space>gd :<C-u>GitDiff --cached<Enter>
nnoremap <Space>gD :<C-u>GitDiff<Enter>
nnoremap <Space>gs :<C-u>GitStatus<Enter>
nnoremap <Space>gl :<C-u>GitLog<Enter>
nnoremap <Space>ga :<C-u>GitAdd<Enter>
nnoremap <Space>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Space>gc :<C-u>GitCommit<Enter>
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
let g:quicklaunch_commands = [
      \   'ls',
      \   'ls -a',
      \   'ls -l',
      \   'ruby check_gmail.rb',
      \   'twitter timeline',
      \   'port outdated',
      \   '',
      \   '',
      \   '',
      \   'tail -n 30 ~/.zsh_history'
      \ ]
for i in range(10)
  execute "silent! nmap <unique> <Space>" . i . "  <Plug>(quicklaunch-" . i . ")"
endfor
silent! nmap <unique> <Space>l  <Plug>(quicklaunch-list)
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

" <space>ao move current buffer into a new tab.
nnoremap <silent> <Space>ao :<C-u>call <SID>move_window_into_tab_page(0)<Cr>

" via guyon
"command! CD execute ":lcd " . expand("%:p:h")

" shell-like guyon cd
command! CD call CD()
function! CD()
  let b:old_dir = getcwd()
  execute "lcd " . expand("%:p:h")
endfunction
command! CDB call CDB()
function! CDB()
  let tmp = getcwd()
  execute "lcd " . b:old_dir
  let b:old_dir = tmp
endfunction

" kana's tabpagecd {{{
let s:TRUE = 1
augroup MyAutoCmd
  autocmd!
augroup END

command! -complete=customlist,s:complete_cdpath -nargs=+ CD  TabpageCD <args>
function! s:complete_cdpath(arglead, cmdline, cursorpos)
  return split(globpath(&cdpath,
  \                     join(split(a:cmdline, '\s', s:TRUE)[1:], ' ') . '*/'),
  \            "\n")
endfunction

AlternateCommand cd  CD
" TabpageCD - wrapper of :cd to keep cwd for each tabpage  "{{{2

command! -nargs=? TabpageCD
\   execute 'cd' fnameescape(<q-args>)
\ | let t:cwd = getcwd()

autocmd MyAutoCmd TabEnter *
\   if !exists('t:cwd')
\ |   let t:cwd = getcwd()
\ | endif
\ | execute 'cd' fnameescape(t:cwd)
" }}}
" }}}
"
" open lib and corresponding test at a new tab {{{
command! -nargs=1 Lib  call s:open_lib_and_corresponding_test(<f-args>)
AlternateCommand lib Lib
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

command! LeftSpace call s:left_space()
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
AlternateCommand leftspace LeftSpace

command! Say silent execute '!say "' . escape(getline('.'), '"') . '" &>/dev/null &'
augroup SayCurrentLine
  autocmd!
  autocmd FileType say nnoremap <buffer> j j:Say<Cr>
  autocmd FileType say nnoremap <buffer> k k:Say<Cr>
augroup END

command! -nargs=0 LeadUnderscores %s/^\s*/\=repeat('_', strlen(submatch(0)))/g

" replace v_p {{{
vnoremap p :<C-u>call <SID>yank_paste_without_yanking()<CR>
function! s:yank_paste_without_yanking()
  let a = @"
  normal! gvp
  let @" = a
endfunction " }}}

" smartword {{{
map w  <Plug>(smartword-w)
map b  <Plug>(smartword-b)
map e  <Plug>(smartword-e)
map ge  <Plug>(smartword-ge)
noremap W  w
noremap B  b
noremap E  e
noremap gE ge
" }}}

" Require secret password file
source ~/.vimrc_secret
" This file should let following variables:
"   * For blogger.vim
"     g:Blog_URI
"     g:Blog_ID
"     g:Gmail_Account
"     g:Gmail_Password
"     g:Blog_Use_Markdown

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
