class Window{
  config={
    "style":"minimal",
    "relative":"editor",
    "width":1,
    "height":1,
    "row":1,
    "col":1,
    "focusable":true
  };
  id:string;
  fn Window(x:int,y:int,width:int,height:int){
    self.config.width=width;
    self.config.height=height;
    self.config.col=x;
    self.config.row=y;
  }
  fn create(self){
    const buf=nvim_create_buf(false,true);
    self.id=nvim_open_win(buf,true,self.config);
    return self.id;
  }
  fn update(self){
    nvim_win_set_config(self.id,self.config);
  }
}
