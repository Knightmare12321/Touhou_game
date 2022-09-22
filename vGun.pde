class vGun extends Gun
{
 
  vGun()
  {
   threshold = 15;
   cooldown = 0;
  }
  
  void show()
  {
   if (cooldown ==threshold)
   {
     engine.add(new Bullet(2, -13));
     engine.add(new Bullet(-2,-13));
     cooldown = 0;
   }
   
  }
}