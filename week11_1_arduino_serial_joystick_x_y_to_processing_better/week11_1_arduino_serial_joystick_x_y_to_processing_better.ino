//week11_1_arduino_serial_joystick_x_y_to_processing_better
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(2, INPUT_PULLUP);
  pinMode(8, OUTPUT);
}
int count = 0, totalX = 0, totalY = 0;
int x0 = 512, y0 = 512;
void loop() {
  // put your main code here, to run repeatedly:
  delay(30);
  int x = analogRead(A2);//X -> A2
  int y = analogRead(A3);//Y -> A3
  if(count < 20)
  {
    totalX += x;//加總，算平均值
    totalY += y;//加總，算平均值
    count++;
    x0 = totalX / count;
    y0 = totalY / count;
  }
  //Serial.write(x / 4);//把0 ~ 1023 變 0 ~ 255
  //Serial.write(y / 4);
  if(abs(x - x0) < 25) x = 128;
  else x = (x - x0) / 4.4 + 128;
  if(abs(y - y0) < 25) x = 128;
  else x = (y - y0) / 4.4 + 128;
  Serial.write(x);
  Serial.write(y);

  //if(x > 900) tone(8, 784, 100);
  //if(x < 100) tone(8, 523, 100);
  //if(y > 900) tone(8, 659, 100);
  //if(y < 100) tone(8, 500, 100);
}