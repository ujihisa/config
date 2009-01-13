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

" private functions {{{
function! s:make()
  let current_dir = getcwd()
  let original_fenc = s:file_encoding()
  if !has('mac')
    set fenc=ujis
    write!
  endif

  lcd %:h
  silent make %<
  cwindow
  redraw!

  if !empty(getqflist())
    wincmd p
  endif

  if !has('mac')
    execute "set fenc=" . original_fenc
    write!
  endif

  " dvi -> pdf
  "if filereadable(expand('%:r') . '.dvi')
  if empty(filter(getqflist(), 'v:val.valid'))
    silent! dvipdfmx %:r
  endif

  " remove deadwoods
  let basename = expand('%:r')
  for i in split(expand('*'), "\n")
    if i =~ basename && i != basename . '.tex' && i != basename . '.pdf'
      call delete(i)
    endif
  endfor

  execute "lcd " . current_dir
endfunction

function! s:file_encoding()
  if empty(&fileencoding)
    return &encoding
  endif
  return &fileencoding
endfunction
" }}}

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
