class MovingBall extends Ball{
  PVector velocity;
  PVector acceleration;
  color look;
  int opacity;
  float number;
  
  MovingBall(PVector p, color c){
    super(p);
    velocity=new PVector(0,0);
    acceleration = new PVector (0,.6);
    look=c;
    opacity=20;
    number=0;
  }

  void update(){    
    position.add(velocity);
    velocity.add(acceleration); 
    opacity++;
    if(opacity>250){
      opacity=250;
    }
    if(position.x<diameter/2 || position.x>width-diameter/2){
      velocity.x*=-1;
    }
  }

  void check(Ball any){  
    
    //check the friction
    float dis = PVector.dist(position, any.position);   
    float rr = (diameter+any.diameter)/2;
    
    if(dis<=rr && position.y<=any.position.y){

      any.hit=true;
      PVector heartLine = position.get();
      heartLine.mult(-1);
      heartLine.add(any.position);
      float a = atan(heartLine.y/heartLine.x);
      velocity.rotate(2*a);
      if(velocity.mag()>8){
         velocity.mult(.4);
      }
    }  
  }
  
  void settle(Board any){
    float dis0 = abs(position.x-any.x);
    if(dis0<=diameter/2){
      velocity.x *=-1;
    }
  }

  void display(){
    fill(color(look),opacity);
    noStroke();
    ellipse(position.x,position.y,diameter,diameter);
  }
}
