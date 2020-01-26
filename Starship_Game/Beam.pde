class Beam{
  float x_b;
  float y_b;
  int r_b = 10;
 Beam(float x , float y){
   x_b = x;
   y_b = y;
 }
  void show(){
    
    //noStroke();
    ellipseMode(CENTER);
    fill(255 , 0 , 0);
    noStroke();
    ellipse(x_b , y_b , r_b , r_b);
  }
  
  void update(){
    y_b -= speed+2; 
  }
}
