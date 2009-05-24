if exists("b:did_ruby_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_ruby_ujihisa_ftplugin = 1 " }}}

" edn to end
iabbrev edn end

inoremap <buffer> <C-q> #{
inoremap <expr> {  smartchr#loop('{', '#{', '{{{')

"function! s:insert_shebang()
"  call append(0, '#!/usr/local/bin/ruby')
"  call append(1, '# -*- coding: utf-8 -*-')
"  call append(2, '# vim: set fenc=utf8')
"endfunction
"
"autocmd BufNewFile,VimEnter * call s:insert_shebang()


" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
