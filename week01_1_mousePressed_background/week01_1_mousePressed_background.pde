//week01_1_mousePressed_background
//桌面-Processing資料夾-啟動
//File-Preference字型放大
void setup()
{
  size(500, 500);//設定視窗大小
}
void draw()
{
  //用mouse互動
  if(mousePressed) background(#FF0000);
  else background(#00FF00);
  //按下滑鼠變為紅色
}
