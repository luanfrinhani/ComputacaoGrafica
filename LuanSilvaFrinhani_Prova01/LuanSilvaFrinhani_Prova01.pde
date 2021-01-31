/*Prova 01 de Computação Gráfica
  Nome do Professor: Jaques
  Nome do Aluno: Luan Silva Frinhani
  Matrícula: 2017102044
  Data de realização: 26/10/2020
  Data da entrega: 26/10/2020*/
  
//Utilização do PFont para escrever o texto
PFont f;

//Variáveis globais para a inversão das cores da bandeira
int r = 255;
int g = 255;
int b = 255;

void setup(){
/*Utilização de uma janela de 8 pixels maior para que tenha as bordas de 4 pixels
preservando o tamanho da bandeira de x = 700, y = 500*/
  size(700,500);
  background(255,255,255);
  f = createFont("Arial",16,true);
}
void draw(){
  
  /*Opção 1 do exercicio, bandeira do Brasil sem click*/
  if (mousePressed == false){ 
    //Criando o retangulo de cor verde
    strokeWeight(4);
    stroke(255,255,255);
    fill(0,150,0);
    rect(0,0,700,500);
    
    //Criação do losango amarelo
    noStroke();
    fill(255,255,0);
    quad(87.5,250,350,62.5,612.5,250,350,437.5);
    
    //Criação do disco azulado
    noStroke();
    fill(0,0,100);
    ellipse(350,250,233.33,233.33);
    
    //Criação do texto
    noStroke();
    textFont(f,20);
    fill(255,255,0);
    textAlign(CENTER);
    text("ORDEM e PROGRESSO",350,250);
    save("BandeiraOriginal.png");
  }
  
  /*Opção 2, bandeira do Brasil cores invertidas com click botão esquerdo*/
  if (mousePressed && mouseButton == LEFT){
    //Criação do quadrado verde
    strokeWeight(4);
    stroke(255,255,255);
    fill(r-0,g-150,b-0);
    rect(0,0,700,500);
  
    //Criação do losango amarelo
    noStroke();
    fill(r-255,g-255,b-0);
    quad(87.5,250,350,62.5,612.5,250,350,437.5);
  
    //Criação do disco azulado
    noStroke();
    fill(r-0,g-0,b-100);
    ellipse(350,250,233.33,233.33);
  
    //Criação do texto
    noStroke();
    textFont(f,20);
    fill(r-255,g-255,b-0);
    textAlign(CENTER);
    text("ORDEM e PROGRESSO",350,250);
    save("BandeiraInvertida.png");
  }
  
  //Opção 3, deslocamento de 3 objetos para a direita da imagem
  if (mousePressed && mouseButton == RIGHT){
    //Criando o quadrado de cor verde
    strokeWeight(4);
    stroke(255,255,255);
    fill(0,150,0);
    rect(0,0,700,500);
    
    //Criação do losango amarelo
    noStroke();
    fill(255,255,0);
    quad(150,250,412.5,62.5,675,250,412.5,437.5);
    
    //Criação do disco azulado
    noStroke();
    fill(0,0,100);
    ellipse(412.5,250,233.33,233.33);
    
    //Criação do texto
    noStroke();
    textFont(f,20);
    fill(255,255,0);
    textAlign(CENTER);
    text("ORDEM e PROGRESSO",412.5,250);
    save("BandeiraDeslocada.png");
  }
  
  //Opção 4, modificar o texto e o circulo do meio fazendo degrade
  if (keyPressed && (key == 't') || (key == 'T') ){
    //Criando o quadrado de cor verde
    strokeWeight(4);
    stroke(255,255,255);
    fill(0,150,0);
    rect(0,0,700,500);
    
    //Criação do losango amarelo
    noStroke();
    fill(255,255,0);
    quad(87.5,250,350,62.5,612.5,250,350,437.5);
    
    //Criação do disco azulado 
    noStroke();
    fill(0,0,100,100);
    ellipse(350,250,233.33,233.33);
    noStroke();
    fill(0,0,100,150);
    ellipse(350,250,100,100);
    noStroke();
    fill(0,0,100,200);
    ellipse(350,250,60,60);
    noStroke();
    fill(0,0,100);
    ellipse(350,250,30,30);
    
    //Criação do texto
    /*Para fazer os textos ficarem igual à imagem que o professor pediu, eu criei 
    3 textos em posições diferentes*/
    
    //Criação do texto ORDEM
    noStroke();
    textFont(f,20);
    fill(255,255,0);
    textAlign(CENTER);
    text("ORDEM",350,200);
    
    //Criação do texto E
    noStroke();
    textFont(f,20);
    fill(255,255,0);
    textAlign(CENTER);
    text("e",350,250);
    
    //Criação do texto PROGRESSO
    noStroke();
    textFont(f,20);
    fill(255,255,0);
    textAlign(CENTER);
    text("PROGRESSO",350,300);
    save("BandeiraTransparencia.png");
   }
}
