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

" Define color values.
let s:black       = '#000000'
let s:white       = '#e9e7e7'

let s:darkgray    = '#2e2929'
let s:darkblue    = '#5083be'
let s:darkcyan    = '#71b5c9'
let s:darkgreen   = '#d5db69'
let s:darkyellow  = '#fdc673'
let s:darkred     = '#e87060'
let s:darkmagenta = '#e383b5'

let s:gray        = '#7e7272'
let s:blue        = '#96b5d8'
let s:cyan        = '#abd3df'
let s:green       = '#e6eaa6'
let s:yellow      = '#fedcab'
let s:red         = '#f1a89f'
let s:magenta     = '#eeb4d2'

" Set up terminal colors
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Vim (see :help g:terminal_ansi_colors)
  let g:terminal_ansi_colors = [
        \ s:black,
        \ s:darkblue,
        \ s:darkgreen,
        \ s:darkcyan,
        \ s:darkred,
        \ s:darkmagenta,
        \ s:darkyellow,
        \ s:gray,
        \ s:darkgray,
        \ s:blue,
        \ s:green,
        \ s:cyan,
        \ s:red,
        \ s:magenta,
        \ s:yellow,
        \ s:white]

  " Nvim (see :help terminal-config)
  for i in range(g:terminal_ansi_colors->len())
    let g:terminal_color_{i} = g:terminal_ansi_colors[i]
  endfor
endif

" Define helper function
function! s:gui(group, fg, bg, attr)
  exec 'highlight ' . a:group . ' guifg=' . a:fg . ' guibg=' . a:bg . ' gui=' . a:attr
endfunction

function! s:link(from, to)
  exec 'highlight! link ' . a:from . ' ' . a:to
endfunction

" Set baseline
call s:gui('Normal', s:white, s:black, 'none')
call s:link('NormalNC', 'Normal')

call s:gui('Bold', 'none', 'none', 'bold')
call s:gui('Italic', 'none', 'none', 'italic')
call s:gui('Unterlined', 'none', 'none', 'underline')

" Vim editor colors
call s:gui('Debug', s:darkred, 'none', 'none')
call s:gui('Directory', s:blue, 'none', 'none')
call s:gui('Error', s:black, s:darkred, 'none')
call s:gui('ErrorMsg', s:darkred, s:black, 'none')
call s:gui('Exception', s:darkred, 'none', 'none')
call s:gui('Search', s:black, s:darkyellow, 'none')
call s:gui('IncSearch', s:yellow, s:darkred, 'none')
call s:gui('Substitute', s:black, s:darkyellow, 'none')
call s:gui('Macro', s:darkblue, 'none', 'none')
call s:gui('MatchParen', s:black, s:yellow, 'none')
call s:gui('ModeMsg', s:gray, 'none', 'none')
call s:gui('MoreMsg', s:darkblue, 'none', 'none')
call s:gui('Question', s:darkyellow, 'none', 'none')
call s:gui('SpecialKey', s:gray, 'none', 'none')
call s:gui('TooLong', s:darkblue, 'none', 'none')
call s:gui('Visual', s:black, s:yellow, 'none')
call s:gui('VisualNOS', s:darkblue, 'none', 'none')
call s:gui('WarningMsg', s:darkyellow, 'none', 'none')
call s:gui('WildMenu', s:black, s:white, 'bold')
call s:gui('Title', s:darkred, 'none', 'none')
call s:gui('Conceal', s:darkblue, 'none', 'none')
call s:gui('Cursor', s:black, s:gray, 'none')
call s:gui('NonText', s:darkgray, 'none', 'none')
call s:gui('SignColumn', s:darkgray, 'none', 'none')
call s:gui('StatusLine', s:black, s:gray, 'bold')
call s:gui('StatusLineNC', s:black, s:darkgray, 'none')
call s:gui('ColorColumn', 'none', s:darkgray, 'none')
call s:gui('MsgSeparator', s:black, s:gray, 'none')
call s:gui('CursorColumn', 'none', 'none', 'none')
call s:gui('CursorLine', 'none', 'none', 'bold')
call s:gui('QuickFixLine', 'none', 'none', 'standout')
call s:gui('WinSeparator', s:darkgray, 'none', 'none')
call s:gui('EndOfBuffer', s:darkgray, 'none', 'none')
call s:gui('NonText', s:darkgray, 'none', 'none')

call s:link('MsgArea', 'Normal')
call s:link('VertSplit', 'WinSeparator')

" Tabs
call s:gui('TabLine', s:black, s:white, 'none')
call s:gui('TabLineFill', s:black, s:white, 'none')
call s:gui('TabLineSel', s:white, s:black, 'bold')

" Line numbers
call s:gui('LineNr', s:darkgray, 'none', 'none')
call s:gui('CursorLineNr', s:gray, 'none', 'none')

call s:link('LineNrAbove', 'LineNr')
call s:link('LineNrBelow', 'LineNr')

" Folds
call s:gui('FoldColumn', s:darkblue, s:black, 'none')
call s:gui('Folded', s:darkgray, s:black, 'none')

" Quickfix window
call s:gui('qfSeparator', s:darkgray, 'none', 'none')

call s:link('qfFileName', 'Directory')
call s:link('qfLineNr', 'LineNr')

" Popup menu
call s:gui('Pmenu', s:darkgray, s:white, 'none')
call s:gui('PmenuExtra', s:gray, s:white, 'none')
call s:gui('PmenuExtraSel', s:black, s:white, 'bold')
call s:gui('PmenuKind', s:gray, s:white, 'none')
call s:gui('PmenuKindSel', s:black, s:white, 'bold')
call s:gui('PmenuSel', s:black, s:white, 'bold')
call s:gui('PmenuSbar', s:black, s:darkgray, 'none')
call s:gui('PmenuThumb', 'none', s:gray, 'none')

" Spell highlighting
call s:gui('SpellBad', 'none', 'none', 'undercurl')
exec 'highlight SpellBad guisp=' . s:darkred
" call s:hi('SpellCap')
" call s:hi('SpellLocal')
" call s:hi('SpellRare')

" Diagnostic
call s:gui('DiagnosticError', s:darkred, 'none', 'none')
call s:gui('DiagnosticWarn', s:yellow, 'none', 'none')
call s:gui('DiagnosticInfo', s:blue, 'none', 'none')
call s:gui('DiagnosticHint', s:cyan, 'none', 'none')
call s:gui('DiagnosticOk', s:green, 'none', 'none')

exec 'highlight DiagnosticUnderlineError guisp=' . s:red
exec 'highlight DiagnosticUnderlineWarn guisp=' . s:yellow
exec 'highlight DiagnosticUnderlineInfo guisp=' . s:blue
exec 'highlight DiagnosticUnderlineHint guisp=' . s:cyan
exec 'highlight DiagnosticUnderlineOk guisp=' . s:green

" Standard syntax highlighting
call s:gui('Boolean', s:red, 'none', 'none')
call s:gui('Character', s:red, 'none', 'none')
call s:gui('Comment', s:gray, 'none', 'none')
call s:gui('Conditional', s:darkmagenta, 'none', 'none')
call s:gui('Constant', s:red, 'none', 'none')
call s:gui('Define', s:darkblue, 'none', 'none')
call s:gui('Delimiter', s:darkcyan, 'none', 'none')
call s:gui('Float', s:red, 'none', 'none')
call s:gui('Function', s:darkblue, 'none', 'none')
call s:gui('Identifier', s:darkred, 'none', 'none')
call s:gui('Include', s:darkblue, 'none', 'none')
call s:gui('Keyword', s:darkmagenta, 'none', 'none')
call s:gui('Label', s:darkmagenta, 'none', 'none')
call s:gui('Number', s:red, 'none', 'none')
call s:gui('Operator', s:white, 'none', 'none')
call s:gui('PreProc', s:darkblue, 'none', 'none')
call s:gui('PreCondit', s:darkblue, 'none', 'none')
call s:gui('Repeat', s:darkmagenta, 'none', 'none')
call s:gui('Special', s:darkcyan, 'none', 'none')
call s:gui('SpecialChar', s:darkcyan, 'none', 'none')
call s:gui('SpecialComment', s:darkcyan, 'none', 'none')
call s:gui('Statement', s:darkblue, 'none', 'none')
call s:gui('StorageClass', s:darkcyan, 'none', 'none')
call s:gui('String', s:darkgreen, 'none', 'none')
call s:gui('Structure', s:darkmagenta, 'none', 'none')
call s:gui('Tag', s:darkcyan, 'none', 'none')
call s:gui('Todo', s:yellow, 'none', 'bold')
call s:gui('Type', s:darkyellow, 'none', 'none')
call s:gui('Typedef', s:darkred, 'none', 'none')

" Diffs
call s:gui('DiffAdd', s:darkgreen, 'none', 'none')
call s:gui('DiffChange', s:darkyellow, 'none', 'none')
call s:gui('DiffDelete', s:darkred, 'none', 'none')
call s:gui('DiffText', s:darkyellow, s:darkgray, 'none')
call s:gui('DiffLine', s:darkcyan, 'none', 'none')
call s:gui('diffSubname', s:gray, 'none', 'none')

call s:link('DiffAdded', 'DiffAdd')
call s:link('DiffRemoved', 'DiffDelete')

call s:link('Added', 'DiffAdd')
call s:link('Changed', 'DiffChange')
call s:link('Removed', 'DiffDelete')

" HTML
call s:link('htmlBold', 'Bold')
call s:link('htmlItalic', 'Italic')
call s:link('htmlEndTag', 'htmlTag')

" CSS
call s:link('cssClassName', 'Structure')
call s:link('cssProp', 'Type')

" Fugitive
call s:gui('fugitiveHeader', s:darkblue, 'none', 'none')
call s:gui('fugitiveHunk', s:darkgray, 'none', 'none')
call s:gui('fugitiveSymbolicRef', s:darkyellow, 'none', 'none')
call s:gui('fugitiveHelpTag', s:darkcyan, 'none', 'none')
call s:gui('fugitiveUntrackedSection', s:white, 'none', 'none')
call s:gui('fugitiveUntrackedHeading', s:darkmagenta, 'none', 'none')
call s:gui('fugitiveUntrackedModifier', s:magenta, 'none', 'none')
call s:gui('fugitiveUnstagedSection', s:white, 'none', 'none')
call s:gui('fugitiveUnstagedHeading', s:darkred, 'none', 'none')
call s:gui('fugitiveUnstagedModifier', s:red, 'none', 'none')
call s:gui('fugitiveStagedSection', s:white, 'none', 'none')
call s:gui('fugitiveStagedHeading', s:darkyellow, 'none', 'none')
call s:gui('fugitiveStagedModifier', s:yellow, 'none', 'none')
call s:gui('fugitiveCount', s:red, 'none', 'none')


" let s:t_Co = &t_Co

" Remove functions
delfunction s:gui
delfunction s:link

" Remove color variables
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
