class paddle
{
  int x,y,pWidth,pHeight,pNumber,ogX;
  int vx;
  color c;
  /*paddle()
  {
    pWidth=15;
    pHeight=5;
    x=width/2;
    y=height-pHeight*2;
  }*/
  paddle(int w,int h,int xp,int yp,int pn)
  {
    pWidth=w;
    pHeight=h;
    x=xp;
    y=yp;
    vx=2;
    ogX=xp;
    pNumber=pn;
    if(pNumber==1)
    {
      c=color(255,0,0);
      
    }
    else
    c=color(0,0,255);
  }
  void right()
  {
    x+=vx;
    detectBorder();
  }
  void left()
  {
    x-=vx;
    detectBorder();
  }
  void hit(ball bl)
  {
    int minY,maxY,xDiff;
    xDiff=bl.x-x;
    if(bl.x<=x+(pWidth/2)&&bl.x>=x-(pWidth/2))
    {
      if(pNumber==1)
      {
        minY=y-(pHeight/2)-(bl.size/2);
        maxY=y-(pHeight/2);
        if(bl.y>=minY&&bl.y<=maxY)
        {
          bl.vy*=-1;
          bl.c=color(255,0,0);
        if(xDiff<-pWidth/4)
          bl.vx=-1;
        else if(xDiff>pWidth/4)
          bl.vx=1;
        else
          bl.vx=0;
        }
       }
      else
      {
        minY=y+(pHeight/2)+(bl.size/2);
        maxY=y+(pHeight/2);
        if(bl.y<=minY&&bl.y>=maxY)
        {
          bl.vy*=-1;
          bl.c=color(0,0,255);
          if(xDiff<-pWidth/4)
          bl.vx=-1;
        else if(xDiff>pWidth/4)
          bl.vx=1;
        else
          bl.vx=0;
        }
      }
    }
  }
  void detectBorder()
  {
    if(x+pWidth/2<=0)
    x=width+pWidth/2;
    if(x-pWidth>=width)
    x=pWidth/2;
  }
  void reset()
  {
    x=ogX;
  }
  void draw(ball b)
  {
    fill(c);
    hit(b);
    rect(x-pWidth/2,y-pHeight/2,pWidth,pHeight);
  }
}
