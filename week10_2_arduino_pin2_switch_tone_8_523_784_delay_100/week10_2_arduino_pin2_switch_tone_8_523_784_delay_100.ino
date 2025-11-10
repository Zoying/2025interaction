//week10_2_arduino_pin2_switch_tone_8_523_784_delay_100
void setup() {
  // put your setup code here, to run once:
  pinMode(2, INPUT_PULLUP);//pin 2變按鈕 可以高(沒按) 可以低(按)
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(2) == LOW)//如過按下去
  {
    tone(8, 523, 100);
    delay(100);
    tone(8, 784, 100);
    delay(100);
  }
}
