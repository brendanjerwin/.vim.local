au BufRead,BufNewFile *.coffee source ~/.vim.local/on_coffee_settings.vim

let coffee_lint_options = '-f coffeelint.json'

" PairTools 1.5.2
" Enable modules
let g:pairtools_coffee_pairclamp = 1
let g:pairtools_coffee_tagwrench = 0
let g:pairtools_coffee_jigsaw = 1

" Configure PairClamp
let g:pairtools_coffee_autoclose = 1
let g:pairtools_coffee_forcepairs = 0
let g:pairtools_coffee_closepairs = "(:),[:],{:},':',\":\""
let g:pairtools_coffee_smartclose = 1
let g:pairtools_coffee_smartcloserules = '\w'
let g:pairtools_coffee_apostrophe = 0
let g:pairtools_coffee_antimagic = 1
let g:pairtools_coffee_antimagicfield = "Comment"
let g:pairtools_coffee_pcexpander = 1
let g:pairtools_coffee_pceraser = 1

" Configure TagWrench
let g:pairtools_coffee_tagwrenchhook = 'tagwrench#BuiltinNoHook'
let g:pairtools_coffee_twexpander = 0
let g:pairtools_coffee_tweraser = 0

" Maintain Folds
au BufWinLeave *.coffee mkview
au BufWinEnter *.coffee silent loadview

" spec-runner
map <leader>T :call RunAllTestsInScreen()<CR>
map <leader>t :call RunLocalTestsInScreen()<CR>
map <leader>t. :call RunSpecificTestsInScreen()<CR>
map <leader>D :call DebugAllTestsInScreen()<CR>
map <leader>d :call DebugLocalTestsInScreen()<CR>
map <leader>d. :call DebugSpecificTestsInScreen()<CR>
