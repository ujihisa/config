if exists("b:did_tex_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_tex_ujihisa_ftplugin = 1 " }}}

" key mappings {{{
imap <buffer> :i <A-i>
imap <buffer> :l <A-l>
imap <buffer> :j <C-j>
imap <buffer> :5 <F5>
inoremap <buffer> :d $
inoremap <buffer> :p %
inoremap <buffer> :h ^
inoremap <buffer> :u _
inoremap <buffer> :[ {
inoremap <buffer> :] }
" }}}

"setl grepprg=grep\ -nH\ $*
"setl makeprg=rake

nnoremap <buffer> <Space>m :<C-u>Make<Cr>
command! Make call s:make()
if has('mac')
  command! Pdf execute '!open ' . expand('%:r:r') . '.pdf &'
else
  command! Pdf execute '!evince ' . expand('%:r:r') . '.pdf &'
endif
function! DotComma()
  %s/、/, /g
  %s/。/. /g
endfunction

" private functions {{{
function! s:make()
  let current_dir = getcwd()

  lcd %:h
  silent make %<
  cwindow
  redraw!

  if !empty(getqflist())
    wincmd p
  endif

  " dvi -> pdf
  "if empty(filter(getqflist(), 'v:val.valid'))
  if filereadable(expand('%:r') . '.dvi')
    silent ! dvipdfmx %:r
    redraw!
  endif

  " remove deadwoods
  let basename = expand('%:r')
  for i in split(expand('*'), "\n")
    if i =~ basename &&
          \ i != basename . '.tex' &&
          \ i != basename . '.pdf' &&
          \ i != basename . '.tex.erb'
      call delete(i)
    endif
  endfor

  execute "lcd " . current_dir
endfunction
" }}}

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
" vim: fenc=utf8