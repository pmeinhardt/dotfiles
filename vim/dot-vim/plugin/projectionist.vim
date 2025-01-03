" Configure global projections (see ':help projectionist').
let g:projectionist_heuristics = json_decode(join(readfile(expand('~/.vim/config/projectionist-heuristics.json'))))
