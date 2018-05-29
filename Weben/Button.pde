class Button {
 
  PVector pos;
  color c;
  
  int size;
  
  public Button(PVector p) {
    pos = new PVector(p.x,p.y);
    c = color(int(random(255)),int(random(255)),int(random(255)));
    //c = color(int(random(360)),100,100);
    //size = int(random(10,20));
    size = 10;
  }
  
  boolean check(PVector p) {
    return inX(p.x) && inY(p.y);
  }
  
  boolean inX(float x) {
    return x >=pos.x-size && x <= pos.x+size;
  }
  
  boolean inY(float y) {
    return y <= pos.y+size && y >= pos.y-size;
  }
  
  void show() {
   noStroke();
   fill(c);
   ellipse(pos.x,pos.y,size,size);
  }
  
}