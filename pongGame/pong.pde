class pong
{
  int maxScore,p1,p2;
  int pWidth,pHeight;
  int state;//state 0 is menu state 1 is game 3 endscreen
  int button;// 0 is easy 1 is medium 2 is hard;
  paddle player,opponent;
  ai op;
  ball b;
  
  pong()
  {
   state=0;
   button=0;
   p1=0;
   p2=0;
   pWidth=15;
   pHeight=5;
   maxScore=7;
   op=new ai(0);
   player=new paddle(pWidth,pHeight,width/2-pWidth/2,height-pHeight*2,1);
   opponent=new paddle(pWidth,pHeight,width/2-pWidth/2,pHeight*2,2);
   b= new ball();
  }
  
  void drawMenu()
  {
      for(int i=0;i<3;i++)
      {
        if(i==button)
        fill(155);
       else
        fill(0);
        rect(width/2-15,21+(21*i),30,10);
      }
  }
  
  void processKey(char k)
  {
    if(k=='a')
    {
      if(state==0)
      {
        state=1;
        setGame();
      }
      else if(state==3)
      {
        state=0;
        p1=0;
        p2=0;
      }
    }
    if(k=='d')
    {
      if(state==0)
      {
        button++;
        button%=3;
      }
      else if(state==3)
      {
        state=0;
        p1=0;
        p2=0;
      }
    }
  }
  
  void setGame()
  { //<>//
    op.setDif(button);
    player.reset();
    opponent.reset();
    b.reset();
  }
  void operate()
  {
    //if p1 or p2 wins go to endscreen;
      if(p1>=maxScore||p2>=maxScore)
        state=3;
    //draw menu
    if(state==0)
      drawMenu();
    else if(state==1)
    {   
        op.checkBall(b,opponent);
        operateDraw();
     }
     else
     {
       drawEndScreen();
     }
  }
  
  void operateDraw()
  { //<>//
        //if p2 scores
        if(b.y>=height-b.size/2)
        {
          p2++;
          reset();
        }//if p1 scores
        if(b.y<=b.size/2)
        {
          p1++;
          reset();
        }
        //draw game;
        draw();
    }
  
  void drawEndScreen()
  {
    pushStyle();
    textSize(20);
    textAlign(CENTER);
    if(p1>=maxScore)
    {
      background(0,100,157);
      fill(204, 156, 0);
      text("You won!",width/2,height/2);
    }
    else
    {
      background(0);
      fill(255,0,0);
      text("You lost",width/2,height/2);
    }
    popStyle();
  }
  
  void draw()
  { 
    if(b.pause)
    {
      delay(500);
      b.pause=false;
    }
    player.draw(b);
    opponent.draw(b);
    b.draw();
    pushStyle();
    textSize(pWidth*3/4);
    fill(opponent.c);
    textAlign(CENTER);
    text(p.p2,width-4,height/2-4);
    fill(player.c);
    text(p.p1,width-4,height/2+4);
    popStyle();
  }
  
  void reset()
  {
    player.reset();
    opponent.reset();
    b.reset();
    delay(500);
    b.pause=false;
  }
}
