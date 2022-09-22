class Enemy3 extends Enemy
{
  Enemy3(float incomingX, float incomingY, float incomingC, float incomingD)
  {
    super(incomingX, incomingY, incomingC, incomingD);
    hp=5;
  }
  
  void show()
  {
    t++;
    fill(0,0,255);
    rect(x,y,35,35);
    if(frameCount % 60 == 0) engine.add(new Bullet(x+10,y,3,4,false));
    if(frameCount % 60 == 0) engine.add(new Bullet(x+10,y,-3,4,false));
    if(frameCount % 60 == 0) engine.add(new Bullet(x+10,y,0,5,false));
  }
  
  void act()
  {
    
    if (t>0 && t<=60)
    {
      y=y+2;
    }
    
    if (t>60)
    {
      
    x=x+dx;
    y=y+dy;
    int i =0;
    while(i < engine.size())
    {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet && thing.good ==true)
      {
        if (rectRect( thing.x-8, thing.y-2.5, 5, 5, x, y, 35, 35) == true)
        {
          hp = hp -1;
          thing.hp=0;
          if (hp<=0) 
          {
            engine.add(new Explosion(x-50,y-50));
          myShip.score=myShip.score+8;
          }
        }
      }
      i++;
    }
    
    }
  }
  
 
}