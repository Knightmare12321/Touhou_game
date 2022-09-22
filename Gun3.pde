class Gun3 extends Gun
{
  Gun3()
  {
    threshold = 15;
    cooldown = 0;
  }
  
  void show()
  {
   if (cooldown ==threshold)
   {
     engine.add(new Bullet(3, -13));
     engine.add(new Bullet(-3,-13));
     engine.add(new Bullet(0,-15));
     cooldown = 0;
   }
  }
  
  
}