float angle;
void setup(){
  size(720 , 360 , P3D);
  angle = PI/16.0;
}

void draw(){
  background(140);
  
  translate((width-300)/2 , height/2 , 0);
  rotateX(angle);
  //rotateY(angle);
  directionalLight(153, 255, 153, 0, -1, -1);
  directionalLight(153, 153, 255, 0, -1, 1);
  directionalLight(255, 255, 255, 0, 1 , 0);
  ambientLight(200 , 200 , 0);
  float a = 0;
  for(int i = 0 ; i<300 ; i += 20){
    float l = map(sin(angle + a) , 0 , 1 , 0 , 200);
    translate(20 , 0 , 0);
    stroke(0);
    strokeWeight(2);
    ambient(20);
    box(15 , l , 15); 
    
    a += 0.1;
  }
 

  angle += 0.01;


}
