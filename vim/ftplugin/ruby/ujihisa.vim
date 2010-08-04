if exists("b:did_ruby_ujihisa_ftplugin") " {{{
  finish
endif
let b:did_ruby_ujihisa_ftplugin = 1 " }}}

" quickrun wrapper {{{
"function! QuickrunForRuby()
"  if expand('%:p') =~# '/lib/[^./]*.rb'
"    let a = substitute(expand('%:p'), 'lib', 'spec', '')
"    let a = substitute(a, '.rb', '_spec.rb', '')
"    write
"    execute "QuickRun -exec 'spec192 " . a . "' -running_mark ':-) <" . a . ">'"
"  else
"    QuickRun
"  endif
"endfunction
"nnoremap <buffer> <Space>r :<C-u>call QuickrunForRuby()<Cr>


if expand('%:p') =~# '/lib/[^./]*.rb$'
  let b:spec = expand('%:p:s?/lib/?/spec/?:s?.rb$?_spec.rb?')
  let b:quickrun_config = {
        \ 'exec': 'spec {b:spec}',
        \ 'running_mark': ':-) <' . b:spec . '>',
        \ }
endif


" }}}
inoremap <expr> <buffer> {  smartchr#loop('{', '#{', '{{{')
" }}}
"function! s:insert_shebang() {{{
"  call append(0, '#!/usr/local/bin/ruby')
"  call append(1, '# -*- coding: utf-8 -*-')
"  call append(2, '# vim: set fenc=utf8')
"endfunction
"
"autocmd BufNewFile,VimEnter * call s:insert_shebang()

" }}}
" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
