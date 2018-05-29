Carpet carpet;
int sizeX = 50;
int offsetX = 10;

int maxCarpetSize =400;

void setup() {
  size(500,800);
  carpet = new Carpet();
  //colorMode(HSB);
}

void draw() {
  background(125);
 carpet.run(); 
}