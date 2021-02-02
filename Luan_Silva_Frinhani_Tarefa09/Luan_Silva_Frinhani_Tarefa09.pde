void setup(){
  size(625,475,P3D);
  background(0,255,255);
}
void draw(){
  stroke(0);
  strokeWeight(1.5);
  
  
  noLights();
  //Predio
  fill(153,51,153);
  //Luz para o predio tirando as janelas e a porta
  directionalLight(153, 51, 153, 100, 270, 20 - mouseY);
  quad(400,100,600,100,600,450,400,450);
  
  noLights();
  //Janelas
  fill(0,0,0);
  rect(425,125,60,30);
  fill(255,255,0);
  rect(510,125,60,30);
  line(540,125,540,155);
  fill(255,255,0);
  rect(425,175,60,30);
  line(455,175,455,205);
  rect(510,175,60,30);
  line(540,175,540,205);
  rect(425,225,60,30);
  line(455,225,455,255);
  rect(510,225,60,30);
  line(540,225,540,255);
  rect(425,275,60,30);
  line(455,275,455,305);
  fill(0,0,0);
  rect(510,275,60,30);
  fill(255,255,0);
  rect(425,325,60,30);
  line(455,325,455,355);
  fill(0,0,0);
  rect(510,325,60,30);
  
  
  //Portas
  fill(0,0,255);
  //Luz para a porta
  spotLight(0, 0, 255, mouseX - 50, 400, 680, 0, 0, -1, PI/16, 100); 
  quad(455,375,540,375,540,450,455,450);
  line(497,375,497,450);
  fill(0,0,0);
  ellipse(487,412,5,5);
  fill(0,0,0);
  ellipse(507,412,5,5);
  
  //Tronco
  lights();
  fill(148,74,0);
  ambientLight(mouseX/2,mouseY/10,mouseX/100,0,0,-1);
  quad(250,375,270,375,270,450,250,450);

  //Folhas
  noLights();
  fill(0,255,0);
  ellipse(260,380,100,50);
  
  noStroke();
  lights();
  fill(255*0.502,255*0.502,255*0.502);
  pointLight(255, 255, 255, 600-mouseX, mouseY, 400);
  translate(180, 120, 0);
  sphere(60);
  noLights();
  if (frameCount == 60){
    save("Trabalho01.png");
  }
  else if (frameCount == 120){
    save("Trabalho02.png");
  }
  else if (frameCount == 340){
    save("Trabalho03.png");
  }
  else if (frameCount == 580){
    save("Trabalho04.png");
  }
}
