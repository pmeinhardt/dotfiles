" Vim color file

" Set 'background' back to the default.
set background=dark

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if highlighting is enabled.
if exists('g:syntax_on')
  syntax reset
endif


let g:colors_name = 'base'


" Warm Mocha palette, a warmer, near-black Catppuccin Mocha.
" Requires 'termguicolors'.
let s:palette = {
      \ 'rosewater' : '#f4e1da',
      \ 'flamingo'  : '#f2cec7',
      \ 'pink'      : '#fdc0d7',
      \ 'mauve'     : '#dda0e8',
      \ 'red'       : '#f78c91',
      \ 'maroon'    : '#eca19d',
      \ 'peach'     : '#f9b485',
      \ 'yellow'    : '#fee0b0',
      \ 'green'     : '#c0dd8d',
      \ 'teal'      : '#9de2c6',
      \ 'sky'       : '#88dde3',
      \ 'sapphire'  : '#71c8ea',
      \ 'blue'      : '#92b1fb',
      \ 'lavender'  : '#c0bafb',
      \ 'text'      : '#dad7cf',
      \ 'subtext1'  : '#c6c3bd',
      \ 'subtext0'  : '#b1aeaa',
      \ 'overlay2'  : '#9d9a97',
      \ 'overlay1'  : '#878583',
      \ 'overlay0'  : '#737171',
      \ 'surface2'  : '#5e5c5e',
      \ 'surface1'  : '#4a484b',
      \ 'surface0'  : '#2c292b',
      \ 'base'      : '#201e20',
      \ 'mantle'    : '#161416',
      \ 'crust'     : '#0b0b0b',
      \ }


" Look up a palette color; an empty name means none
function! s:color(name) abort
  return empty(a:name) ? 'NONE' : s:palette[a:name]
endfunction

" Highlight a group with palette colors; empty arguments mean none
function! s:hi(group, fg, bg = '', attr = '', sp = '') abort
  let attr = empty(a:attr) ? 'NONE' : a:attr
  exec printf('highlight %s guifg=%s guibg=%s guisp=%s gui=%s cterm=%s',
        \ a:group, s:color(a:fg), s:color(a:bg), s:color(a:sp), attr, attr)
endfunction

function! s:ln(from, to)
  exec 'highlight! link ' . a:from . ' ' . a:to
endfunction


" Set baseline
call s:hi('Normal', 'text')
call s:ln('NormalNC', 'Normal')

call s:hi('Bold', '', '', 'bold')
call s:hi('Italic', '', '', 'italic')
call s:hi('Underlined', '', '', 'underline')

" Vim editor colors
call s:hi('Debug', 'red')
call s:hi('Directory', 'lavender')
call s:hi('Error', 'crust', 'red')
call s:hi('ErrorMsg', 'red')
call s:hi('Exception', 'red')
call s:hi('Search', 'yellow', 'surface0')
call s:hi('IncSearch', 'crust', 'peach')
call s:hi('Substitute', 'yellow', 'surface0')
call s:hi('Macro', 'blue')
call s:hi('MatchParen', 'peach', 'surface0', 'bold')
call s:hi('ModeMsg', 'overlay1')
call s:hi('MoreMsg', 'blue')
call s:hi('Question', 'yellow')
call s:hi('SpecialKey', 'overlay1')
call s:hi('TooLong', 'blue')
call s:hi('Visual', '', 'surface0')
call s:hi('VisualNOS', 'blue')
call s:hi('WarningMsg', 'yellow')
call s:hi('WildMenu', 'text', 'surface0', 'bold')
call s:hi('Title', 'blue', '', 'bold')
call s:hi('Conceal', 'blue')
call s:hi('Cursor', 'crust', 'overlay1')
call s:hi('NonText', 'surface1')
call s:hi('SignColumn', 'surface1')
call s:hi('StatusLine', 'subtext0', 'mantle')
call s:hi('StatusLineNC', 'overlay0', 'mantle')
call s:hi('ColorColumn', '', 'mantle')
call s:hi('MsgSeparator', 'overlay0', 'mantle')
call s:hi('CursorColumn', '', 'mantle')
call s:hi('CursorLine', '', 'mantle')
call s:hi('QuickFixLine', '', 'surface0')
call s:hi('WinSeparator', 'surface0')
call s:hi('EndOfBuffer', 'surface1')
call s:hi('NormalFloat', 'text', 'mantle')
call s:hi('FloatBorder', 'overlay0', 'mantle')

call s:ln('MsgArea', 'Normal')
call s:ln('VertSplit', 'WinSeparator')

" Tabs
call s:hi('TabLine', 'overlay0')
call s:hi('TabLineFill', 'overlay0')
call s:hi('TabLineSel', 'text', 'surface0')
call s:hi('TabLineSelCap', 'surface0')

" Line numbers
call s:hi('LineNr', 'surface1')
call s:hi('CursorLineNr', 'subtext0')

call s:ln('LineNrAbove', 'LineNr')
call s:ln('LineNrBelow', 'LineNr')

" Folds
call s:hi('FoldColumn', 'blue')
call s:hi('Folded', 'overlay0', 'mantle')

" Quickfix window
call s:hi('qfSeparator', 'surface1')

call s:ln('qfFileName', 'Directory')
call s:ln('qfLineNr', 'LineNr')

" Popup menu
call s:hi('Pmenu', 'subtext0', 'mantle')
call s:hi('PmenuExtra', 'overlay0', 'mantle')
call s:hi('PmenuExtraSel', 'subtext0', 'surface0', 'bold')
call s:hi('PmenuKind', 'overlay0', 'mantle')
call s:hi('PmenuKindSel', 'text', 'surface0', 'bold')
call s:hi('PmenuSel', 'text', 'surface0', 'bold')
call s:hi('PmenuSbar', '', 'base')
call s:hi('PmenuThumb', '', 'overlay0')

" Spell checking
call s:hi('SpellBad', '', '', 'undercurl', 'red')

" Diagnostic
call s:hi('DiagnosticError', 'red')
call s:hi('DiagnosticWarn', 'yellow')
call s:hi('DiagnosticInfo', 'lavender')
call s:hi('DiagnosticHint', 'teal')
call s:hi('DiagnosticOk', 'green')

call s:hi('DiagnosticUnderlineError', '', '', 'underline', 'red')
call s:hi('DiagnosticUnderlineWarn', '', '', 'underline', 'yellow')
call s:hi('DiagnosticUnderlineInfo', '', '', 'underline', 'lavender')
call s:hi('DiagnosticUnderlineHint', '', '', 'underline', 'teal')
call s:hi('DiagnosticUnderlineOk', '', '', 'underline', 'green')

" Standard syntax highlighting
call s:hi('Boolean', 'peach')
call s:hi('Character', 'peach')
call s:hi('Comment', 'overlay1')
call s:hi('Conditional', 'mauve')
call s:hi('Constant', 'peach')
call s:hi('Define', 'blue')
call s:hi('Delimiter', 'sky')
call s:hi('Float', 'peach')
call s:hi('Function', 'blue')
call s:hi('Identifier', 'red')
call s:hi('Include', 'blue')
call s:hi('Keyword', 'mauve')
call s:hi('Label', 'mauve')
call s:hi('Number', 'peach')
call s:hi('Operator', 'text')
call s:hi('PreProc', 'blue')
call s:hi('PreCondit', 'blue')
call s:hi('Repeat', 'mauve')
call s:hi('Special', 'sky')
call s:hi('SpecialChar', 'sky')
call s:hi('SpecialComment', 'sky')
call s:hi('Statement', 'blue')
call s:hi('StorageClass', 'sky')
call s:hi('String', 'green')
call s:hi('Structure', 'mauve')
call s:hi('Tag', 'sky')
call s:hi('Todo', 'rosewater', '', 'bold')
call s:hi('Type', 'yellow')
call s:hi('Typedef', 'red')

" Diffs
call s:hi('DiffAdd', 'green')
call s:hi('DiffChange', 'yellow')
call s:hi('DiffDelete', 'red')
call s:hi('DiffText', 'yellow', 'surface0')
call s:hi('DiffLine', 'sky')
call s:hi('diffSubname', 'overlay1')

call s:ln('DiffAdded', 'DiffAdd')
call s:ln('DiffRemoved', 'DiffDelete')

call s:ln('Added', 'DiffAdd')
call s:ln('Changed', 'DiffChange')
call s:ln('Removed', 'DiffDelete')

" Markdown
call s:hi('markdownCode', 'sky')
call s:hi('markdownLinkText', 'mauve')
call s:hi('markdownUrl', 'mauve', '', 'underline')

" Highlight the "[]()" around links like the link itself
call s:ln('markdownLinkTextDelimiter', 'markdownLinkText')
call s:ln('markdownLinkDelimiter', 'markdownLinkText')

if has('nvim')
  call s:ln('@markup.raw.markdown_inline', 'markdownCode')
  call s:ln('@markup.link.markdown_inline', 'markdownLinkText')
  call s:ln('@markup.link.label.markdown_inline', 'markdownLinkText')
  call s:ln('@markup.link.url.markdown_inline', 'markdownUrl')
endif

" HTML
call s:ln('htmlBold', 'Bold')
call s:ln('htmlItalic', 'Italic')
call s:ln('htmlEndTag', 'htmlTag')

" CSS
call s:ln('cssClassName', 'Structure')
call s:ln('cssProp', 'Type')

" Fugitive
call s:hi('fugitiveHeader', 'blue')
call s:hi('fugitiveHunk', 'surface1')
call s:hi('fugitiveSymbolicRef', 'yellow')
call s:hi('fugitiveHelpTag', 'sky')
call s:hi('fugitiveUntrackedSection', 'text')
call s:hi('fugitiveUntrackedHeading', 'mauve')
call s:hi('fugitiveUntrackedModifier', 'pink')
call s:hi('fugitiveUnstagedSection', 'text')
call s:hi('fugitiveUnstagedHeading', 'red')
call s:hi('fugitiveUnstagedModifier', 'peach')
call s:hi('fugitiveStagedSection', 'text')
call s:hi('fugitiveStagedHeading', 'yellow')
call s:hi('fugitiveStagedModifier', 'rosewater')
call s:hi('fugitiveCount', 'peach')


delfunction s:color
delfunction s:hi
delfunction s:ln
unlet s:palette
