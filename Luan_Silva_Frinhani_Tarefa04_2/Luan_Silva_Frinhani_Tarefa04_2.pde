PImage img;
void setup(){
  size(728,410);
  img = loadImage("a.jpg");
}
void draw(){
  loadPixels();
  img.loadPixels();
  for (int y = 0; y<height; y++){
    for (int x = 0; x<width; x++){
      int aux = x + y*width;
      int aux2 = width*(height-y) - (width-x);
      pixels[aux2] = img.pixels[aux];
    }
  }
  updatePixels();
  save("a-invertida.png");
}
