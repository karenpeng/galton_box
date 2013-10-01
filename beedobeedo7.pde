ArrayList<Ball> balls;
ArrayList<MovingBall> movingBalls;
ArrayList<Board> boards;
boolean hide=false; 

void setup(){
  size(640,680);
  background(0);
  frameRate(30);
  colorMode(HSB);
  smooth();
  
  balls=new ArrayList<Ball>();
  movingBalls=new ArrayList<MovingBall>();
  boards = new ArrayList<Board>();
  
  //add the still balls
  for(int i=0;i<10;i++){
    if(i%2!=0){
      for(int j=0;j<15;j++){
        PVector number;
        number = new PVector(j*40+40,i*40+40);
        balls.add(new Ball(number,125));
      }
    }
    else{
      for(int k=0;k<14;k++){
        PVector number1;
        number1 = new PVector(k*40+60,i*40+40);
        balls.add(new Ball(number1,125));
      }
    } 
  }
  
  //add the boards
  for(int l=0;l<17;l++){
    boards.add(new Board(l*40));
  }
  /*
  color cc = color( int(random(20,280)),255,255 );
  PVector number2 = new PVector(random(width/2-10,width/2+10),0);
  movingBalls.add(new MovingBall(number2,cc));*/
}

void draw(){
  
  //if(frameCount%2==0){
    fill(0,6);
    noStroke();
    rect(0,0,width,680);
  //}

  //adding moving balls
  
  if(frameCount % 30 == 0){
    color cc = color( int(random(20,280)),255,255 );
    PVector number2 = new PVector(random(width/2-10,width/2+10),0);
    movingBalls.add(new MovingBall(number2,cc));
  }
  
  //animate the moving balls and bounce
  for(int i=0;i<movingBalls.size();i++){
     movingBalls.get(i).update();
     movingBalls.get(i).display();
    if(movingBalls.get(i).position.y<=400){
      for(int j=0;j<balls.size();j++){
         movingBalls.get(i).check(balls.get(j));     
      }
    }
    else{
       for(int k=0;k<boards.size();k++){
        movingBalls.get(i).settle(boards.get(k));
        boards.get(k).pool(movingBalls.get(i));
      }
    }
  }
   
  for (int i = 0; i < balls.size(); i++) {
    balls.get(i).checkHit();
  }
  
  if(hide){
    //draw the boards
    for(int m=1;m<boards.size();m++){
      boards.get(m).show();
    }
    //draw the still balls
    for(int k=0;k<balls.size();k++){
      balls.get(k).display();
    }
  }  
   

}

void keyPressed(){
  if(key=='h'){
    hide=true;
  }
  if(key=='s'){
    hide=false;
  }
}
