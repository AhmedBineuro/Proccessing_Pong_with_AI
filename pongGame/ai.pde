class ai
{
  int timer,before,minRange,maxRange;
  int e=300,m=150,h=75;
  ai(int d)
  {
    minRange=10;
    if(d==0)
    {
      maxRange=e;
    }
    else if(d==1)
    {
      maxRange=m;
    }
    else
    {
      maxRange=h;
    }
    before=millis();
  }
  void setDif(int d)
  {
    if(d==0)
    {
      maxRange=e;
    }
    else if(d==1)
    {
      maxRange=m;
    }
    else
    {
      maxRange=h;
    }
  }
  void setTimer()
  {
    timer=int(random(minRange,maxRange));
  }
  void movePaddle(ball bl,paddle p)
  {
    int absDist= abs(bl.x-p.x);
    if(absDist>p.pWidth/2 && bl.vy<0)
    {
      if(bl.x>p.x)
      {
        p.right();
      }
      else if(bl.x<p.x)
      {
        p.left();
      }
    }
  }
  void checkBall(ball bl,paddle p)
  {
    int absDiff= abs(millis()-before);
    if(absDiff>=timer)
    {
      setTimer();
      movePaddle(bl,p);
      before= millis();
    }
  }
}
