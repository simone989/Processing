


 Baloon x= new Baloon(200,600,5);
 ArrayList<Baloon> Vettore= new ArrayList<Baloon>();
 PFont font1;
 int Nstati0;
 char NChar;

void setup(){
  size(600,600);
  background(92,227,226);
  Nstati0=0;
  font1=loadFont("AbyssinicaSIL-48.vlw");
  textFont(font1);
 
  x.Creazione();
  
  frameRate(30);
}


void keyPressed(){
  if(key=='n'){ 
  int Nrandom=(int)random(0,600);
   int Vrandom= (int)random(1,5);
  println(Nrandom+" "+Vrandom);
   Vettore.add( new Baloon(Nrandom,600,Vrandom));
   
  }
}

void mousePressed(){
  for(int i=0 ; i<Vettore.size(); i++){
   float tempX;
   float tempY;
   tempX=Vettore.get(i).x;
   tempY=Vettore.get(i).y;
   if(mouseX >tempX && mouseX<tempX+20 && mouseY>tempY && mouseY<tempY+25){
     println("Decrementato");
    Vettore.get(i).Decre();
   }
   
  }
  
}


class Baloon{
 float x,y;
 int stato;
 float VelSp;
 int IndiceAltezza;
 Baloon(int _x,int _y,int _VelSp){
   x=_x;
   y=_y;
   VelSp=_VelSp;
   stato=3;
   IndiceAltezza=0;
 }
 
 void Decre(){
   if(stato ==1){
    Nstati0++;
    stato--;
   }
  stato--; 
 }
 
 void Creazione(){
   IndiceAltezza+=VelSp;
   if(stato==3 || stato==2 || stato==1){
     noStroke();
     if(stato==3) fill(10,240,53);
     if(stato==2) fill(250,243,10);
     if(stato==1) fill(255,0,0);
     
     ellipse(x,y,20,25);
     stroke(1);
    
     line(x,y+12,x,y+52);
   
   }else if(stato<=0){
     
     noStroke();
     fill(0);
     ellipse(x,y,5,25);
     stroke(1);
    
     line(x,y-12,x,y-52);
    
     
     
   }
 }
 void updateB(){
 // x=x-VelSp;
 if(stato>0){
  y=y-VelSp;
  Creazione();
  
 }else if(stato==0){
  VelSp=VelSp-0.08; 
  y=y-VelSp;
  Creazione();
 }
 
 }
  
}



void draw(){
 background(92,227,226);
 for(int i=0 ; i<Vettore.size() ;i++){
   Vettore.get(i).updateB();
 }
 fill(0);
 text(Nstati0,10,33);
  
  
  
  
}