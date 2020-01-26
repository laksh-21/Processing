class Enemy{
 float x_e;
 float y_e;
 float x_speed;
 int r_e = 15;
 Enemy(){
   x_e = random(0 , width);
   y_e = random(-50 , -10);
   x_speed = 2*random(-1 , 1);
 }
 
 void show(){
   ellipseMode(CENTER);
   fill(40);
   stroke(255);
   strokeWeight(1);
   ellipse(x_e , y_e , r_e , r_e);
 }
 
 void update(){
   if((x_e < -40) || (x_e > width+40)){
     x_speed = -x_speed; 
   }
   y_e += .5;
   x_e += x_speed;
 }
  
}
