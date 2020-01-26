Star[] stars = new Star[600];

void setup(){
  
  size(1000,600);
  for (int i = 0 ; i<stars.length ; i++){
      stars[i] = new Star();
  }
}

void draw(){
  translate(width/2 , height/2);
  background(0);
  for(int i = 0 ; i<stars.length ; i++){
    stars[i].update();
    stars[i].show();
  }
  
}
