import TUIO.*;

TuioProcessing tuio;
PImage naveuno;
PImage tierra;
PImage img3;
PImage img4;
float posX=800;
float posY=400;
void setup(){
 size (1000, 600);
 tuio =new TuioProcessing(this);
 //primera nave
 naveuno = loadImage("nave.png");
 
 //Planeta tierra
 tierra = loadImage("tierra.png");
 img3=loadImage("fondo.png");
 img4=loadImage("uranus.png");
}

void draw(){
  background(#676666); 
  image(img3, 0, 0,1000,600);
  image(tierra, 0, 50,200,200);
  image(naveuno,posX,posY,150,150);
  image(img4, 800, 50,200,200);
} 
void addTuioObject(TuioObject marcadorTuio){
  println("entro el token"+marcadorTuio.getSymbolID());
  println("La posición en X es: "+marcadorTuio.getX()*width+" Y: "+marcadorTuio.getY()*height);
}

void updateTuioObject(TuioObject marcadorTuio){
  println("entro el token"+marcadorTuio.getSymbolID());
  posX=round(marcadorTuio.getX()*width);
  posY=round(marcadorTuio.getY()*height);
  println("La posición en X es: "+marcadorTuio.getX()*width+" Y: "+marcadorTuio.getY()*height);
}  
void removeTuioObject(TuioObject marcadorTuio){
  if (marcadorTuio.getSymbolID()==30){
    print("Salió el token");
  }  
  
}
