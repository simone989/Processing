PImage foto;
float M;
float N;
//LA SIZE LA INPOSTO FISSA POICHE' PROCESSING 3 NON PERMETTE DI IMPOSTARE SIZE DINAMICHE, REGOLA LA DIM PER LA DIM 512X 512 DI LENA
float A=1.0/9.0;
float B=1.0/6.0;
float[][] matrix1 = { { 3, 2, 3 },
                     { 0,  -10, 0 },
                     { 3, 2, 3 } };
                     
float[][] matrix2 = { { A, A, A },
                     { A, A, A },
                     { A, A, A } };
                     
                     
float[][] matrix3 = { { -B, B, -B },
                     { 0,  0, 0 },
                     { B, -B, B } };
                     
                     
  

void setup(){
 size(1024,512);
 foto=loadImage("lena.png");
 image(foto,0,0);
 M= foto.width;
 N= foto.height;
 
 float[][][] Convu= convolutionRGB(foto,matrix1,matrix2,matrix3);
 PImage prova= getConvolutionlm(Convu);
 image(prova,512,0);
 
  
}


PImage getConvolutionlm(float[][][] tmpF)
{
  PImage tmp = foto.copy();
  
  tmp.loadPixels();

  for (int i = 0; i < foto.width; i++)
  {
    for (int j = 0; j < foto.height; j++)
    {
        // Normalizzazione
        if (tmpF[0][i][j] > 255) tmpF[0][i][j] = 255;
        if (tmpF[0][i][j] < 0) tmpF[0][i][j] = 0;
        if (tmpF[1][i][j] > 255) tmpF[0][i][j] = 255;
        if (tmpF[1][i][j] < 0) tmpF[0][i][j] = 0;
        if (tmpF[2][i][j] > 255) tmpF[0][i][j] = 255;
        if (tmpF[2][i][j] < 0) tmpF[0][i][j] = 0;

        tmp.set(i, j, color(tmpF[0][i][j], tmpF[1][i][j], tmpF[2][i][j]));
      }
    }
  return tmp;
}



float[][][] convolutionRGB(PImage I, float F1[][], float F2[][],float F3[][]){
  float[][][] matrix = new float[3][I.width][I.height];
  PImage tmp;
  int dim=3;
  int off=dim/2;
  
  for(int i=0;i<I.width;i++){
    for(int j=0;j<I.height;j++){
      tmp= I.get(i-off,j-off,dim,dim);
      float resRed=0, resGreen=0, resBlu=0;
      for(int k=0;k<3;k++){
        for(int l=0;l<3;l++){
        resRed+= F1[l][k] * red(tmp.get(k,l));
        resGreen+= F2[l][k] * green(tmp.get(k,l));
        resBlu+= F3[l][k] * blue(tmp.get(k,l));
        }
      }
    
    matrix[0][i][j]=resRed;
    matrix[1][i][j]=resGreen;
    matrix[2][i][j]=resBlu;
    }
  }

  return matrix;
}


void draw(){
  
  
  
}