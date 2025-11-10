//week10_3_arduino_analog_A3
//把 joystick 的 Y 線，接到 MakerUno A3

void setup() {
  // put your setup code here, to run once:
  pinMode(2, INPUT_PULLUP);//pin 2變按鈕 可以高(沒按) 可以低(按)
  pinMode(8, OUTPUT);
}

void loop() {
  int now = analogRead(A3);
  if(now > 800)
  {
    tone(8, 523, 100);
    delay(100);
    tone(8, 784, 100);
    delay(200);
  }
  else if(now < 200)
  {
    tone(8, 784, 100);
    delay(100);
    tone(8, 523, 100);
    delay(200);
  }
}
