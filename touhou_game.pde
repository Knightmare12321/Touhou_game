import ddf.minim.*;
AudioPlayer bgm1,bgmboss1,bgm2;
Minim minim;

// June 16th Final day !

final int INTRO = 1, PLAYING = 2, GAMEOVER = 3, HELP = 4, PAUSE = 5;
int countdown=0;
int score=0;
int MODE=1;
int level = 1;
int counter =1;
int a =0, b = 0;
ArrayList<GameObject> engine;
Ship myShip;
EnemyBoss1 bosslevel1;
boolean wkey, akey, skey, dkey, spacekey,shiftkey,ekey;
PImage reimu,spaceship,enemy;
PImage[] explosionPics;
PImage[] lazerPics;
PImage upgrade;
PImage BGI;
PImage boss1;
int initiallife=30;
int bosslife=1500;
void setup()
{
  size(600,600);
  spaceship = loadImage("spaceship.png");
  reimu = loadImage("reimu.png");
  enemy = loadImage("enemy.png");
  upgrade = loadImage("upgrade.png");
  explosionPics = new PImage[12];
  lazerPics = new PImage[24];
  BGI = loadImage("BGI.jpg");
  boss1 = loadImage("boss1.png");
  
  minim = new Minim(this);
  bgm1 = minim.loadFile("Metal Slug 5 Music- Speeder.mp3");
  bgmboss1 = minim.loadFile("Metal Slug 5 Music- Fierce Battle.mp3");
  
  while(a<=11)
  {
  explosionPics[a] = loadImage("BlueExplosionPNG_"+a+".png");
  a++;
  }
  
  while(b<=23)
  {
    lazerPics[b] = loadImage("frame_"+b+"_delay-0.01s.gif");
    b++;
  }
  engine = new ArrayList<GameObject>(10000);
  myShip = new Ship();
  bosslevel1 = new EnemyBoss1(100,-150,0,0);
  engine.add(myShip);
  engine.add(new Launcher());
}

void draw()
{
  if (MODE == INTRO)
  {
    myShip.score=0;
    myShip.life=initiallife;
    bosslevel1.hp=bosslife;
    image(BGI,0,0,600,600);
    countdown=0;
    fill(255,255,100);
    textSize(50);
    text("SPACE WAR",160,200);
    
    if(mouseX>=120 && mouseX<=240 && mouseY>=360 && mouseY<=410)    fill(255,255,155);
    else fill(200,200,100);
    textSize(40);
    text("Start!",130,400);
    
    if(mouseX>=360 && mouseX<=460 && mouseY>=360 && mouseY<=410)    fill(255,255,155);
    else fill(200,200,100);
    textSize(40);
    text("Help",370,400);
  }
  
  
  if (MODE == HELP)
  {
    image(BGI,0,0,600,600);
    fill(200,200,100);
    text("W S A D : Movement",100,100);
    text("Space(hold) : Shoot",110,180);
    text("Shift(hold) : Slow movement",40,260);
    image(upgrade,160,300,60,60);
    text(": Upgrade",260,340);
    text("Mouse(press) : Pause" ,90,420);
    if(mouseX>=250 && mouseX<=350 && mouseY>=510 && mouseY<=580)    fill(255,255,155);
    else fill(200,200,100);
    text("Back",255,550);
  }
  
  
  if (MODE == PLAYING)
  {
  background(0);
  int i = engine.size()-1;
  myShip.show();
  myShip.act();
  
  while (i>=0)
  {
    GameObject obj = engine.get(i);
    obj.show();
    obj.act();
    if (obj.isDead()==true)
    {
      engine.remove(i);
    }
    i--;
  }
  score=myShip.score;
  text("Score :"+score,30,60);
  //////////////////////blood indicator for myship
  fill(255);
  rect(430,40,150,20);
  fill(0);
  rect(432,42,146,16);
  fill(255,0,0);
  float rx=map(myShip.life,0,initiallife,0,146);
  rect(432,42,rx,16);
  //////////////////////blood indicator for boss1
  

  engine.add(new Star());
  }
  
  println(bosslevel1.t);
  
  
  if (MODE == PAUSE)
  {
    fill(255,255,155);
    text("Pause",240,280);
  }
  
  
  if (MODE == GAMEOVER)
  {
    image(BGI,0,countdown-600,600,600);     
    if(countdown<600)
    {
      countdown=countdown+5;
      
    }
    text("Game Over !",190,-340+countdown);
    text("Your Score :"+myShip.score,160,-240+countdown);
  }
}
//
void keyPressed()
{
  if (key == 'e' || key == 'E') ekey = true;
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == SHIFT) shiftkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased()
{
  if (key == 'e' || key == 'E') ekey = false;
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (keyCode == SHIFT) shiftkey = false;
  if (key == ' ') spacekey = false;
}

void mousePressed()
{
  counter=-1;
   if (MODE==PLAYING && counter==-1) 
   {
     MODE=PAUSE;
     counter=1;
   }
   if (MODE==PAUSE && counter==-1) 
   {
     MODE=PLAYING;
     counter=1;
   }
   if (MODE==GAMEOVER && counter==-1) 
   {
     MODE=INTRO;
     counter=1;
   }
}

void mouseReleased()
{
    if (MODE==HELP && mouseX>=250 && mouseX<=350 && mouseY>=510 && mouseY<=580)  MODE=INTRO;
    if (MODE==INTRO && mouseX>=120 && mouseX<=240 && mouseY>=360 && mouseY<=410) MODE=PLAYING;
    if (MODE==INTRO && mouseX>=360 && mouseX<=460 && mouseY>=360 && mouseY<=410) MODE=HELP;
}

boolean rectRect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  
  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}