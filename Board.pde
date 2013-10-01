class Board{
  float x; 
  int ballHeight;
  color c;
  int h;
  Board(float xx){
    x=xx;
    ballHeight = 20;
    h = 0;
  }
   
  void pool(MovingBall few){
    if(few.position.x > x && few.position.x < x + 40 && few.position.y >= 675 && !few.arrived) {
      few.arrived = true;
      c = few.look;
      h += ballHeight;      
    }
    if (h != 0) {
      fill(c, 10);
      noStroke();
      rect(x, 680 - h, 40, h);
    }    
  }
  
  void show(){
    stroke(250);
    line(x,400,x,680);
  }
}
