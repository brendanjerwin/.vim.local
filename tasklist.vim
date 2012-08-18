autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

let g:tlWindowPosition = 1
let g:tlTokenList = ['TODO', 'FIXME', 'CHANGED', 'XXX', 'BUG', 'HACK', 'NOTE', 'INFO', 'IDEA']
