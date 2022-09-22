class PatternGun extends GameObject
{
  PatternGun(float incomingX, float incomingY, float incomingDX, float incomingDY)
  {
    x=incomingX;
    y=incomingY;
    dx=incomingDX;
    dy=incomingDY;
    hp=1;
  }
  
  void show()
  {
  
    image(upgrade,x,y,30,30);
    
  }
  
  void act()
  {
    x=x+dx;
    y=y+dy;
    if (x<=0 || x>=width-15) dx=dx*-1;
    if (y<=0 || y>=height-15) dy=dy*-1;
    if (rectRect(x-30,y-35,15,15,myShip.x,myShip.y,100,100)==true) 
    {
      hp=0;
      myShip.index++;
      //myShip.myGun = new vGun();
      if (myShip.index==1) myShip.myGun = new vGun();
      if (myShip.index==2) myShip.myGun = new Gun3();
      if (myShip.index==3) myShip.myGun = new Gun4();
    }
    println(myShip.index);
  }
  
  boolean isDead()
  {
    return hp==0;
  }
}