//similar to bullet class create bomb class for enemy ships but movement is
//in the opposite direction
class Bomb{
  int x = 0;
  int y = 0;
  Bomb(int px, int py){
    x = px;
    y = py;
  }
  void sketch(){
    image(imgBulletEnemy,x,y);
  }
  //enemy bullet movement increments 
  //along the y-axis
  void movement(){
    y = y + 2;
  }
}
