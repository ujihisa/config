if exists("b:did_eruby_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_eruby_ujihisa_ftplugin = 1 " }}}

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
  compiler eruby
  echo expand('%:e:e')
  echo b:current_compiler
  setl filetype=eruby
endif

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
