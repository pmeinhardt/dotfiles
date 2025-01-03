" Define a mapping for multi-character surround sequences.
" Prompts for a character sequence to insert.
"
" Usage examples:
"
"   Old text    Command       New text
"   important   ysw:**<cr>    **important**
"
" See `:help surround-customizing`.
let g:surround_{char2nr(':')} = "\1surround: \1\r\1\1"

" Define a mapping for generic types.
" Prompts for a type name.
"
" Usage examples:
"
"   Old text    Command       New text
"   number      yswgSet<cr>   Set<number>
"
" See `:help surround-customizing`.
let g:surround_{char2nr('g')} = "\1type: \1<\r>"
