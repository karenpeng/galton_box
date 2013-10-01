class Board{
  float x; 
  int ballHeight;
  int h;
  color c;
  //ArrayList<MovingBall>ballsin;
  
  Board(float xx){
    x=xx;
    ballHeight = 1;
    h = 0;
    //ballsin = new ArrayList<MovingBall>();
  }
   
  void pool(MovingBall few){
    if(few.position.x > x && few.position.x < x + 40 && few.position.y >= 680 && few.number<=.02) {
      few.number+=.005;
      h += ballHeight;
      c = few.look;
      /*
      if(few.number==.005){
        ballsin.add(few); 
      } 
     */
    }
    if (h != 0 && h<280 ) {
     /* int total=ballsin.size();
      println(total);
      if(total<=1){
        fill(c,10);
      }
      else{
        float average=hue((ballsin.get(total-1).look+ballsin.get(total-2).look)/2);
        fill(color(average,255,255),10);
      }*/
      
      fill(c,6);
      noStroke();
      rect(x, 680 - h, 40, h);
    }    
  }
  
  void show(){
    stroke(250);
    line(x,400,x,680);
  }
}
