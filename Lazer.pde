class Lazer extends GameObject
{
  
  Lazer(float incomingX, float incomingY)
  {
    x=incomingX;
    y=incomingY;
  }
  
  void show()
  {
    image(lazerPics[index],x,y,100,700);
    index++;
    if (index == 24) index = 0;
    t++;
  }
  
  void act()
  {
  }
}