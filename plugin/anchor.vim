if exists("g:anchor_loaded")
  finish
endif

let g:anchor_loaded=1

nmap <Plug>(anchor_add) :call anchor#add()<CR>
nmap <Plug>(anchor_move) :call anchor#open()<CR>
