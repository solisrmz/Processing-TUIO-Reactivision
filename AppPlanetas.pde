import TUIO.*;
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
float x, y;
int escena;
// declare a TuioProcessing client
TuioProcessing tuioClient;

// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;
PFont font;

boolean verbose = false; // print console debug messages
boolean callback = true; // updates only after callbacks
PImage img;

void setup()
{
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

  noCursor();
  fullScreen();
  
  // periodic updates
  if (!callback) {
    loop();
    frameRate(60);
  } else noLoop(); // or callback updates 
  
  font = createFont("Arial", 12);
  scale_factor = height/table_size;
  tuioClient  = new TuioProcessing(this);
}

void draw()
{
 //Se llama al menu principal
  menuInicio();
  if(id==4){
    //el valor para llamar la informacion del sistema solar es 1 y el fiducial que lo activa es el 4
    escena=1;
  }
  //El fiducial cinco activa la segunda escena que es ordenar los planetas el valor de escena es 2
  if(id==5){
    escena=2;
  }
  
  //el fiducial 6 es el boton de regreso en cada escena, retorna al menu principal
  if(id==6){
    escena=3;
  }
  
  //cuarta escena
  if(id==7){
    escena=4;
  }
  
  //dibuja el sistema solar
  if(escena==1){
    dibujaSistemaSolar();
  }
  //aqui el de ordenar planetas
  if(escena==2){
    ordenarPlanetas();
    println("Hola");
  }
  //menu principal
  if(escena==3){
    menuInicio();
  }
  //poner nombre al planeta
  if(escena==4){
    nombrePlanetas();
  }
}

void addTuioObject(TuioObject tobj) {
  if (verbose) println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  x=tobj.getX()*width;
  y=tobj.getY()*height;
  id=tobj.getSymbolID();
  println("Entro el objeto: "+id);
  println(x,y);
}

void updateTuioObject (TuioObject tobj) {
  if (verbose) println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
          +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
          x=tobj.getX()*width;
  y=tobj.getY()*height;
  id=tobj.getSymbolID();
  println("Entro el objeto: "+id);
  println(x,y);
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  if (verbose) println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
}

void addTuioCursor(TuioCursor tcur) {
  if (verbose) println("add cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
  //redraw();
}

void updateTuioCursor (TuioCursor tcur) {
  if (verbose) println("set cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
          +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
  //redraw();
}

void removeTuioCursor(TuioCursor tcur) {
  if (verbose) println("del cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
  //redraw()
}

void addTuioBlob(TuioBlob tblb) {
  if (verbose) println("add blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+") "+tblb.getX()+" "+tblb.getY()+" "+tblb.getAngle()+" "+tblb.getWidth()+" "+tblb.getHeight()+" "+tblb.getArea());
  //redraw();
}

void updateTuioBlob (TuioBlob tblb) {
  if (verbose) println("set blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+") "+tblb.getX()+" "+tblb.getY()+" "+tblb.getAngle()+" "+tblb.getWidth()+" "+tblb.getHeight()+" "+tblb.getArea()
          +" "+tblb.getMotionSpeed()+" "+tblb.getRotationSpeed()+" "+tblb.getMotionAccel()+" "+tblb.getRotationAccel());
  //redraw()
}

void removeTuioBlob(TuioBlob tblb) {
  if (verbose) println("del blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+")");
  //redraw()
}

void refresh(TuioTime frameTime) {
  if (verbose) println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
  if (callback) redraw();
}

void pintaInformacion(float posX, float posY,int id){
  if(id==2){
    
  if(posX>=520 && posX<=600 && posY>=300 && posY<=365){
    image(mercurioInfo,1000,0,150,350);
   
   }else if(posX>=750 && posX<=880 && posY>=400 && posY<=460){
     image(venusInfo, 1000,0,150,350);
     
   }else if(posX>=500 && posY<=180){
     image(tierraInfo, 1000,0,150,350);
     
   }else if(posX>=880 && posX<=962 && posY>=250 &&posY<=300){
     image(marteInfo, 1000,0,150,350);
     
   }else if(posX>=810 &&posX<=890 && posY>=600 &&posY<=710){
    image(jupiterInfo,1000,0,150,350);
    
  }else if(posX>=120 &&posX<=300 && posY>=120 && posY<=320){
    image(saturnoInfo,1000,0,190,400); 
    
  }else if(posX>=90 &&posX<=200 && posY>=500 && posY<=580){
    image(uranoInfo, 1000, 0, 150,350); 
    
  }else if(posX>=1100 &&posX<=1250 && posY>=648 && posY<=700){
    image(neptunoInfo, 1100,0,150,350);
  }  
  
  
  //PARA EL FIDUCIAL 3
  
  }else if(id==3){
  if(posX>=520 && posX<=600 && posY>=300 && posY<=365){
    image(mercurioInfo,1160,0,150,350);
   
   }else if(posX>=750 && posX<=880 && posY>=400 && posY<=460){
     image(venusInfo, 1160,0,150,350);
     
   }else if(posX>=500 && posY<=180){
     image(tierraInfo, 1160,0,150,350);
     
   }else if(posX>=880 && posX<=962 && posY>=250 &&posY<=300){
     image(marteInfo, 1160,0,150,350);
     
   }else if(posX>=810 &&posX<=890 && posY>=600 &&posY<=710){
    image(jupiterInfo,1160,0,150,350);
    
  }else if(posX>=120 &&posX<=300 && posY>=120 && posY<=320){
    image(saturnoInfo,1160,0,190,400); 
    
  }else if(posX>=90 &&posX<=200 && posY>=500 && posY<=580){
    image(uranoInfo, 1160, 0, 150,350); 
    
  }else if(posX>=1100 &&posX<=1250 && posY>=648 && posY<=700){
    image(neptunoInfo, 1160,0,150,350);
  }
  }else if(id==2 && id==3){
  if(posX>=520 && posX<=600 && posY>=300 && posY<=365){
    image(mercurioInfo,1160,0,150,350);
   
   }else if(posX>=750 && posX<=880 && posY>=400 && posY<=460){
     image(venusInfo, 1160,0,150,350);
     
   }else if(posX>=500 && posY<=180){
     image(tierraInfo, 1160,0,150,350);
     
   }else if(posX>=880 && posX<=962 && posY>=250 &&posY<=300){
     image(marteInfo, 1160,0,150,350);
     
   }else if(posX>=810 &&posX<=890 && posY>=600 &&posY<=710){
    image(jupiterInfo,1160,0,150,350);
    
  }else if(posX>=120 &&posX<=300 && posY>=120 && posY<=320){
    image(saturnoInfo,1160,0,190,400); 
    
  }else if(posX>=90 &&posX<=200 && posY>=500 && posY<=580){
    image(uranoInfo, 1160, 0, 150,350); 
    
  }else if(posX>=1100 &&posX<=1250 && posY>=648 && posY<=700){
    image(neptunoInfo, 1160,0,150,350);
  }
  }
  }
  
  
//Metodos para dibujar cada escena  
//menuu de inicio
void menuInicio(){ 
  background(#676666);
  rect(100,100,100,50);
  text("Iniciar",10,10);
}

//ordenar planetas
void ordenarPlanetas(){
  background(#676666);
  rect(100,100,100,50);
  text("Iniciar",10,10);
}
 
//poner nombre a planetas  
void nombrePlanetas(){
  background(#676666);
  rect(100,100,100,50);
  text("Iniciar",10,10);
}  
 
//dibujar el sistema solar
 void dibujaSistemaSolar(){
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
  
 
  textFont(font,12*scale_factor);
  float obj_size = object_size*scale_factor; 
  float cur_size = cursor_size*scale_factor; 
   
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0;i<tuioObjectList.size();i++) {
     TuioObject tobj = tuioObjectList.get(i);
     pushMatrix();
     translate(tobj.getScreenX(width),tobj.getScreenY(height));
     rotate(tobj.getAngle());
     image(navedos,-obj_size/2,-obj_size/2,obj_size,obj_size);
     popMatrix();
   }
   
   if(id==2){
     pintaInformacion(x,y,id);
   }
   
   if(id==3){
     pintaInformacion(x,y,id);
   }
   if(id==2 &&id==3){
     pintaInformacion(x,y,id);
   }
  }
