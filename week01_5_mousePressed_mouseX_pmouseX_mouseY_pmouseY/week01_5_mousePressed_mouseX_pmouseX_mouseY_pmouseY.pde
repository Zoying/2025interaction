//week01_5_mousePressed_mouseX_pmouseX_mouseY_pmouseY
//mouse keyboard整合
void setup()
{
  size(500, 500);
}
int x = 200, y = 250;
void draw()
{
  background(#FFFFAA);
  if(mousePressed)//不管有無壓到rect，都移動它
  {
    x += mouseX - pmouseX;
    y += mouseY - pmouseY;
  }
  rect(x, y, 100, 50);
}
