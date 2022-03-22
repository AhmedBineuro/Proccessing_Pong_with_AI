pong p;
void setup()
{
 size(128,128);
 p=new pong();
}
void draw()
{
  background(255);
  p.operate();
  print(p.b.vx);
  print("\t");
  println(p.b.vy);
}
