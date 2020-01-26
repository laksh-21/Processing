ArrayList<PVector> heart = new ArrayList();
float a;
void setup(){
  size(720 , 360);
  a = 0;
}

void draw(){
  background(255 , 0 , 120);
  translate(width/2 , height/2);
  float r = map(sin(a) + 1 , 0 , 2 , 5 , 10);
  stroke(255);
  strokeWeight(4);
  for(float t = 0 ; t<360 ; t+=6){
    float x = 16 * pow(sin(radians(t)), 3);
    float y = 13 * cos(radians(t)) - 5 * cos(2 * radians(t)) - 2 * cos(3 * radians(t)) - cos(4 * radians(t));
    PVector p = new PVector(x , y);
    heart.add(p);
  }
  
  fill(220 , 0 , 180);
  beginShape();
  for(PVector p : heart){
    vertex(r*p.x , -r*p.y);
  }
  endShape();
  a += 0.1;
  heart.clear();
}
