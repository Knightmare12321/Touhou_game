class Launcher extends GameObject
{
  Launcher()
  {
    x= random(100,width-100);
    y = -height/4;
    dx = 3;
    dy = 0;
    hp = 500;
  }
  
  void show()
  {
    fill(100);
    image(spaceship, x,y,100,40);
    //ellipse(x,y,40,40);
  }
  
  void act()
  {
    
    x=x+dx;
    y=y+dy;
    t++;
    if (t==1)engine.add(new Item());
    if (t==1) bgm1.play();
    if (x<20||x>width-100)  dx=dx*-1;
    if (t< 1500 && frameCount%20==0)  engine.add(new Enemy(x+40,y));
    if (t>=600 && t < 2500 && frameCount % 20 ==0) engine.add(new vEnemy(-100,100,5,0));
    if (t>=1400 && t<2500 && frameCount % 20 ==0) engine.add(new vEnemy(700,200,-5,0));
    if (t==800) engine.add(new PatternGun(500,5,0,2));
    if (t > 1000 && t < 2500 && frameCount % 180 == 0)engine.add(new Enemy3(100,-30,2,0));
    if (t > 1000 && t < 2500 && frameCount % 180 == 90)engine.add(new Enemy3(500,-30,-2,0));
    if (t >=2600 && t <= 6200 && frameCount%20 ==0) engine.add(new Enemy(x+40,y));
    if (t >=2600 && t <= 6200 && frameCount%20 ==0) engine.add(new Enemy(600-x-40,y));
    if (t >=3000 && t <= 6200 && frameCount% 90 ==0) engine.add(new Enemy3(100,-30,2,0));
    if (t >=3000 && t <= 6200 && frameCount% 90 ==45) engine.add(new Enemy3(500,-30,-2,0));
    if (t >=3600 && t <= 6200 && frameCount% 15 ==0) engine.add(new vEnemy(-100,150,5,0));
    if (t >=3950 && t <= 6200 && frameCount% 15 ==0) engine.add(new vEnemy(700,75,-5,0));
    if (t == 2000) engine.add(new PatternGun(100,5,0,2));
    if (t == 4300) engine.add(new PatternGun(500,5,0,2));
    if (t == 5000 ) engine.add(bosslevel1);
    if (t >= 5600 && t <= 5800) bosslevel1.y--;
    if (t == 5800 ) engine.remove(bosslevel1);
    if (t == 6500 ) 
  {
    bgm1.close();
    bgmboss1.play();
  }
  if (myShip.life==0 || bosslevel1.hp==0) 
  {
    t=0;
    bgm1.close();
    bgmboss1.close();
    engine.remove(bosslevel1);
  }
  
  if (t>=6500)
  {
  fill(255);
  rect(20,560,560,20);
  fill(0);
  rect(22,562,556,16);
  float bossrx;
  bossrx = map(bosslevel1.hp,0,bosslife,0,556);
  fill(255,0,0);
  rect(22,562,bossrx,16);
  }
  
    if (t == 6500) engine.add(bosslevel1);
    int i =0;
    while(i < engine.size())
    {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet)
      {
        if (rectRect( thing.x, thing.y, 2, 5, x+50, y, 100, 40) == true)
        {
          hp = hp -1;
          thing.hp=0;
        }
      }
      i++;
    }
  }
  
  boolean isDead()
  {
    return hp<=0;
    
  }
  
  
}