import TUIO.*;

TuioProcessing tuio;
PImage naveuno;
PImage sol;
PImage mercurio;
PImage venus;
PImage tierra;
PImage marte;
PImage jupiter;
PImage saturno;
PImage urano;
PImage neptuno;

PImage fondo;
PImage img4;

//Posicion primera nave
float posX;
float posY;

float pox;
float poy;


void setup(){
 tuio =new TuioProcessing(this);
 fullScreen();
 //sol
 sol=loadImage("Sun.png");
 
 //mercurio
 mercurio=loadImage("Mercurio.png");
 
 //Venus
 venus=loadImage("venus.png");
 
 //Planeta tierra
 tierra = loadImage("tierra.png");
 
 //marte
 marte= loadImage("mars.png");
 
 //jupiter
 jupiter=loadImage("jupiter.png");
 
 //saturno
 saturno=loadImage("saturn.png");
 
 //urano
 urano=loadImage("uranus.png");
 
 //neptuno
 neptuno=loadImage("neptune.png");
 
 //primera nave
 naveuno = loadImage("nave.png");
 
 fondo=loadImage("fondo.png");
 img4=loadImage("infoSol.png");
}


void addTuioObject(TuioObject marcadorTuio){
  image(naveuno,posX,posY,60,60);
  println("entro el token"+marcadorTuio.getSymbolID());
  println("La posición en X es: "+marcadorTuio.getX()*width+" Y: "+marcadorTuio.getY()*height);

}

void updateTuioObject(TuioObject marcadorTuio){
  println("entro el token"+marcadorTuio.getSymbolID());
  posX=round(marcadorTuio.getX()*width);
  posY=round(marcadorTuio.getY()*height);
  println("La posición en X es: "+marcadorTuio.getX()*width+" Y: "+marcadorTuio.getY()*height);
  image(naveuno,posX,posY,60,60);
}

void draw(){
    //fondo
  background(#676666); 
  image(fondo, 0, 0,1800,800);
  
  //aqui se dibujan las órbitas
  ellipse(670,380,1300,1300);
  ellipse(670,380,1150,1150);
  ellipse(670,380,1000,1000);
  ellipse(670,380,850,850);  
  ellipse(670,380,700,700);
  ellipse(670,380,550,550);
  ellipse(670,380,400,400);
  ellipse(670,380,250,250);
  stroke(#DBD9D9);
  noFill();
  
  //sol
  image(sol, 595,305,150,150);
  
  //mercurio
  image(mercurio, 500,300, 85,85);  
  
  //venus
  image(venus, 800, 400, 90,90);
  
  //tierra
  image(tierra, 550, 150,100,100);
  
  //marte
  image(marte, 850,200,130,130);
  
  //jupiter
  image(jupiter, 750,600,160,160);
  
  //saturno
  image(saturno, 160,200,190,190);
  
  //urano
  image(urano, 70, 500, 120,120);
  
  //neptuno
  image(neptuno, 1190, 650, 90,90);
  
  //Llama a la función pintar cuadro de informacion
  pintaInformacion(posX, posY);
  
  //pinta una nave
  image(naveuno,posX,posY,60,60);
  
} 
  
void removeTuioObject(TuioObject marcadorTuio){
  if (marcadorTuio.getSymbolID()==30){
    print("Salió el token");
}
}

void pintaInformacion(float posX, float posY){
    //Para dibujar tarjetas con información del sol
  if(posX>=445 && posX<=670  | posY>=305 && posY<=400){
    image(img4, 730,230,300,100);
  }
  print("Salió el token");
} 
void ventanaJuego(){
  
}
  
