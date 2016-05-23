PImage magicEraser(PImage x,color y,float t){
  
  float Ri;
  float Gi;
  float Bi;
 
  float Rc=red(y);
  float Gc=green(y);
  float Bc=blue(y);
  x.loadPixels();
  for(int i=1 ; i<width*height; i++){
    Ri=red(x.pixels[i]);
    Gi=green(x.pixels[i]);
    Bi=blue(x.pixels[i]);
    if((abs(Rc-Ri)<t)&&(abs(Gc-Gi)<t)&&(abs(Bc-Bi)<t)){
      x.pixels[i]=color(0,0,0);
    
    }
    
  }
  x.updatePixels();
  
  return x;
  
}

PImage magicReverse(PImage x, PImage y){
  x.loadPixels();
  y.loadPixels();
 
  
  for(int i=0 ; i<width*height; i++){
     if(x.pixels[i]==color(0,0,0)){
       x.pixels[i]=y.pixels[i];
       
     }else {
      
        x.pixels[i]=color(0,0,0);
     }
    
  }
  x.updatePixels();
  return x;
  
}

void mouseClicked(){
 if(mouseButton==LEFT){
  image(magicEraser(x,color(x.get(mouseX,mouseY)),T),0,0,width,height); 
   
 }
}

void keyPressed(){
 if((key=='i')||(key=='I')){
   image(magicReverse(x,y),0,0,width,height);
 }
 
 if(key=='+'){
   
   if(T<50){
     T+=1;
   }
 }
 if(key=='-'){
   if(T>1){
     T-=1;
   }
 }
 
 if((key=='r')||(key=='R')){
  x=loadImage("lena.png");
  image(x,0,0);
 }
  
}



PImage x;
PImage y;
float T;
PFont font;
void setup(){
 size(512,512);
 font=loadFont("AbyssinicaSIL-48.vlw");
 textFont(font);
 textSize(20);
 x=loadImage("lena.png");
 y=loadImage("lena.png");
 image(x,0,0,width,height);
 T=1.0;
 /// magicEraser(x,x.get(mouseX,mouseY),T); 
  
}


void draw(){
  
  image(x,0,0,width,height);
  fill(255);
  rect(22,10,30,30);
  fill(0);
  text(str(int(T)),30,30);
  
  
}