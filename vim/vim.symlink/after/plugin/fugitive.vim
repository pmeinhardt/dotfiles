" Add a command shortcut for running 'git promote'
command! -bar -nargs=? -complete=customlist,fugitive#PushComplete Gpromote :Git promote <args>

" Add a command shortcut for running 'git sweep'
command! -bar -nargs=? -complete=customlist,fugitive#FetchComplete Gsweep :Git sweep <args>
