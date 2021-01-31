PImage img;
void setup(){
  size(728,410);
  img = loadImage("a.jpg");
  noLoop();
}

void draw(){
  loadPixels();
  img.loadPixels();
  float theta = radians(57);
  PVector A,B,C,D;
  for (int y=0;y<height;y++){
    for (int x=0;x<width;x++){
      int old = x + y*width;
      float x2 = (x - width/2)*cos(theta) + (y - height/2)*(sin(theta));
      float y2 = (x - width/2)*(-sin(theta)) + (y - height/2)*cos(theta);
      x2 = x2 + width/2;
      y2 = y2 + height/2;
      float delta_col = (float)x2 - (int)x2;
      float delta_lin = (float)y2 - (int)y2;
      int x2novo = (int)x2;
      int y2novo= (int)y2;     
      A = new PVector(red(img.get(x2novo,y2novo)),green(img.get(x2novo,y2novo)),blue(img.get(x2novo,y2novo)));
      B = new PVector(red(img.get(x2novo+1,y2novo)),green(img.get(x2novo+1,y2novo)),blue(img.get(x2novo+1,y2novo)));
      C = new PVector(red(img.get(x2novo,y2novo+1)),green(img.get(x2novo,y2novo+1)),blue(img.get(x2novo,y2novo+1)));
      D = new PVector(red(img.get(x2novo+1,y2novo+1)),green(img.get(x2novo+1,y2novo+1)),blue(img.get(x2novo+1,y2novo+1)));
      PVector ctrlAB = new PVector(0,0,0), ctrlCD = new PVector(0,0,0);
      ctrlAB.add(A);
      ctrlAB.mult(-1);
      ctrlAB.add(B);
      ctrlAB.mult(delta_col);
      ctrlAB.add(A);
      
      ctrlCD.add(C);
      ctrlCD.mult(-1);
      ctrlCD.add(D);
      ctrlCD.mult(delta_col);
      ctrlCD.add(C);
       
      PVector Px = new PVector(0,0,0);
      Px.add(ctrlAB);
      Px.mult(-1);
      Px.add(ctrlCD);
      Px.mult(delta_lin);
      Px.add(ctrlAB);
      
      pixels[old] = color(Px.x,Px.y,Px.z);      
    }
  }
  updatePixels();
  save("a-rotação.png");  
}
