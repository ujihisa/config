if exists("b:did_after_eruby_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_after_eruby_ujihisa_ftplugin = 1 " }}}

if expand('%:e:e') == 'tex.erb'
  nnoremap <buffer> <Space>m :<C-u>call <SID>make()<Cr>
  function! s:make()
    " erb -> tex
    let tex_file = expand('%:r') " a/b.tex.erb -> a/b.tex
    let tex_name = expand('%:t:r:r') " a/b.tex.erb -> b
    compiler eruby
    silent make %
    cwindow
    if 0 " FIXME: If there are errors then
      return
    endif

    " tex -> dvi
    execute "silent !erb % > " . tex_file
    execute "new " . tex_file
    lcd %:h
    silent make %
    setlocal bufhidden=unload
    setlocal nobuflisted
    setlocal buftype=nofile
    setlocal nomodifiable
    setlocal noswapfile
    redraw!
    cwindow

    " remove deadwoods
    call delete(tex_name . '.aux')
    call delete(tex_name . '.log')
    call delete(tex_name . '.tex')
  endfunction
endif

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
