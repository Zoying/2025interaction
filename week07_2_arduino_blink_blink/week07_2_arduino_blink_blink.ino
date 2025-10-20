//week07_2_arduino_blink_blink
//長的接13 短的接GND
void setup() {
  // put your setup code here, to run once:
  pinMode(13, OUTPUT);//第13隻腳, 能送出資料
  pinMode(12, OUTPUT);//第13隻腳, 能送出資料
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(13, HIGH);//發亮
  delay(500);
  digitalWrite(13, LOW);//暗掉
  digitalWrite(12, HIGH);//發亮
  delay(500);
  digitalWrite(12, LOW);//暗掉
  delay(500);
}
