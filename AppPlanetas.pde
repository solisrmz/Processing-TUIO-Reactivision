import TUIO.*;
TuioProcessing tuio;

PImage naveuno;
PImage navedos;
PImage sol;
PImage mercurio;
PImage venus;
PImage tierra;
PImage marte;
PImage jupiter;
PImage saturno;
PImage urano;
PImage neptuno;
PImage mercurioInfo;
PImage venusInfo;
PImage tierraInfo;
PImage marteInfo;
PImage jupiterInfo;
PImage saturnoInfo;
PImage uranoInfo;
PImage neptunoInfo;
PImage fondo;
PImage img4;
int id;

//Posicion primera nave
float posX,posZ;
float posY,posM;

//Posicion segunda nave
float posX2, posZ2;
float posY2, posM2;


void setup(){
 tuio =new TuioProcessing(this);
 fullScreen();
 
 //Sol
 sol=loadImage("Sun.png");
 
 //Mercurio
 mercurio=loadImage("Mercurio.png");
 
 //Venus
 venus=loadImage("venus.png");
 
 //Tierra
 tierra = loadImage("tierra.png");
 
 //Marte
 marte= loadImage("mars.png");
 
 //Jupiter
 jupiter=loadImage("jupiter.png");
 
 //Saturno
 saturno=loadImage("saturn.png");
 
 //Urano
 urano=loadImage("uranus.png");
 
 //Neptuno
 neptuno=loadImage("neptune.png");
 
 //Primera nave
 naveuno = loadImage("nave.png");
 
 //Segunda nave
 navedos = loadImage("cohete.png");
 
 //Fondo de la interfaz
 fondo=loadImage("fondo.png");
 
 //Información del sol
 img4=loadImage("infoSol.png");
 
 //Información Mercurio
 mercurioInfo=loadImage("mercurioInfo.png");
 
 //Información Venus
 venusInfo=loadImage("venusInfo.png");
 
 //Información Tierra
 tierraInfo=loadImage("tierraInfo.png");
 
 //Información Marte
 marteInfo=loadImage("marteInfo.png");
 
 //Información Júpiter
 jupiterInfo=loadImage("jupiterInfo.png");
 
 //Información Saturno
 saturnoInfo=loadImage("saturnoInfo.png");
 
 //Información Urano
 uranoInfo=loadImage("uranoInfo.png");
 
 //Información de Neptuno
 neptunoInfo=loadImage("neptunoInfo.png");
 
}


void addTuioObject(TuioObject marcadorTuio){
  posX2=round(marcadorTuio.getX()*width);
  posY2=round(marcadorTuio.getY()*height);
  id=marcadorTuio.getSymbolID();
  println("entro el token"+marcadorTuio.getSymbolID());
  println("La posición en X es: "+marcadorTuio.getX()*width+" Y: "+marcadorTuio.getY()*height); 
  image(navedos,posX,posY,90,90); 
  image(navedos,posX2,posY2,90,90);
}

void updateTuioObject(TuioObject marcadorTuio){
  println("Entró el token"+marcadorTuio.getSymbolID());
  posX=round(marcadorTuio.getX()*width);
  posY=round(marcadorTuio.getY()*height);
  
  posX2=round(marcadorTuio.getX()*width);
  posY2=round(marcadorTuio.getY()*height);
  println("La posición en X es: "+marcadorTuio.getX()*width+" Y: "+marcadorTuio.getY()*height);
  image(navedos,posX,posY,90,90);
  image(navedos,posX2,posY2,90,90);


}

void draw(){
  //Fondo
  background(#676666); 
  image(fondo, 0, 0,1800,800);
  
  //Aquí se dibujan las órbitas
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
  
  //Llama a la otra función  
  //Dibuja nave uno
  image(navedos,posX,posY,90,90);
  image(navedos,posX2,posY2,90,90);

  
  //Dibuja nave dos
  
} 
  
void removeTuioObject(TuioObject marcadorTuio){
  if (marcadorTuio.getSymbolID()==30){
    print("Salió el token");
  }
}

void pintaInformacion(float posX, float posY){
  if(id==15){
  if(posX>=400 && posX<=470 && posY>=300 && posY<=365){
    image(mercurioInfo,1000,0,150,350);
   //Para dibujar las tarjetas de mercurio 
   
   }else if(posX>=700 && posY<=390){
     image(venusInfo, 1000,0,150,350);
     
   }else if(posX>=500 && posY<=180){
     image(tierraInfo, 1000,0,150,350);
     
   }else if(posX>=750 && posY<=700){
    image(jupiterInfo,1000,0,150,350);
    //para dibujar las tarjetas de venus
    
  }else if(posX>=120 && posY<=600){
    image(saturnoInfo,90,130,190,400);
    
  }else{
    print("ingresa bien el token");
  } 
  }
}
/*
void muestraInformacion(float posX2, float posY2){
  if(posX2>=400 && posY2<=342){
    image(mercurioInfo,0,1160,150,350);
    
   }else if(posX2>=750 && posY2<=700){
    image(jupiterInfo,1160,0,150,350);
    
  }else if(posX2>=120 && posY2<=600){
    image(saturnoInfo,90,130,190,400);
  }else{
    print("ingresa bien el token");
  } 
  
  
  
}*/

void ventanaJuego(){
  
}
  
