import TUIO.*;

TuioProcessing tuio;
PImage naveuno;
PImage sol;
PImage mercurio;
PImage venus;
PImage tierra;

PImage fondo;
PImage img4;

//Posicion primera nave
float posX;
float posY;


void setup(){
 tuio =new TuioProcessing(this);
 fullScreen();
 fondo=loadImage("fondo.png");
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
  rect(100,100,100,40);
  
  //pinta una nave
  image(naveuno,posX,posY,60,60); 
  if(posX>=100 && posX<=200  | posY>=100 && posY<=140){
    ventanaJuego();
    exit();
  }
  
} 
  
void removeTuioObject(TuioObject marcadorTuio){
  if (marcadorTuio.getSymbolID()==30){
    print("Salió el token");
}
}
