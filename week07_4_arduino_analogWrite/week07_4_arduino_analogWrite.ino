//week07_4_arduino_analogWrite
void setup() {
  // put your setup code here, to run once:
  pinMode(11, OUTPUT);//第11個pin腳(有PWM功能，0-255輸出)
}
int a = 0;
void loop() {
  // put your main code here, to run repeatedly:
  analogWrite(11, a);//亮的程度，是a的值
  a = (a + 1) % 256;//增加一點亮度
  delay(10);//每0.01秒
}
