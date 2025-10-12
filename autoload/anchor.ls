#include <floating_window/window>

let g_width=nvim_get_option("columns");
let g_height=nvim_get_option("lines");
let g_window=Window(g_width/4,g_height/4,g_width/2,g_height/2);
let g_win_id=0;
let g_files=[];

fn anchor#open(){
  g_win_id=g_window.create();
  `setlocal number`;
  `nnoremap <buffer> <Enter> :call anchor#move()<CR>`;
  `nnoremap <buffer> d :call anchor#delete()<CR>`;
  setline(1,g_files);
}

fn anchor#delete(){
  `%delete _`;
  let index=getcurpos()[1];
  remove(g_files,index-1);
  setline(1,g_files);
}

fn anchor#move(){
  if (len(g_files)==0){
    `q`;
    return;
  }
  let index=getcurpos()[1];
  `q`;
  execute(print("e {}",g_files[index-1]));
}

fn anchor#add(){
  let path=expand("%");
  g_files+=[path];
}

fn anchor#init(path:string){
  g_files=readfile(path);
}
