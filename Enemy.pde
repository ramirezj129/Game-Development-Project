//class enemy for enemy ships
class Enemy{
  int x = 0;
  int y = 0;
  int i = 0;
  int imgCount;
 
  //boolean for ships to move right until they reach the end of screen on the right, size set to 495
  boolean right = true;
  //create random position of 10x, 495y using function random
  //purpose to create enemies at random positions using random function
  Enemy(int py, int px, int pi){
    y = py;
    x = px;
    i = pi;
    
  
  }
  //ellipse of enemies 
        void sketch()
        {
        image(imgEnemy1,x,y);
      
          
        }
        //create movement function for enemy ships similar to ship movement but much slower
        void movement(){
          if(right)
          {
            x = x+1;
            
          }
          else
          { 
            x = x - 1;
          }
       
          // once the enemy ships reach the boundary of 495 turn right into false and have the ships move to the left
          //if ships position is < 10 then have them move right
          if(x > 495) 
          {
            right  = false;
          }
          if(x < 10)
          {
            right = true;
          }
          // int a variable for randomizing the enemy ships amount of times to shoot if from random function j == 10 in that frame then
          //ship will not shoot until random function from 0-150 returns a 10 if it does then create a new bomb that would draw it and
          //output it from the position of x,y
          int j = int(random(0,150));
          if (j == 10) 
          {
            Bomb newBomb = new Bomb(x,y);
            bombs.add(newBomb);
          }
        }
  }
