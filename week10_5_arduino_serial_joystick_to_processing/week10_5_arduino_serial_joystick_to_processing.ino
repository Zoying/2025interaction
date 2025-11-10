//week10_5_arduino_serial_joystick_to_processing
//不使用serial.println() 改用serial_monitor_joystick_Serial_println
//
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(2, INPUT_PULLUP);//pin 2變按鈕 可以高(沒按) 可以低(按)
  pinMode(8, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(30);
  int now = analogRead(A3) / 4; //要除以4
  Serial.write(now);//把0-255的數值送出去
  if(now > 200) tone(8, 784, 100);
  if(now < 50) tone(8, 523, 100);
}
