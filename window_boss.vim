set equalalways
set eadirection=hor

"Window Navigation
nmap <C-k> <C-w>k<C-w>_
nmap <C-j> <C-w>j<C-w>_
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

imap <C-k> <C-w>k<C-w>_
imap <C-j> <C-w>j<C-w>_
imap <C-h> <C-w>h
imap <C-l> <C-w>l

" Window resizing mappings /*{{{*/
function! Resize(dir)
  let this = winnr()
  if '+' == a:dir || '-' == a:dir
    silent! exe "normal! \<c-w>k"
    "execute "normal <c-w>k"
    let up = winnr()
    if up != this
      "execute "normal <c-w>j"
      silent! exe "normal! \<c-w>j"
      let x = 'bottom'
    else
      let x = 'top'
    endif
  elseif '>' == a:dir || '<' == a:dir
    "execute "normal <c-w>h"
    silent! exe "normal! \<c-w>h"
    let left = winnr()
    if left != this
      "execute "normal <c-w>l"
      silent! exe "normal! \<c-w>l"
      let x = 'right'
    else
      let x = 'left'
    endif
  endif
  echo x
  if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>+"
  elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>-"
  elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w><"
  elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w>>"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction
" /*}}}*/

nnoremap <S-Up> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <S-Down> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <S-Left> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <S-Right> :normal <c-r>=Resize('>')<CR><CR>

"Window Swap
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

noremap <silent> <C-w>sm :call MarkWindowSwap()<CR>
noremap <silent> <C-w>sp :call DoWindowSwap()<CR>
