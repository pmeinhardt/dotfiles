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


" Define color/value keys.
let s:black       = 'black'
let s:white       = 'white'

let s:darkgray    = 'darkgray'
let s:darkblue    = 'darkblue'
let s:darkcyan    = 'darkcyan'
let s:darkgreen   = 'darkgreen'
let s:darkyellow  = 'darkyellow'
let s:darkred     = 'darkred'
let s:darkmagenta = 'darkmagenta'

let s:gray        = 'gray'
let s:blue        = 'blue'
let s:cyan        = 'cyan'
let s:green       = 'green'
let s:yellow      = 'yellow'
let s:red         = 'red'
let s:magenta     = 'magenta'

let s:none        = 'NONE'


" Set up color mapping for terminal (see `:help cterm-colors`).
let s:cterm = {
      \ s:black       : 0,
      \ s:white       : 15,
      \
      \ s:darkgray    : 8,
      \ s:darkblue    : 4,
      \ s:darkcyan    : 6,
      \ s:darkgreen   : 2,
      \ s:darkyellow  : 3,
      \ s:darkred     : 1,
      \ s:darkmagenta : 5,
      \
      \ s:gray        : 7,
      \ s:blue        : 12,
      \ s:cyan        : 14,
      \ s:green       : 10,
      \ s:yellow      : 11,
      \ s:red         : 9,
      \ s:magenta     : 13,
      \
      \ s:none        : s:none,
      \ }

" Set up color mapping for gui (see `:help gui-colors`).
let s:gui = {
      \ s:black       : '#000000',
      \ s:white       : '#e9e7e7',
      \
      \ s:darkgray    : '#2e2929',
      \ s:darkblue    : '#5083be',
      \ s:darkcyan    : '#71b5c9',
      \ s:darkgreen   : '#d5db69',
      \ s:darkyellow  : '#fdc673',
      \ s:darkred     : '#e87060',
      \ s:darkmagenta : '#e383b5',
      \
      \ s:gray        : '#7e7272',
      \ s:blue        : '#96b5d8',
      \ s:cyan        : '#abd3df',
      \ s:green       : '#e6eaa6',
      \ s:yellow      : '#fedcab',
      \ s:red         : '#f1a89f',
      \ s:magenta     : '#eeb4d2',
      \
      \ s:none        : s:none,
      \ }


" Define helper function
function! s:hi(group, fg, bg, attr)
  exec 'highlight ' . a:group . ' ctermfg=' . s:cterm[a:fg] . ' ctermbg=' . s:cterm[a:bg] . ' cterm=' . a:attr . ' guifg=' . s:gui[a:fg] . ' guibg=' . s:gui[a:bg] . ' gui=' . a:attr
endfunction

function! s:ln(from, to)
  exec 'highlight! link ' . a:from . ' ' . a:to
endfunction


" Set baseline
call s:hi('Normal', s:white, s:none, s:none)
call s:ln('NormalNC', 'Normal')

call s:hi('Bold', s:none, s:none, 'bold')
call s:hi('Italic', s:none, s:none, 'italic')
call s:hi('Unterlined', s:none, s:none, 'underline')

" Vim editor colors
call s:hi('Debug', s:darkred, s:none, s:none)
call s:hi('Directory', s:blue, s:none, s:none)
call s:hi('Error', s:black, s:darkred, s:none)
call s:hi('ErrorMsg', s:darkred, s:black, s:none)
call s:hi('Exception', s:darkred, s:none, s:none)
call s:hi('Search', s:black, s:darkyellow, s:none)
call s:hi('IncSearch', s:yellow, s:darkred, s:none)
call s:hi('Substitute', s:black, s:darkyellow, s:none)
call s:hi('Macro', s:darkblue, s:none, s:none)
call s:hi('MatchParen', s:black, s:yellow, s:none)
call s:hi('ModeMsg', s:gray, s:none, s:none)
call s:hi('MoreMsg', s:darkblue, s:none, s:none)
call s:hi('Question', s:darkyellow, s:none, s:none)
call s:hi('SpecialKey', s:gray, s:none, s:none)
call s:hi('TooLong', s:darkblue, s:none, s:none)
call s:hi('Visual', s:black, s:yellow, s:none)
call s:hi('VisualNOS', s:darkblue, s:none, s:none)
call s:hi('WarningMsg', s:darkyellow, s:none, s:none)
call s:hi('WildMenu', s:black, s:white, 'bold')
call s:hi('Title', s:darkred, s:none, s:none)
call s:hi('Conceal', s:darkblue, s:none, s:none)
call s:hi('Cursor', s:black, s:gray, s:none)
call s:hi('NonText', s:darkgray, s:none, s:none)
call s:hi('SignColumn', s:darkgray, s:none, s:none)
call s:hi('StatusLine', s:black, s:gray, 'bold')
call s:hi('StatusLineNC', s:black, s:darkgray, s:none)
call s:hi('ColorColumn', s:none, s:darkgray, s:none)
call s:hi('MsgSeparator', s:black, s:gray, s:none)
call s:hi('CursorColumn', s:none, s:none, 'none')
call s:hi('CursorLine', s:none, s:none, 'bold')
call s:hi('QuickFixLine', s:none, s:none, 'standout')
call s:hi('WinSeparator', s:darkgray, s:none, s:none)
call s:hi('EndOfBuffer', s:darkgray, s:none, s:none)
call s:hi('NonText', s:darkgray, s:none, s:none)

call s:ln('MsgArea', 'Normal')
call s:ln('VertSplit', 'WinSeparator')

" Tabs
call s:hi('TabLine', s:black, s:white, s:none)
call s:hi('TabLineFill', s:black, s:white, s:none)
call s:hi('TabLineSel', s:white, s:black, 'bold')

" Line numbers
call s:hi('LineNr', s:darkgray, s:none, s:none)
call s:hi('CursorLineNr', s:gray, s:none, s:none)

call s:ln('LineNrAbove', 'LineNr')
call s:ln('LineNrBelow', 'LineNr')

" Folds
call s:hi('FoldColumn', s:darkblue, s:black, s:none)
call s:hi('Folded', s:darkgray, s:black, s:none)

" Quickfix window
call s:hi('qfSeparator', s:darkgray, s:none, s:none)

call s:ln('qfFileName', 'Directory')
call s:ln('qfLineNr', 'LineNr')

" Popup menu
call s:hi('Pmenu', s:darkgray, s:white, s:none)
call s:hi('PmenuExtra', s:gray, s:white, s:none)
call s:hi('PmenuExtraSel', s:black, s:white, 'bold')
call s:hi('PmenuKind', s:gray, s:white, s:none)
call s:hi('PmenuKindSel', s:black, s:white, 'bold')
call s:hi('PmenuSel', s:black, s:white, 'bold')
call s:hi('PmenuSbar', s:black, s:darkgray, s:none)
call s:hi('PmenuThumb', s:none, s:gray, s:none)

" Spell hiing
call s:hi('SpellBad', s:none, s:none, 'undercurl')
exec 'highlight SpellBad guisp=' . s:darkred
" call s:hi('SpellCap')
" call s:hi('SpellLocal')
" call s:hi('SpellRare')

" Diagnostic
call s:hi('DiagnosticError', s:darkred, s:none, s:none)
call s:hi('DiagnosticWarn', s:yellow, s:none, s:none)
call s:hi('DiagnosticInfo', s:blue, s:none, s:none)
call s:hi('DiagnosticHint', s:cyan, s:none, s:none)
call s:hi('DiagnosticOk', s:green, s:none, s:none)

exec 'highlight DiagnosticUnderlineError guisp=' . s:red
exec 'highlight DiagnosticUnderlineWarn guisp=' . s:yellow
exec 'highlight DiagnosticUnderlineInfo guisp=' . s:blue
exec 'highlight DiagnosticUnderlineHint guisp=' . s:cyan
exec 'highlight DiagnosticUnderlineOk guisp=' . s:green

" Standard syntax highlighting
call s:hi('Boolean', s:red, s:none, s:none)
call s:hi('Character', s:red, s:none, s:none)
call s:hi('Comment', s:gray, s:none, s:none)
call s:hi('Conditional', s:darkmagenta, s:none, s:none)
call s:hi('Constant', s:red, s:none, s:none)
call s:hi('Define', s:darkblue, s:none, s:none)
call s:hi('Delimiter', s:darkcyan, s:none, s:none)
call s:hi('Float', s:red, s:none, s:none)
call s:hi('Function', s:darkblue, s:none, s:none)
call s:hi('Identifier', s:darkred, s:none, s:none)
call s:hi('Include', s:darkblue, s:none, s:none)
call s:hi('Keyword', s:darkmagenta, s:none, s:none)
call s:hi('Label', s:darkmagenta, s:none, s:none)
call s:hi('Number', s:red, s:none, s:none)
call s:hi('Operator', s:white, s:none, s:none)
call s:hi('PreProc', s:darkblue, s:none, s:none)
call s:hi('PreCondit', s:darkblue, s:none, s:none)
call s:hi('Repeat', s:darkmagenta, s:none, s:none)
call s:hi('Special', s:darkcyan, s:none, s:none)
call s:hi('SpecialChar', s:darkcyan, s:none, s:none)
call s:hi('SpecialComment', s:darkcyan, s:none, s:none)
call s:hi('Statement', s:darkblue, s:none, s:none)
call s:hi('StorageClass', s:darkcyan, s:none, s:none)
call s:hi('String', s:darkgreen, s:none, s:none)
call s:hi('Structure', s:darkmagenta, s:none, s:none)
call s:hi('Tag', s:darkcyan, s:none, s:none)
call s:hi('Todo', s:yellow, s:none, 'bold')
call s:hi('Type', s:darkyellow, s:none, s:none)
call s:hi('Typedef', s:darkred, s:none, s:none)

" Diffs
call s:hi('DiffAdd', s:darkgreen, s:none, s:none)
call s:hi('DiffChange', s:darkyellow, s:none, s:none)
call s:hi('DiffDelete', s:darkred, s:none, s:none)
call s:hi('DiffText', s:darkyellow, s:darkgray, s:none)
call s:hi('DiffLine', s:darkcyan, s:none, s:none)
call s:hi('diffSubname', s:gray, s:none, s:none)

call s:ln('DiffAdded', 'DiffAdd')
call s:ln('DiffRemoved', 'DiffDelete')

call s:ln('Added', 'DiffAdd')
call s:ln('Changed', 'DiffChange')
call s:ln('Removed', 'DiffDelete')

" HTML
call s:ln('htmlBold', 'Bold')
call s:ln('htmlItalic', 'Italic')
call s:ln('htmlEndTag', 'htmlTag')

" CSS
call s:ln('cssClassName', 'Structure')
call s:ln('cssProp', 'Type')

" Fugitive
call s:hi('fugitiveHeader', s:darkblue, s:none, s:none)
call s:hi('fugitiveHunk', s:darkgray, s:none, s:none)
call s:hi('fugitiveSymbolicRef', s:darkyellow, s:none, s:none)
call s:hi('fugitiveHelpTag', s:darkcyan, s:none, s:none)
call s:hi('fugitiveUntrackedSection', s:white, s:none, s:none)
call s:hi('fugitiveUntrackedHeading', s:darkmagenta, s:none, s:none)
call s:hi('fugitiveUntrackedModifier', s:magenta, s:none, s:none)
call s:hi('fugitiveUnstagedSection', s:white, s:none, s:none)
call s:hi('fugitiveUnstagedHeading', s:darkred, s:none, s:none)
call s:hi('fugitiveUnstagedModifier', s:red, s:none, s:none)
call s:hi('fugitiveStagedSection', s:white, s:none, s:none)
call s:hi('fugitiveStagedHeading', s:darkyellow, s:none, s:none)
call s:hi('fugitiveStagedModifier', s:yellow, s:none, s:none)
call s:hi('fugitiveCount', s:red, s:none, s:none)


" Remove functions.
delfunction s:hi
delfunction s:ln


" Remove variables.
unlet s:black
unlet s:white

unlet s:darkgray
unlet s:darkblue
unlet s:darkcyan
unlet s:darkgreen
unlet s:darkyellow
unlet s:darkred
unlet s:darkmagenta

unlet s:gray
unlet s:blue
unlet s:cyan
unlet s:green
unlet s:yellow
unlet s:red
unlet s:magenta

unlet s:none

unlet s:cterm
unlet s:gui
