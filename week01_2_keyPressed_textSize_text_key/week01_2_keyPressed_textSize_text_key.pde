//week01_2_keyPressed_textSize_text_key
void setup()
{
  size(500, 500);
}
void draw()//用鍵盤互動
{
  if(keyPressed)//要用英文輸入法
  {
    background(#FF0000);//紅色背景
    textSize(80);//字型大小
    text("" + key, 100, 100);
  }
}
