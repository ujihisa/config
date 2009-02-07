if exists("b:did_ruby_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_ruby_ujihisa_ftplugin = 1 " }}}

" edn to end
iabbrev edn end

inoremap <buffer> <C-q> #{
inoremap <expr> {  smartchr#loop('{', '#{', '{{{')

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
