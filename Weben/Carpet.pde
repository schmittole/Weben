class Carpet {

  Segment[] segments;
  
  int carpetSize;
  
  boolean onButton = false;
  
  ArrayList<Button> buttons;
  
  int offSetY = 30;
  
  int scalar = 2;
  
  boolean rel;
  
  public Carpet() {
    segments = new Segment[6];
    makeCarpet();
    makeButtons();
  }
  
  void makeButtons() {
   int rnd = int(random(90, 100));
   buttons = new ArrayList<Button>();
   for(int i = 0; i < rnd; i++) {
    buttons.add(new Button(getRandomPoint()));
   }
  }
  
  PVector getRandomPoint() {
    int rndX = int(random(sizeX+30,sizeX*5-30));
    int rndY = int(random(offSetY*2,carpetSize-offSetY));
    return new PVector(rndX,rndY);
  }
  
  void run() {
    checkInput();
    runSegments();
    onButton = runButtons();
  }
  
  boolean runButtons() {
    boolean out = false;
    for(Button b : buttons) {
     b.show();
     if(b.check(new PVector(mouseX, mouseY))) {
      out = true; 
     }
    }
    return out;
  }
  
  void runSegments() {
   for(Segment s : segments) {
    s.show(); 
   }
  }
  
  void mouseReleased() {
   rel = true; 
  }
  
  void checkInput() {
    if(mousePressed && onButton) {
      makeCarpet();
      makeButtons();
      rel = false;
    }
  }
  
  void makeCarpet() {
    segments[0] = new Segment(offSetY, 65*scalar);
    segments[1] = new Segment(segments[0].y+segments[0].sizeY, 30*scalar);
    segments[2] = new Segment(segments[1].y+segments[1].sizeY, 43*scalar);
    segments[3] = new Segment(segments[2].y+segments[2].sizeY, 80*scalar);
    segments[4] = new Segment(segments[3].y+segments[3].sizeY, 52*scalar);
    segments[5] = new Segment(segments[4].y+segments[4].sizeY, 20*scalar);
    
    carpetSize = 0;
    carpetSize+=offSetY;
    for(Segment s : segments) {
     carpetSize += s.sizeY;
    }
  }
  
  void incYs() {
    int inc = carpetSize/6;
   segments[0].sizeY += inc;
   carpetSize -= inc;
   for(int i = 1; i < segments.length; i++) {
    segments[i].y +=inc;
    segments[i].sizeY +=inc;
    carpetSize -= inc;
   }
   println("AFTER "+carpetSize);
  }
  
  int getRandomY() {
    int out = int(random(maxCarpetSize/6-30, maxCarpetSize/6+30));
    while(out > maxCarpetSize/6) {
      out = int(random(maxCarpetSize/6-30, maxCarpetSize/6+30));
    }
    return out;
  }
}