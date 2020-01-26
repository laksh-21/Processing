float x;
float y;
float w = 20;
float x_b ;
float y_b ;
float speed = 10;
float x_range = 5;
float y_range = 5;
int score = 0;
int lifes = 3;
PFont f;
float a = 0;
Beam beam;
Enemy enemy;
Stars star;
ArrayList<Beam> beams = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Stars> stars = new ArrayList();
//PImage imag; //(texture image)


void setup(){
  size(720 , 360 , P2D);
  f = createFont("Cambria" , 32);
  for(int i = 0 ; i<100 ; i++){
    stars.add(new Stars());
  }
  x = width/2;
  y = height/2;
  //imag = loadImage("//name of txtuure image here");
}//setup ends here


void draw(){
  if(frameCount % 15 == 0){
    beams.add(new Beam(x , y - w/2)); 
  }
  if(frameCount % 80 == 0){
    enemies.add(new Enemy());
    stars.add(new Stars());
    //enemies.add(new Enemy());
  }
  float val = map(sin(a) , -1 , 1 , 0 , 140);;
  color c = color(val);
  background(c);
  
  
  //spaceship design LOL
  rectMode(CENTER);
  fill(200 , 40 , 120);
  stroke(255);
  strokeWeight(1);
  rect(x , y , w , w);
  
  //if you want to add textures... but remember to use the P2D renderer for this
  //beginShape();
  //texture(imag);
  //vertex(x - w/2 , y - w/2 , 50 , 300);
  //vertex(x + w/2 , y - w/2 , 600 , 300);
  //vertex(x + w/2 , y + w/2 , 600 , 850);
  //vertex(x - w/2 , y + w/2 , 50 , 850);
  //endShape();
  
  //spaceship design over
  
  
  //showing stars
  for(int i = 0 ; i<stars.size() ; i++){
    stars.get(i).show();
    stars.get(i).update();
    
    //removing if it goes off screen
    if(stars.get(i).y_s > height + 10){
      stars.remove(i); 
      stars.add(new Stars());
    }
  }
  //showing stars over
  
  
  // showing beams
  for(int i = 0 ; i<beams.size() ; i++){
    beams.get(i).show();
    
    //remove if goes Off Screen
    if(beams.get(i).y_b < -20){
      beams.remove(i);
    } else{
      beams.get(i).update();
    }
  }
  //showing beams over
  
  
  //showing enemies(and collision checking)
  for(int i = 0 ; i<enemies.size() ; i++){
    boolean hit = false;
    
    //remove if it goes off screen
    if(enemies.get(i).y_e > height + 5){
      enemies.remove(i);
    }
    enemies.get(i).show();
    
    // collision with beams
    float xpos_e = enemies.get(i).x_e;
    float ypos_e = enemies.get(i).y_e;
    float rad_e = enemies.get(i).r_e;
    for(int j = 0 ; j<beams.size() ; j++){
      float xpos_b = beams.get(j).x_b;
      float ypos_b = beams.get(j).y_b;
      float rad_b = beams.get(j).r_b;
      float d = dist(xpos_e , ypos_e , xpos_b , ypos_b);
      
      if(d <= (rad_e + rad_b - 2)){
         enemies.add(new Enemy());
         enemies.remove(i);
         beams.remove(j);
         hit = true;
         //println("HIT");
         score++;
      }
      
      //alternate collision mechanism(if we add more and more enemies and beams it'd be a bit slower to use dist() because it uses a sqrt function)
      //if((Math.abs(xpos_e - xpos_b) <= x_range) && (((ypos_b - ypos_e) <= y_range) && ((ypos_b - ypos_e) >=0))){
      //   enemies.add(new Enemy());
      //   enemies.remove(i);
      //   hit = true;
      //   //println("HIT");
      //   score++;
      //}
    } //inner for loop ends here
    
    if(!hit){
      enemies.get(i).update();
    }
    //collion with beams over
    
    
    //collision with spaceship
    float d = dist(x , y , xpos_e , ypos_e);
    if(d <= (rad_e + w/2)){
      enemies.add(new Enemy());
      enemies.remove(i);
      lifes--;
    }
    //alternate collision mechanism(if we add more and more enemies and beams it'd be a bit slower to use dist() because it uses a sqrt function)
    //if((Math.abs(xpos_e - x) <= 4) && (Math.abs(y - ypos_e) <= 4)){
    //  enemies.add(new Enemy());
    //  enemies.remove(i);
    //  lifes--;
    //}
    //collision with spaceship over
  }//outer for loop ends here
  //showing enemies over
  
  
  //displaying score on screen
  fill(255);
  textSize(20);
  text("score" , width - 60 , height - 70);
  fill(255);
  textSize(32);
  text("" + score , width - 40 , height - 40);
  
  //displaying lifes on screen
  fill(255);
  textSize(20);
  text("Lifes" , width - 60 , 70);
  fill(255);
  textSize(32);
  text("" + lifes , width - 40 , 40);
  
  //the color variable increment
  a += 0.01;
  
  //Game Over Screen
  if(lifes == 0) {
    noLoop();
    background(200);
    fill(0);
    textSize(50);
    text("Game Over", width/2 - 120 , height/2);
    textSize(30);
    text("SCORE: " + score, width/2 - 120 , height/2 + 50);
    
  } //if ends here
}//draw() ends here

void keyPressed(){
  if(keyCode == UP){
    if(y >= 0){
      y-=speed;
    }
  } else if(keyCode == DOWN){
    if(y <= height){
      y+=speed;
    }
  } else if(keyCode == RIGHT){
    if(x <= width){
      x+=speed;
    }
  } else if(keyCode == LEFT){
    if(x >= 0){
      x-=speed;
    }
  } //else if(keyCode == CONTROL){
  //  beams.add(new Beam(x , y));
  //} 
  
}
