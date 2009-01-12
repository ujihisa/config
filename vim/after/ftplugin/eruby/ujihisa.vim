if exists("b:did_after_eruby_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_after_eruby_ujihisa_ftplugin = 1 " }}}

if expand('%:e:e') == 'tex.erb'
  "setl makeprg='platex -kanji=utf8 -interaction=nonstopmode $*'
  "if has('mac')
  "  let g:Tex_CompileRule_dvi = 'platex -kanji=utf8 -interaction=nonstopmode $*'
  "  let g:Tex_ViewRule_dvi = 'qlmanage -p'
  "else
  "  " TODO: auto change encoding
  "  let g:Tex_CompileRule_dvi = 'platex -kanji=euc -interaction=nonstopmode $*'
  "  let g:Tex_ViewRule_dvi = 'gv'
  "endif
  "setl makeprg=erb\ $*\ >\ tmp.tex\ &&\ platex\ -kanji=utf8\ -interaction=nonstopmode\ tmp

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
    return
  endfunction
  nnoremap <buffer> <Space>m :<C-u>call <SID>make()<Cr>
endif

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
