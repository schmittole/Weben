class Segment {
  
  int y;
  int sizeY;
  
  color c;
  
  public Segment(int y_, int sizeY_) {
    y = y_;
    sizeY = sizeY_;
    c = color(int(random(255)),int(random(255)),int(random(255)));
    //c = color(int(random(360)),100,100);
  }
  
  void show() {
    noStroke();
    fill(c);
    rect(sizeX, y, sizeX*4,sizeY);
  }
  
}