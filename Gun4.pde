class Gun4 extends Gun
{
  Gun4()
  {
    threshold = 10;
    cooldown = 0;
  }
  
  void show()
  {
   if (cooldown ==threshold)
   {
     engine.add(new Bullet(3, -13));
     engine.add(new Bullet(-3,-13));
     engine.add(new Bullet(1,-15));
     engine.add(new Bullet(-1,-15));
     cooldown = 0;
   }
  }
  
  
}