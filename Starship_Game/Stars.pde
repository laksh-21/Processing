class Stars{
  float x_s;
  float y_s;
  
  Stars(){
    x_s = random(0,width);
    y_s = random(-height , 0);
  }
  
  void show(){
    noStroke();
    fill(255);
    ellipse(x_s , y_s , 2 , 2);
  }
  
  void update(){
    y_s += 5; 
  }
}
