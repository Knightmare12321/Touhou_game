class Enemy extends GameObject
{
  Enemy(float incomingx, float incomingy)
  {
    x= incomingx;
    y = incomingy;
    dx = 0;
    dy = 3;
    hp=1;
  }
  
  Enemy(float incomingA, float incomingB, float incomingC, float incomingD)
  {
    x= incomingA;
    y = incomingB;
    dx = incomingC;
    dy = incomingD;
    hp=1;
  }
  void show()
  {
    fill(0,255,0);
    rect(x,y,20,20);
    if (frameCount % 40 ==0) engine.add(new Bullet(x+8,y+5,0,5,false));
  }
  
  void act()
  {
    x=x+dx;
    y=y+dy;
    int i =0;
    while(i < engine.size())
    {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet && thing.good ==true)
      {
        if (rectRect( thing.x-4, thing.y-2.5, 5, 5, x, y, 20, 20) == true)
        {
          hp = hp -1;
          thing.hp=0;
          if (hp<=0) 
          {
            engine.add(new Explosion(x-50,y-50));
          myShip.score=myShip.score+5;
          }
        }
      }
      i++;
    }
    
    
  }
  
  boolean isDead()
  {
    if (y > height+200 || hp <=0 || x < -200 ||x>width+200) return true;
    else return false;
  }
  
}