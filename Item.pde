class Item extends GameObject
{
  float cooldown=0, threshold=1800;
  int mode=0;
  float ry;
  Item()
  {
  }
  
  void show()
  {
    fill(255);
    rect(550,100,40,360);
    fill(0);
    rect(551,101,38,358);
    fill(0,100,255);
    ry=map(cooldown,0,1800,0,358);
    rect(551,458,38,-ry);
    if (cooldown == threshold)
     {
       
       if(ekey)
       {
         mode=1;
         cooldown = 0;
         
       }
       
     }
     
     if (cooldown < threshold) cooldown++;
  }
  
  
  void act()
  {
    if(mode==1&&t<=60)
    {
      t++;
      if(frameCount%5==0) background(255);  
      int i =0;
    while(i < engine.size())
    {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet && thing.good ==false)
      {
        thing.hp=0;
        myShip.score=myShip.score+5;
        
      }
      i++;
    }
      if(t==60) 
      {
        t=0;
        mode=0;
      }
    }
    
  }
}