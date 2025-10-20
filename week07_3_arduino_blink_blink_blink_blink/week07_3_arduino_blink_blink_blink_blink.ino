//week07_3_arduino_blink_blink_blink_blink
//長的接13 短的接GND
void setup() {
  // put your setup code here, to run once:
  pinMode(10, OUTPUT);//第13隻腳, 能送出資料
  pinMode(11, OUTPUT);//第13隻腳, 能送出資料
  pinMode(12, OUTPUT);//第13隻腳, 能送出資料
  pinMode(13, OUTPUT);//第13隻腳, 能送出資料
}

void loop() {
  // put your main code here, to run repeatedly:
  for(int i = 10; i <= 13; i ++)
  {
    digitalWrite(13, LOW);
    digitalWrite(i - 1, HIGH);
    digitalWrite(i, LOW);
    delay(500);
  }
}
