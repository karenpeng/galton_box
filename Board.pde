class Board{
  float x; 
  int h;
  color c;
  //ArrayList<MovingBall>ballsin;
  
  Board(float xx){
    x=xx;
    h = 0;
    //ballsin = new ArrayList<MovingBall>();
  }
   
  void detect(MovingBall few){
    if(few.position.x > x && few.position.x < x + 40 && few.position.y >= 680 && few.number<=.02) {
      few.number+=.004;
      h ++;
      c = few.look;
      /*
      if(few.number==.005){
        ballsin.add(few); 
      } 
     */
    }
     /* int total=ballsin.size();
      println(total);
      if(total<=1){
        fill(c,10);
      }      
      else{
        float average=hue((ballsin.get(total-1).look+ballsin.get(total-2).look)/2);
        fill(color(average,255,255),10);
      }*/ 
  }
  void pool(){
    if(h!=0 && h<280){
      fill(c,34);
      noStroke();
      rect(x, 680 - h, 40, h);
    }
  }
  
  void show(){
    stroke(250);
    line(x,400,x,680);
  }
}
