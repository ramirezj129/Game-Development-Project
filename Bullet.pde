// create class bullet and determine it's size and movement
class Bullet{
  int x = 0;
  int y = 0;
  Bullet(int px, int py)
  {
    x = px;
    y = py;
  }
  //ellipse for the bullet
  void sketch()
  {
    image(imgBulletShip,x,y);
  }
  //movement speed of bullet
  void movement(){
    y = y -3;
  }
}
