function! JavaScriptUnderScoreBecomesCamelCase()
  if matchstr(getline('.'), '.', col('.')-2) =~ '\w'
    return "\<Plug>(stickykey-shift)"
  else
    return '_'
  endif
endfunction!

imap <buffer><expr> _ JavaScriptUnderScoreBecomesCamelCase()
