class Ball{
  PVector position;
  int diameter;
  boolean hit;
  float counter;
  
  Ball(PVector p){
    position=p; 
    diameter=10;
    hit=false;
    counter=0;    
  }
  
  void display(){
    if(!hit){
      fill(color(255,100));
    }
    else{
      fill(color(50,255,255,100));
    }
    noStroke();
    ellipse(position.x,position.y,diameter,diameter);
  }
  
  void checkHit() {
    if (hit) {
      counter += 1;
      if (counter > 10) {
        counter = 0;
        hit = false;
      }
    }
  }
}
