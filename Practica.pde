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
  image(sol, 570,280,200,200);
  
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
