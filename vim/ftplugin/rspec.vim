if exists("b:did_rspec_ujihisa_ftplugin")
  finish
endif
let b:did_rspec_ujihisa_ftplugin = 1

compiler rspec
nnoremap <buffer> <silent> <space>m :<C-u>call <SID>make()<Cr>

function! s:make()
  let current_file = expand('%')
  silent make %
  if expand('%') != current_file
    split
    bprevious
  end
  redraw!
  cwindow
endfunction
