//week03_5_pin2_BUTTON_digitalRead_digitalWrite
//手動按按鈕，看到燈 慢慢改變 now 之後，把 now 變亮
void setup() {
  // put your setup code here, to run once:
  pinMode(2, INPUT_PULLUP);//按鈕Button 是 2號，沒按下去，就會拉高
  for(int i = 3; i <= 13; i++)//把所有pin都設成OUTPUT
  {
    pinMode(i, OUTPUT);//全都可以發亮
  }
}
int now = 3;//pin3 發亮
void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(2) == LOW)
  {
    now = now + 1;
    if(now > 13) now = 3;
    for(int i = 3; i <= 13; i ++)
    {
      digitalWrite(i, LOW);//全部清空
    }

    digitalWrite(now, HIGH);//now負責亮
    delay(500);//休息一下
  }
}
