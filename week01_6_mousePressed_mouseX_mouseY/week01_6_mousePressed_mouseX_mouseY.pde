//week01_6_mousePressed_mouseX_mouseY
//mouse keyboard整合
void setup()
{
  size(500, 500);
}
int x = 200, y = 250;
void draw()
{
  background(#FFFFAA);
  //if(mousePressed && x < mouseX && y < mouseY)//mouse在(x, y)的右下角，條件還不夠
  if(mousePressed && x < mouseX && mouseX < x + 100 && y < mouseY && mouseY < y + 50)//只有在方塊上才能移動
  {
    x += mouseX - pmouseX;
    y += mouseY - pmouseY;
  }
  rect(x, y, 100, 50);
}
