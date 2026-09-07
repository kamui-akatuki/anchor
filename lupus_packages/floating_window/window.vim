function! Window(...)
  let self = {}
  let self.config = {"style":"minimal", "relative":"editor", "width":1, "height":1, "row":1, "col":1, "focusable":v:true}
  let self.id=""
  function! self.Window(x, y, width, height)
    let self.config.width = a:width
    let self.config.height = a:height
    let self.config.col = a:x
    let self.config.row = a:y
  endfunction
  call self.Window(a:1, a:2, a:3, a:4)
  function! self.create()
    const buf = nvim_create_buf(v:false, v:true)
    let self.id = nvim_open_win(buf, v:true, self.config)
    return self.id
  endfunction
  function! self.update()
    call nvim_win_set_config(self.id, self.config)
  endfunction
  return self
endfunction
