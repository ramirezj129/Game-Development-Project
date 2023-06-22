//Create and construct ship object
Ship ship = new Ship();
//Declaring the ArrayList, note use of the syntax "<Bullet>, <Enemy>, <Bomb>" to indicate
//my intention to fill ArrayList with bullets, enemies, bomb objects.
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Bomb> bombs= new ArrayList<Bomb>();

PImage imgShip, ShipBgd;
PImage imgEnemy1, EnemyBgd1;
PImage imgBulletShip, BulletShipBgd;
PImage imgBulletEnemy, BulletEnemyBgd;
PImage startscreen;

//float for score and health
int score = 0;
int level = 1;
float health = 5;
float count;
float gameState = 0;
boolean alreadyExecuted = false;
boolean alreadyExecuted1 = false;
boolean alreadyExecuted2 = false;



void setup()
{
 
  startscreen = loadImage("spacebgd.png");
  imageMode(CENTER);
  
  //size 500x600 with a background of color black 
 size(500,600);
 background(0);
   
  fill(255);
  stroke(255);

 
  imgShip = loadImage("mainship.png");
  ShipBgd = loadImage("shipmasking.png");
  imgShip.mask(ShipBgd);
  imageMode(CENTER);
  
  imgBulletShip = loadImage("shipbullet.png");
  BulletShipBgd = loadImage("shipbulletmasking.png");
  imgBulletShip.mask(BulletShipBgd);
  imageMode(CENTER);
  
  imgEnemy1 = loadImage("Enemy1.png");
  EnemyBgd1 = loadImage("E1Masking.png");
  imgEnemy1.mask(EnemyBgd1);
  imageMode(CENTER);
  
  imgBulletEnemy = loadImage("enemybullet.png");
  BulletEnemyBgd = loadImage("enemybulletmasking.png");
  imgBulletEnemy.mask(BulletEnemyBgd);
  imageMode(CENTER);
  
 gameState = 1;
 
}

void draw()
{
    if(gameState == 1)
    { 
     
      image(startscreen,250,260);
      textAlign(CENTER);
      textSize(20);
      text("SPACE GAME", 250,250);
      text("PRESS s KEY TO CONTINUE",250,280);
      text("TUTORIAL:\n SPACEBAR = SHOOTING",250, 310);
      text("MOVEMENT = UP,DOWN,LEFT,RIGHT KEYS \n Note: Do not spam bullets",250, 375);
      
      if (key== 's' == true)
      {
        gameState = 2;
      }
      
  
    }
    

  if (gameState == 2)
  {
    
  image(startscreen,250,260);
  
  if(!alreadyExecuted) {
    addEnemies();
    alreadyExecuted = true;
    }

  

  ship.movement();
  ship.sketch();
 

  //create an instance for bullets, enemies, and bombs
  for(Bullet x: bullets)
  {
    x.movement();
    x.sketch();
  }
  for(Enemy x: enemies)
  {
   x.movement();
   x.sketch(); 
  }
  for(Bomb x: bombs)
  {
   x.movement();
   x.sketch(); 
  }
   
  //calling the functions for collision of enemy bullet with ship, collision with bullet, collision bullet with ship
   collisionEnemyBullet(); 
   collisionBulletBombs();
   collisionBombsShip();
   collisionEnemyWithShip();
   
   eliminateBullets();
   eliminateBombs();
   //size and display for score and health on screen
   textSize(20);
   text("Level: "+(int)level,48, 545);
   textSize(20);
   text("Lives: "+(int)health,50, 565);
   textSize(20);
   text("Score: "+(int)score,46, 585);
   
 if(score >= 12 && !alreadyExecuted1)
  {
    level += 1;
    levelTwo();
    alreadyExecuted1 = true;
  }
  
   if(score >= 30 && !alreadyExecuted2)
  {
    level += 1;
    levelThree();
    alreadyExecuted2 = true;
  }

   
}
 if (gameState == 3)
  {
    image(startscreen,250,260);
     text("Game Over", 250,250);
     text("Press q Key To Exit",250,300);
     text("Score: " + score,250,350);
      if (key == 'q' == true)
      {
       
       exit();
        
      }
      if(key == 'r' == true)
      {
        
      }
      
    
  }
  if (score >= 50)
  {
    
   image(startscreen,250,260);
     text("You Win!", 250,250);
     text("Press q Key To Exit",250,300);
     text("Your Final Score is: " + score,250,350);
      if (key == 'q' == true)
      {
       
       exit();
        
      }

    
  }
  
 
  
}

//keyPressed, keyReleased
void keyPressed()
{
  ship.keyHold(keyCode);
}
void keyReleased()
{
 ship.keyRelease(keyCode);
  
}
//function to eliminate bullets after traveling out of screen
void eliminateBullets()
{
  //ArrayList for bulletEliminate
  ArrayList<Bullet> bulletEliminate = new ArrayList<Bullet>();
  //constructor for bullets
  for(Bullet b: bullets)
  {
   //bullets reach position y < 0 remove those bullets after they leave the screen
    if(b.y < 0) 
    {
      //bullets wished to be eliminated added to array list bullet Elminate and them bullets get removed using
      //bullets.removeAll(bullet Eliminate)
     bulletEliminate.add(b); 
    }
  }
  bullets.removeAll(bulletEliminate);
}

//eliminate bombs function similar to bullets eliminate but change the if statement
//if travels past 500 which is our default size remove from the screen
void eliminateBombs()
{
  ArrayList<Bomb> bombsEliminate = new ArrayList<Bomb>();
  for(Bomb b: bombs)
  {
    if(b.y > 600) 
    {
     bombsEliminate.add(b); 
     
    }
  }
  bombs.removeAll(bombsEliminate);
}

void collisionEnemyBullet()
{

  //array list object bulletEliminate, enemiesEliminate
  ArrayList<Bullet> bulletEliminate = new ArrayList<Bullet>();
  ArrayList<Enemy> enemiesEliminate = new ArrayList<Enemy>();
 //for loop constructor of bullet b, and enemy e
  for(Bullet b:bullets)
  {
    for(Enemy e: enemies)
  {
    
    //distance formula used as a reference in order to measure the distance from ship to bullet
    //once bullet collides with enemy ship or distance is <20 indicating collision then we eliminate the enemy ship and bullet
    float distance = sqrt(pow(b.x-e.x,2) + pow(b.y-e.y,2));
    if(distance < 20) 
    {
      //bullet and enemies get added to the array list object bullet eliminate and enemies eliminate to be deleted
      //on the next line of code. also score get incremented after deletion of an enemy
      bulletEliminate.add(b);
      enemiesEliminate.add(e);  
      score++;
      
    }
    
   
    
  }
  
  }
  bullets.removeAll(bulletEliminate);
  enemies.removeAll(enemiesEliminate);
  
}
void collisionBulletBombs()
{
  ArrayList<Bullet> bulletEliminate = new ArrayList<Bullet>();
  ArrayList<Bomb> bombsEliminate = new ArrayList<Bomb>();
  for(Bullet ba: bullets)
  {
    for (Bomb bo: bombs)
    {
      float distance = sqrt(pow(bo.x-ba.x,2) + pow(bo.y-ba.y,2));
      if(distance < 10) 
      {
         bulletEliminate.add(ba);
         bombsEliminate.add(bo);
      }
    }
  }
  bullets.removeAll(bulletEliminate);
  bombs.removeAll(bombsEliminate);
}
void collisionBombsShip()
{
  ArrayList<Bomb> bombsEliminate1 = new ArrayList<Bomb>();
  for(Bomb b: bombs)
  {
    float distance = sqrt(pow(b.x-ship.x,2) + pow(b.y-ship.y,2));
    if(distance < 8)
    {
      bombsEliminate1.add(b);
      health -=1;
      
      if(health == 0)
      {
       gameState = 3;
      }
    }
    
  }
    bombs.removeAll(bombsEliminate1);

  
}

void collisionEnemyWithShip()
{
  for(Enemy e: enemies)
  {
    float distance = sqrt(pow(e.x-ship.x,2) + pow(e.y-ship.y,2));
    if(distance < 14)
    {
      
       gameState = 3;
    }
  }
}
void addEnemies()
{
  
     for(int i= 0; i< 4;i++)
      {
    Enemy newEnemy= new Enemy(i * 35 + 25, 20 , 1);
    enemies.add(newEnemy);
    
     Enemy newEnemy1= new Enemy(i * 35 + 25, 70 , 2);
    enemies.add(newEnemy1);
    
     Enemy newEnemy2= new Enemy(i * 35 + 25, 120 , 3);
    enemies.add(newEnemy2);
      }
 
  
  
}

void levelTwo()
{
  
     for(int i= 0; i< 6;i++)
  {
    Enemy newEnemy3= new Enemy(i *  35 + 25, 20 , 0);
    enemies.add(newEnemy3);
    
     Enemy newEnemy4= new Enemy(i *  35 + 25, 70 , 0);
    enemies.add(newEnemy4);
    
     Enemy newEnemy5= new Enemy(i *  35 + 25, 120 , 0);
    enemies.add(newEnemy5);
  }
  
  
}

void levelThree()
{
  
     for(int i= 0; i< 8;i++)
  {
    Enemy newEnemy3= new Enemy(i *  35 + 25, 20 , 0);
    enemies.add(newEnemy3);
    
     Enemy newEnemy4= new Enemy(i *  35 + 25, 70 , 0);
    enemies.add(newEnemy4);
    
     Enemy newEnemy5= new Enemy(i *  35 + 25, 120 , 0);
    enemies.add(newEnemy5);
  }
  
  
}
