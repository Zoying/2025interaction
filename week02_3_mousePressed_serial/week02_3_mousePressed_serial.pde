//week02_3_mousePressed_serial
import processing.serial.*;//使用 USB 的 Serial
Serial myPort;//宣告 USB 的 Serial 變數 myPort
void mousePressed()
{
  myPort.write(' ');//mouse 按下，送' '出去
}
void setup()
{
  size(400, 400);
  myPort = new Serial(this, "COM5", 9600);//剛剛的 COM
}
void draw()
{
  if(mousePressed) background(#FF0000);
  else background(#00FF00);
}
