class Bomb{
  float X1,Y2;
  float VelB;
  Bomb(float x,float y){
   X1=x;
   Y2=y;
   VelB=0;
   }
   
   void Sposta(){
     Y2=Y2-VelB;
   }
   
   void update(){
     if(VelB>18){
      fill(255,0,0);
      noStroke();
      ellipse(X1,Y2,18,18);
     }else if((VelB<=18)&&(VelB>8)){
       fill(0,255,0);
      noStroke();
      ellipse(X1,Y2,18,18);
     }else if(VelB<=8){
      fill(0,0,255);
      noStroke();
      ellipse(X1,Y2,18,18);
       
     }
     
   }
}


class Cannon{
  float X1,Y2;
  Cannon(float x,float y){
  X1=x;
  Y2=y;
  }
  
  void update(){
  fill(100);
  noStroke();
  rect(X1,Y2,20,80);
  ellipse(X1+10,Y2+80,10,10);
  }
  
  void Sposta(){
   X1=mouseX;
   Y2=mouseY;
  }
  
  Bomb shot(float Vel){
   Bomb x= new Bomb(X1+10,Y2+10);
   x.VelB=Vel;
    
   return x;
  }
  
}



void mouseReleased(){
  if(mouseButton == LEFT){
   x.add(y.shot(Potenza));
   Potenza=2;
  }
  
}

Bomb x1;
Cannon y;
float Potenza;
ArrayList<Bomb> x;
PFont font;
void setup(){
  size(500,500);
  frameRate(60);
  background(255);
  textSize(30);
  font=loadFont("testo.vlw");
  textFont(font);
  y= new Cannon(100,100);
  y.update();
  x= new ArrayList<Bomb>();
  Potenza=2.0;
}

void draw(){
  background(255);
  y.Sposta();
  y.update();
  
  rect(10,10,100,20);
  if(Potenza>18){
   fill(255,0,0); 
  }else if((Potenza <=18)&&(Potenza>8)){
   fill(0,255,0); 
  }else if(Potenza <8){
   fill(0,0,255); 
  }
  
  rect(10,10,Potenza*4,20);
  fill(0);
  text(str(int(Potenza)),10,40);
  
  if(mousePressed){
    if((mouseButton == LEFT)&&(Potenza<25.0)){
       Potenza+=0.5;   
    }
  }
  
  for(int i=0; i<x.size() ; i++){
   x.get(i).Sposta();
   x.get(i).update();
    
  }
  
  
  
}