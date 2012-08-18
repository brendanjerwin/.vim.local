set tabstop=2
set shiftwidth=2
set softtabstop=2

set foldmethod=indent
set nofoldenable
set expandtab

set colorcolumn=120
set nobomb
set relativenumber

if expand("%:p") =~ ".spec.coffee$"
    setlocal filetype=coffee.mocha
endif

IndentGuidesEnable
