" remove - remove file into your trashbox.
" Version: 1
"   Assume that ~/.Trash/ exists.
" Copyright (C) 2009 ujihisa <http://ujihisa.blogspot.com/>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" Prologue  "{{{1

if exists('g:loaded_remove')
  "finish
endif








" Main  "{{{1
command! -nargs=* -complete=file Remove
\ call s:cmd_Remove(<f-args>)

function! s:cmd_Remove(...)
  if a:0 == 0
    let f = expand('%')
  else
    let f = a:1
  endif

  execute '!mv' f '~/.Trash/'
  " FIXME: For duplicate filename
endfunction








" Epilogue  "{{{1

let g:loaded_remove = 1








" __END__  "{{{1
" vim: foldmethod=marker foldlevel=0
