void keyPressed()
{
  if(p.state==1)
  {
    if(key=='a')
    p.player.x-=p.player.vx;
    if(key=='d')
    p.player.x+=p.player.vx;
  }
  else
   p.processKey(key);
}
  
