class Explosion extends GameObject
{
  Explosion(float incomingX, float incomingY)
  {
    x=incomingX;
    y=incomingY;
  }
  
  void show()
  {
     image(explosionPics[index],x,y);
     if (frameCount %2 ==0)index++;
  }
  
  
  boolean isDead()
  {
    if (index>=12) return true;
    else return false;
  }
}