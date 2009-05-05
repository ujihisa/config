" rubyspec.vim - Detect the rubyspec
" Author: ujihisa <http://ujihisa.blogspot.com/>

"if exists('g:loaded_rubyspec')
"  finish
"endif

function! s:set_rubyspec()
  if expand('%:p') !~ '/rubyspec/'
    return
  endif

  let b:quickrun_command = '~/git/ruby-trunk/spec/mspec/bin/mspec -t ~/git/ruby-trunk/ruby'
  "nnoremap <Space>m :<C-u>call <SID>do_mspec<Cr>
endfunction

function! s:do_mspec()
  "echo '!r ~/git/ruby-trunk/spec/mspec ' . expand('%:p') . ' -t ~/git/ruby-trunk/ruby'
  let b:quickrun_command = '~/git/ruby-trunk/spec/mspec -t ~/git/ruby-trunk/ruby'
endfunction

augroup plugin-rubyspec
  autocmd!
  autocmd Filetype ruby  call s:set_rubyspec()
augroup END


let g:loaded_rubyspec = 1

" __END__
