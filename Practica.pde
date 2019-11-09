import TUIO.*;

TuioProcessing tuio;
PImage naveuno;
PImage sol;
PImage mercurio;
PImage venus;
PImage tierra;



PImage img3;
PImage img4;
float posX=800;
float posY=400;
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
 
 //primera nave
 naveuno = loadImage("nave.png");
 
 
 img3=loadImage("fondo.png");
 img4=loadImage("uranus.png");
}

void draw(){
  //fondo
  background(#676666); 
  image(img3, 0, 0,1800,800);
  
  //sol
  image(sol, 560,250,270,270);
  
  //mercurio
  image(mercurio, 450,300, 90,90);
  
  //venus
  image(venus, 870, 400, 95,95);
  
  //tierra
  image(tierra, 550, 100,100,100);
  
  //naves
  image(naveuno,posX,posY,60,60);
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
