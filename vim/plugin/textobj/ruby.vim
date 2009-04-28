" textobj-ruby - Text objects for Ruby
" Version: 0.0.1
" Copyright (C) 2008 ujihisa <http://ujihisa.nowa.jp/>
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
scriptencoding utf-8

if exists('g:loaded_textobj_ruby')
  finish
endif




call textobj#user#plugin('ruby', {
\   'do-end': {
\     '*sfile*': expand('<sfile>:p'),
\     '*select-a-function*': 's:select_a_do_end',
\     'select-a': 'ard',
\     '*select-i-function*': 's:select_i_do_end',
\     'select-i': 'ird'
\   },
\   'curlybracket': {
\     '*sfile*': expand('<sfile>:p'),
\     '*select-a-function*': 's:select_a_curlybracket',
\     'select-a': 'arb',
\     '*select-i-function*': 's:select_i_curlybracket',
\     'select-i': 'irb'
\   }
\ })


let s:NOTHING = []

function! s:select_a_end(keyword)  "{{{1
  " s:select_a_do_end() works only linewise
  let x = s:get_start_and_end(a:keyword)

  if x is s:NOTHING
    return 0
  else
    let [start_linenr, end_linenr] = x
    return ['V', [0, start_linenr, 1, 0], [0, end_linenr, col(end_linenr), 0]]
  endif
endfunction


function! s:select_i_end(keyword)  "{{{1
  let x = s:select_a_end(a:keyword)

  if x is 0
    return 0
  else
    let x[1][1] = x[1][1]+1
    let x[2][1] = x[2][1]-1
    return x
  endif
endfunction

" pubic functions {{{1
function! s:select_a_do_end()
  return s:select_a_end('\<do\>')
endfunction

function! s:select_i_do_end()
  return s:select_i_end('\<do\>')
endfunction

function! s:select_a_curlybracket()
  return s:select_a_end("{")
endfunction

function! s:select_i_curlybracket()
  return s:select_i_end("{")
endfunction

" get_start_and_end :: String -> Maybe (Nu, Nu) {{{1
function! s:get_start_and_end(keyword)
  let here = line('.')
  normal %%
  while line('.') != 1
    let start = line('.')
    if expand('<cWORD>') !~# a:keyword
      normal [%
      continue
    endif

    normal %
    let end = line('.')
    if here <= end
      return [start, end]
    endif
    normal %
    normal [%
  endwhile
  return s:NOTHING
endfunction

" MEMO {{{1
" * need matchit.vim
"   * (normal % means call s:Match_wrapper('',1,'n')<Cr>
"   * (s: is matchit.vim's.)
" * known bug: type vard on the code 'do' and then...?

" {{{1
let g:loaded_textobj_ruby = 1

" __END__
" vim: foldmethod=marker
