//week01_4_void_keyPressed_void_keyReleased
void setup()
{
  size(500, 500);
}
int x = 200, y = 250, dx = 0, dy = 0;
void draw()
{
  background(#FFFFAA);
  rect(x, y, 100, 50);
  //無法同時按2個鍵、斜斜走 => 改進它
  x += dx;//if(keyPressed && keyCode == LEFT) x -= 3;
  y += dy;//if(keyPressed && keyCode == UP) y -= 3;
}
void keyPressed()//按下按鍵時會進此迴圈
{
  if(keyCode == LEFT) dx = -3;
  if(keyCode == RIGHT) dx = 3;
  if(keyCode == UP) dy = -3;
  if(keyCode == DOWN) dy = 3;
}
void keyReleased()//放開鍵時
{
  if(keyCode == LEFT) dx = 0;
  if(keyCode == RIGHT) dx = 0;
  if(keyCode == UP) dy = 0;
  if(keyCode == DOWN) dy = 0;
}
