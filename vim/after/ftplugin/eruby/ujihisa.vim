if exists("b:did_after_eruby_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_after_eruby_ujihisa_ftplugin = 1 " }}}

if expand('%:e:e') == 'tex.erb'
  nnoremap <buffer> <Space>m :<C-u>call <SID>make()<Cr>
  function! s:make()
    " erb -> tex
    let tex_file = expand('%:t:r')
    compiler eruby
    silent make %
    redraw!
    cwindow

    " tex
    execute "silent !erb % > " . tex_file
    execute "new " . tex_file
    silent make %
    redraw!
    cwindow
  endfunction
endif

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
