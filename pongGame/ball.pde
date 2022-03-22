class ball
{
  int x,y,size,vx,vy;
  color c;
  boolean pause;
  ball()
  {
    x=width/2;
    y=height/2;
    c=color(0,0,0);
    do{
    vx=int(random(-1,1));
    vy=int(random(-1,1));
    }while(vy==0);
    size=5;
    pause=true;
  }
  ball(int s)
  {
    x=width/2;
    y=height/2;
    size=s;
  }
  void detectBorder()
  {
    if(y>=height-size/2 || y<size/2)
      vy*=-1;
      if(x>=width-size/2||x<=size/2)
      vx*=-1;
  }
  
  void draw()
  {
    detectBorder();
    fill(c);
    rect(x-size/2,y-size/2,size,size);
    if(!pause)
    {
      x+=vx;
      y+=vy;
    }
  }
  void reset()
  {
    x=width/2;
    y=height/2;
    do{
    vx=int(random(-1,1));
    vy=int(random(-1,1));
    }while(vy==0);
    pause=true;
  }
}
