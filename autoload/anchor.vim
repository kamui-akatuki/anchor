execute "source" expand("<sfile>:p:h")."/../lupus_packages/floating_window/window.vim"
let g:width = nvim_get_option("columns")
let g:height = nvim_get_option("lines")
let g:window = Window(g:width / 4, g:height / 4, g:width / 2, g:height / 2)
let g:win_id = 0
let g:files = []
function! anchor#open()
  let g:win_id = g:window.create()
  setlocal number
  nnoremap <buffer> <Enter> :call anchor#move()<CR>
  nnoremap <buffer> d :call anchor#delete()<CR>
  call setline(1, g:files)
endfunction
function! anchor#delete()
  %delete _
  let index = getcurpos()[1]
  call remove(g:files, index - 1)
  call setline(1, g:files)
endfunction
function! anchor#move()
  if len(g:files) == 0
    q
    return
  endif
  let index = getcurpos()[1]
  q
  call execute("e ".g:files[index - 1])
endfunction
function! anchor#add()
  let path = expand("%")
  let g:files = g:files + [path]
endfunction
function! anchor#init(path)
  let g:files = readfile(a:path)
endfunction
