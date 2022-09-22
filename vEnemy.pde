class vEnemy extends Enemy
{
  vEnemy(float incomingX, float incomingY, float incomingC, float incomingD)
  {
    super(incomingX, incomingY, incomingC, incomingD);
  }
  
  void show()
  {
    int r = int(random(0,5));
    fill(200,200,0);
    rect(x,y,25,25);
    if (frameCount % (75+r) ==0) engine.add(new Bullet(x+8,y,2,5, false));
    if (frameCount % (75+r) ==0) engine.add(new Bullet(x+8,y,-2,5, false));
    
  }
    
 
}