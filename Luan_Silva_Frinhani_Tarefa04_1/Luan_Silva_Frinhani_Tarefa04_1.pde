PImage img;
void setup(){
  size(728,410);
  img = loadImage("a.jpg");
  noLoop();
}
void draw(){
  loadPixels();
  img.loadPixels();
  for (int y = 0; y<height-1; y++){
    for (int x = 0; x<=width; x++){
      int loc = x + y*width;
      int disc = width-x + y*width;
      pixels[disc] = img.pixels[loc];
    }
  }
  updatePixels();
  save("a-invertida.png");
}
