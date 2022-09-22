class EnemyBoss1 extends Enemy
{
  
   EnemyBoss1(float incomingX, float incomingY, float incomingC, float incomingD)
  {
    super(incomingX, incomingY, incomingC, incomingD);
    hp = 1500;
  }
  
  float ay=0.15;
  float direction;
  float flashingColor=255;
  int c=0,b=2;
  void show()
  {
    if (t>=200 && t<=600)
      {
      //engine.add(new Lazer(x+30,y-60));
      //engine.add(new Lazer(x+278,y-60));
      
      image(lazerPics[index],x+30,y-60,100,700);
      image(lazerPics[index],x+278,y-60,100,700);
      index++;
      if(myShip.x<=x+130 && myShip.x>=x+30) myShip.collision=true;
      if(myShip.x<=x+370 && myShip.x>=x+278) myShip.collision=true;
      if (index == 24) index = 0;
      }
    
    if (t>=1120)
    {
      ////////// behavior one
      if(t<=1800)
      {
      image(lazerPics[index],x+30,y-60,100,700);
      image(lazerPics[index],x+278,y-60,100,700);
       if(myShip.x<=x+130 && myShip.x>=x+30) myShip.collision=true;
      if(myShip.x<=x+370 && myShip.x>=x+278) myShip.collision=true;
      index++;
      if (index == 24) index = 0;
      }
           
      if (t==1300)
      {
        direction=random(-1,1);
     if (direction<=0) direction=-1;
      else direction=1;
      }
      if(t>=120 && t<=1800)
      {
        if(frameCount % 10 == 0) engine.add(new Bullet(x+200,y+100,4,4,false));
        if(frameCount % 10 == 0) engine.add(new Bullet(x+200,y+100,-4,4,false));
        if(frameCount % 15 == 0) engine.add(new Bullet(x+200,y+100,2,4.5,false));
        if(frameCount % 15 == 0) engine.add(new Bullet(x+200,y+100,-2,4.5,false));
        if(frameCount % 10 == 0) engine.add(new Bullet(x+200,y+100,0,5,false));
      }
      if(x>=-200 && x <= 400 && t<=1800)x=x+direction;
     
     ///////////behavior one ends
      if(t>=1800 & t<=1980) y--;
      if(t==1960) x=100;
      
      //////////behavior two
      if(t>=2000 && t<=2180) y++;
      if(t>=2300 && t<=2600) 
      {
        if(frameCount %2 ==0)engine.add(new Bullet(x+200,y+120,random(0,3),random(1,3),false));
        if(frameCount %2 ==1)engine.add(new Bullet(x+200,y+120,random(-3,0),random(1,3),false));
      }
      
      ///////////behavior three
      if(t>=2900 && t<=3500)
      {
        if(t==2900) dx=direction*-1;
        if(frameCount % 100 == 0) engine.add(new Bullet(x+200,y+100,4,4,false));
        if(frameCount % 80 == 0) engine.add(new Bullet(x+200,y+100,-4,4,false));
        if(frameCount % 60 == 0) engine.add(new Bullet(x+200,y+100,2,4.5,false));
        if(frameCount % 40 == 0) engine.add(new Bullet(x+200,y+100,-2,4.5,false));
        if(frameCount % 20 == 0) engine.add(new Bullet(x+200,y+100,0,5,false));
        if(frameCount % 15 == 0)engine.add(new vEnemy(-100,150,5,0));
        if(frameCount % 15 == 0)engine.add(new vEnemy(700,75,-5,0));
        x=x+dx;
        if(x==-50 || x==250)dx=dx*-1;
      }
      if (t==3700) t=1120;
    }
      
      
    image(boss1,x,y,400,200); 
    fill(c);
    c=c+b;
   if(c==220) b=b*-1;
   if(c==0) b=b*-1;
   
    ellipse(x+200,y+30,50,50);
  }
  
  void act()
  {
    t++;
    if (t>0 && t<=180)
    {
      y=y+1;
    }
    
    if (t>180)
    {
      
      y=y+dy;
      dy=dy+ay;
      if (dy>=3) ay=ay*-1;
      if (dy<=-3) ay=ay*-1;
                      
    }
    
    if (t>=800 && t <= 980) y++;
    
   //////////Collision
   int i =0;
    while(i < engine.size())
    {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet && thing.good ==true)
      {
        if (dist(thing.x,thing.y,x+200,y+30) <=27)
        {
          hp = hp -1;
          thing.hp=0;
          fill(flashingColor);
          ellipse(x+200,y+30,50,50);
          myShip.score++;
        }
      }
      i++;
    }
    
    if(hp==0) MODE=GAMEOVER;
  }
  
  
  boolean isDead()  
  {
    return false;
  }
}