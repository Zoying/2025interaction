//week01_7_void_mouseDragged
//mouse keyboard整合
//另一種方法
void setup()
{
  size(500, 500);
}
int x = 200, y = 250;
void draw()
{
  background(#FFFFAA);
  rect(x, y, 100, 50);
}
void mouseDragged()
{
  if(mousePressed && x < mouseX && mouseX < x + 100 && y < mouseY && mouseY < y + 50)//只有在方塊上才能移動
  {
    x += mouseX - pmouseX;
    y += mouseY - pmouseY;
  }
}
