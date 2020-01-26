// implicit plot
 
void setup() {
  size(720, 360);
}
float t=360;
void draw() {
  background(#FC2646);
  stroke(-1);
  translate(width/2, height/2);
  if (t>0)t-=2;
  else t=360;
  Heart1(t) ;
  // noLoop();
}
 
 
void Heart1(float k) {
  beginShape();
  for (float t=0; t<360; t+=0.1) {
    float x = 16 * pow(sin(radians(t)), 3);
    float y = 13 * cos(radians(t)) - 5 * cos(2 * radians(t)) - 2 * cos(3 * radians(t)) - cos(4 * radians(t));
    if (0<t-k && t-k<t) {
      noStroke();
      fill(-1);
      ellipse(x*10, -y*10, 4, 4);
      fill(-1, 60);
      vertex(x*10, -y*10);
    }
  }
  endShape();
}
