class Bullet extends GameObject
{
  Bullet()
  {
    x = myShip.x+50;
    y = myShip.y;
    dx = 0;
    dy = -15;
    hp = 1;
    good = true;
  }
  
  Bullet(float incomingDX, float incomingDY)
  {
    x = myShip.x+25;
    y = myShip.y;
    dx = incomingDX;
    dy = incomingDY;
    hp = 1;
    good = true;
  }
  
  Bullet(float _x, float _y,float _dx, float _dy, boolean _good)
  {
    x = _x;
    y = _y;
    dy = _dy;
    dx = _dx;
    good = _good;
    hp = 1;
  }
  void show()
  {
    if (good==true)
    {
      fill(255);
      ellipse(x,y,2,5);
    }
    else  
    {
      fill(255,10,0);
      noStroke();
      ellipse(x,y,5,5);
    }
    
  }
  
  void act()
  {
    x = x + dx;
    y = y + dy;  
  }
  
  boolean isDead()
  {
    if(y < 0 || hp <= 0 || y>height) return true;
    else return false;
  }
}