import ddf.minim.*;

AudioPlayer player;
Minim minim;

  

int horas = hour(); // Captura as horas do sistema
int minutos = minute(); // Captura os minutos do sistema
int segundos = second(); // Captura os segundos do sistema
int dia = day(); // Captura o dia do sistema
int mes = month(); // Captura o mês do sistema
int ano = year(); // Captura o ano do sistema

float posPonteiroHoras = ((horas * PI)/6) + ((3 * PI) / 2); // determina a posição do ponteiro das horas
float posPonteiroMinutos = ((minutos * PI) / 30) + ((3 * PI) / 2); // determina a posição do ponteiro dos minutos
float posPonteiroSegundos = ((segundos * PI) / 30) + ((3 * PI) / 2); // determina a posição do ponteiro dos segundos


float cameraRotateX;
float cameraRotateY;
float cameraSpeed;

PFont ind; // Utilizada para criação de textos no programa
float ang = ((2 * PI) / 60);
float raio = 320;

void setup() {
  fullScreen(P3D);
  cameraSpeed = PI / width;
  cameraRotateY = - 0.1 * PI ;
  ind = createFont("Arial", 12, true);
  minim = new Minim(this);
  player = minim.loadFile("mickey-song.mp3", 2048);
  player.play();
  ortho(-width/2, width/2, -height/2, height/2);
}

void draw() {
  
  //Realiza a mudança de angulação do ponteiro dos minutos
  if(minutos != minute()){
    minutos = minute();
    posPonteiroMinutos = ((minutos * PI) / 30) + ((3 * PI) / 2);
  }
  //Realiza a mudança de angulação do ponteiro das horas
  if(horas != hour()){
    horas = hour();
    posPonteiroHoras = ((horas * PI) / 6) + ((3 * PI) / 2);
  }
  //Realiza a mudança de angulação do ponteiro dos segundos
  if(segundos != second()){
    segundos = second();
    posPonteiroSegundos = ((segundos * PI) / 30) + ((3 * PI) / 2);
  }
  lights();
  ambientLight(30, 30, 30);
  background(102,205,170);
  configCamera();
  pushMatrix();
  cylinder(200, 200, 50, 200);
  ponteiroMinutos();
  ponteiroHoras();
  ponteiroSegundos();
  indicadoresPrimarios();
  indicadoresSecundarios();
  indicadoresTerciarios();
  mickey();
  data();
  popMatrix();
}

void configCamera(){
  translate(width * 0.5, height * 0.3);
  rotateX(cameraRotateY);
  rotateY(cameraRotateX);
}

void mouseMoved() {
  cameraRotateX += (mouseX - pmouseX) * cameraSpeed;
  cameraRotateY += (pmouseY - mouseY) * cameraSpeed;
  cameraRotateY = constrain(cameraRotateY, -HALF_PI, 0);
}

void cylinder(float bottom, float top, float h, int sides)
{
  
  
  translate(0, height * 0.5, 0);
  fill(64, 64, 64);
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
  
  float[] x2 = new float[sides+1];
  float[] z2 = new float[sides+1];
 
  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * bottom;
    z[i] = cos(angle) * bottom;
  }
  
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x2[i] = sin(angle) * top;
    z2[i] = cos(angle) * top;
  }
 
  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN);
 
  vertex(0, -h/2, 0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
  }
 
  endShape();
   noStroke();
  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
    vertex(x2[i], h/2, z2[i]);
  }
 
  endShape();
  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN); 
 
  vertex(0,   h/2,    0);
   
  for(int i=0; i < x.length; i++){
    vertex(x2[i], h/2, z2[i]);
  }
 
  endShape();
  
  // Desenha borda preta
  rotateX(PI/2.0);
  translate(0, 0, 28);
  stroke(0, 0, 0);
  strokeWeight(10);
  ellipse(0, 0, 400, 400);
  
  // Desenha borda laranja
  stroke(255, 100, 0);
  strokeWeight(2);
  ellipse(0, 0, 400, 400);
}

void ponteiroSegundos(){
  float Xs =  cos(posPonteiroSegundos) * 150;
  float Ys =  sin(posPonteiroSegundos) * 150;
  strokeWeight(2);
  stroke(100, 250, 50);
  line(0, 0, Xs, Ys);
  fill(0, 0, 0);
  ellipse(0, 0, 5, 5);
}

void ponteiroMinutos(){
  float Xm = cos(posPonteiroMinutos) * 130;
  float Ym = sin(posPonteiroMinutos) * 130;
  stroke(128, 128, 128);
  strokeWeight(3);
  line(0, 0, Xm, Ym);
}

void ponteiroHoras(){
  float Xh = cos(posPonteiroHoras) * 100;
  float Yh = sin(posPonteiroHoras) * 100;
  strokeWeight(3);
  stroke(128, 128, 128);
  line(0, 0, Xh, Yh);
}

void indicadoresPrimarios(){
  int cont = 0;
  for (float i = 0; i < 2*PI; i+= PI/2){
   float Px = cos(i) * (raio - 150);
   float Py = sin(i) * (raio-150);
   if (cont == 0){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("3", Px, Py);
   }
   else if(cont == 1){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("6", Px, Py);
   }
   else if(cont == 2){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("9", Px, Py);
   }
   else if(cont == 3){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("12", Px, Py);
   }
   cont++;
 }
}

void indicadoresSecundarios(){
  for (float f = 0; f < degrees(2 * PI); f += degrees(ang)) {
    float Vx = cos(radians(f)) * (raio-150);
    float Vy = sin(radians(f)) * (raio-150);
    if (f != 0 && f != degrees(PI/2) && f != degrees(3*PI/2) && f != degrees(PI)){
      noStroke();
      fill(128.01, 128.01, 128.01);
      ellipse(Vx, Vy, 3, 3); 
    }
  }
}

void indicadoresTerciarios(){
   for (float i = 0; i < degrees(2 * PI); i += degrees(PI/6)){
     float Px = cos(radians(i)) * (raio-150);
     float Py = sin(radians(i)) * (raio-150);
     if (i !=0 && i != degrees(PI/2) && i != degrees(3*PI/2) && i != degrees(PI)){
       noStroke();
       fill(0, 0, 0);
       ellipse (Px, Py, 6,6);
     }
   }
}

void mickey(){
  noStroke();
  fill(0, 0, 0);
  ellipse(0, 0, 50, 50);
  ellipse(-27, -15, 30, 30);
  ellipse(28, -15, 30, 30);
}

void data(){
  String d = String.valueOf(dia);
  String m = String.valueOf(mes);
  String y = String.valueOf(ano);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(-80, -15, 20, 20);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(d, -70, 0);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(60, -15, 20, 20);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(m, 70, 0);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(-21, 50, 40, 25);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(y, 0, 70);
}
