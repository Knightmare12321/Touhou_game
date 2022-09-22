class Ship extends GameObject
{
  
  Gun myGun;
  Item gameItem;
  Ship()  //Constructor: initialize variable
  {
    x = width/2;
    y = height/2;
    dx = 0;
    dy = 0;
    myGun = new BasicGun();
    gameItem = new Item();
  }
  
  int score=0;
  int life=initiallife;
  int counter=0;
  int a=0,b=2;
  boolean collision = false;
  
  void show()
  {
   fill(a);
   a=a+b;
   if(a==220) b=b*-1;
   if(a==0) b=b*-1;
   
   if(collision ==false)
   {
   image(reimu,x,y,50,50);
   }
   
   if(collision ==true)
   {
     if(counter==0) life--;
     if(counter%30<=15) image(reimu,x,y,50,50);
     counter++;
     if (counter==180) 
     {
       collision=false;
       counter=0;
     }
   }
   ellipse(x+25,y+10,8,8);
   
   
   //rect(x,y,50,50);
  }
  
  void act()
  {
    float speed=3;
    dx = 0;
    dy = 0;
    if (shiftkey) speed=speed/2;
    if (wkey) dy = -speed;
    if (skey) dy = speed;
    if (akey) dx = -speed;
    if (dkey) dx = speed;
    if (spacekey) myGun.show();
    x = x+dx;
    y = y+dy;
    myGun.recharge();
    if (x<=0) x=0;
    if (x>=550) x=550;
    if (y<=200) y=200;
    if (y>=550) y= 550;
    
    int i=0;
    while(i < engine.size())
    {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet && thing.good ==false)
      {
        if (dist(x+25,y+10,thing.x,thing.y)<=14 && collision==false)
        {
          thing.hp=0;
          collision=true;
          
        }
      }
      i++;
    }
    if(life==0) MODE=GAMEOVER;
    
  }
  
  boolean isDead()
  {
    return false;
  }
}