setl nolist
setl noexpandtab
setl ts=4
setl sw=4
inoremap <buffer> @ $

function! s:last_char()
  return matchstr(getline('.'), '.', col('.')-2)
endfunction

function! s:php_smart_bracket(last_char)
  if a:last_char == '['
    return "\<BS>("
  elseif a:last_char =~ '\w\|]'
    return '['
  else
    return 'array('
  endif
endfunction

inoremap <buffer><expr> [ <SID>php_smart_bracket(<SID>last_char())
inoremap <buffer><expr> ] smartchr#one_of(']', ')')

onoremap <buffer> - /\u<Cr>
vnoremap <buffer> - /\u<Cr>h

inoremap <buffer> ` print_r($);exit;<left><left><left><left><left><left><left>
