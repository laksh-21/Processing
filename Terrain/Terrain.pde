float[][] p;
int w;
int l;
int h;
int rows;
int cols;
float a;
float flying = 0;
void setup(){
  size(720 , 360 , P3D);
  a = 0;
  l = 3000;
  h = 3000;
  w = 20;
  rows = l/w;
  cols = h/w;
  p = new float[cols][rows];
 
}

void draw(){
  float red = map(sin(a) , -1 , 1 , 120 , 230);
  lights();
  directionalLight(255 , 255 , 255 , 1 , 0 , 0);
  flying -= 0.06;
   float yo = flying;
   for(int y = 0 ; y<rows ; y++){
     float xo = 0;
    for(int x =  0 ; x<cols ; x++){
      
      p[x][y] = map(noise(xo , yo) , 0 , 1 , -80 , 80);
      xo+=0.2;
    }
    yo += 0.1;    
   }
  //w = (int)map(sin(a) , -1 , +1 , 5 , 20);
  
  background(40);
      //stroke(255);
      noStroke();
      fill(red , 150  , 10);
      translate(width/2 , height/2 , 0);
      rotateX(PI/3);
      
      translate(-l/2 , -h/2 , 0);
   for(int y = 0 ; y<rows - 1 ; y++){
     beginShape(TRIANGLE_STRIP);
    for(int x =  0 ; x<cols ; x++){
      
      vertex(x*w , y*w , p[x][y]);
      vertex(x*w , (y+1)*w , p[x][y+1]);
      //p[x][y] = new Point(x*w, y*w , random(-5 , 5)); 
    }
    endShape();
   }
   //translate(width/2 , height/2 , 0);
   //rotateX(PI/4);
   //stroke(255);
   //noFill();
   //beginShape();
   //for(int y = 0 ; y<height/w ; y++){
   // for(int x =  0 ; x<width/w ; x++){
   //   vertex(p[x][y].x , p[x][y].y , p[x][y].z);
   // }
   //}
   //endShape();
   a += 0.01;
}
