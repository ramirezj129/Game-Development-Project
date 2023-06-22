//create class ship and intialize x = 250, y = 480 as it's default start position
class Ship
{
  int x = 250;
  int y = 450;
//boolean for right,left, up, down keys set to false so we can change later
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

void sketch(){
  //create an image for the ship/player to 
  //control at position x,y on current frame 
  image(imgShip,x,y);
 }
 //movement function if keyPressed is right,left,up,down the user will move
 //x+3, x-3, etc. can be changed for faster movement speed/gameplay
 void movement(){
      if(right && x < 482) 
    {
      x = x+3;
    }
    if(left && x > 15) 
    {
      x = x-3;
    }
    if(up && y > 15) 
    {
      y = y-3;
    }
    if(down && y < 580) 
    {
      y = y + 3;
    }
 }
 //keyHold function when user has the keyPressed for right,left,up,or down then
 //set to true previously set to false
 void keyHold(int code)
 {   
   if(code == RIGHT)
  {
    right = true;
  }
 
 
  if (code == LEFT)
  {
    left =true;
  }

  if (code == UP)
  {
    up =true;
  }
   if (code == DOWN)
  {
    down =true;
  }
  
  if (code == 32)
  {
    Bullet shoot = new Bullet(x,y);
    bullets.add(shoot);
  }
 }
 //keyReleased function for when user stops pressing down on the right, left, up, down key 
 //set the it to false and the user will stop it's movement
 void keyRelease(int code){
   
    if(code == RIGHT) 
  {
    right = false;
  }
 
  if (code == LEFT)
  {
    left = false;
  }
   if (code == UP)
  {
    up = false;
  }
   if (code == DOWN)
  {
    down = false;
  }
 
 }
 
}
