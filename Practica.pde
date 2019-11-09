import TUIO.*;

TuioProcessing tuio;
PImage img;
PImage img2;
PImage img3;
PImage img4;
float posX=800;
float posY=400;
void setup(){
 size (1000, 600);
 tuio =new TuioProcessing(this);
 img = loadImage("nave.png");
 img2 = loadImage("tierra.png");
 img3=loadImage("fondo.png");
 img4=loadImage("uranus.png");
}

void draw(){
  background(#676666); 
  image(img3, 0, 0,1000,600);
  image(img2, 0, 50,200,200);
  image(img,posX,posY,150,150);
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
