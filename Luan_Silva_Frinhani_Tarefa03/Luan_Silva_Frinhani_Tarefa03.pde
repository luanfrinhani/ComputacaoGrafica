PImage img;

void setup(){
  size(728,410);
  img = loadImage("a.jpg");
}
void draw(){
  loadPixels();
  img.loadPixels();
  for (int y = 0; y<height; y++){
    for (int x = 0;x<width; x++){
      int loc = x + y*width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      pixels[loc] = color(255-r,255-g,255-b);
    }
  }
  updatePixels();
  save("a_inverso.png");
}
