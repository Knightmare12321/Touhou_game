class Star extends GameObject
{
  
  Star()
  {
    x= random(0,width);
    y = 0;
    dx = 0;
    dy = random(3,5);
  }
  
  void show()
  {
    stroke(255);
    rect(x,y,dx,dy);
  }
  
  void act()
  {
    x=x+dx;
    y=y+dy;
  }
  
  boolean isDead()
  {
    if(y>height) return true;
    else return false;
  }
}