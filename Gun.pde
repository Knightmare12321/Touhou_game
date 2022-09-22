abstract class Gun
{
   float cooldown, threshold;

   Gun()
   {
     
   }
   
   void show()
   {
     if (cooldown == threshold)
     {
       engine.add(new Bullet(0,-10));
       cooldown = 0;
     }
   }
   
   void recharge()
   {
    if (cooldown < threshold) cooldown++;
     
   }
}