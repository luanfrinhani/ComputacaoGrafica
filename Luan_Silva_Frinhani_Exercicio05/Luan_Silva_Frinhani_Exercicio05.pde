PImage img;

void setup(){
  size(728,410);
  img = loadImage("a.jpg");
  noLoop();
}

void draw(){
  loadPixels();
  img.loadPixels();
  float theta = radians(33);
  for (int y=0;y<height;y++){
    for (int x=0;x<width;x++){
      int loc = x + y*width;
      int x2 = (int)((x*cos(theta)) + (y*(-sin(theta))));
      int y2 = (int)((x*sin(theta)) + (y*cos(theta)));
      int disc = (x2 + y2*width);
      pixels[disc] = img.pixels[loc];
    }
  }
  updatePixels();
  save("a-ratacao.png");
}
