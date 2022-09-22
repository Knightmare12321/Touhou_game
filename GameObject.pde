abstract class GameObject
{
 float x, y, dx, dy; //These are the information that all GameObjects have.
 float hp;
 boolean good;
 int index=0;
 int t=0;
 GameObject()
 {
   
 }
 
 void show()
 {
 }
 
 void act()
 {
 }
 
 boolean isDead()
 {
   return false;
 }
}