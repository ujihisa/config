if exists("b:did_java_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_java_ujihisa_ftplugin = 1 " }}}

compiler javac
nnoremap <buffer> <space>m :<C-u>make %<Cr>

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker

