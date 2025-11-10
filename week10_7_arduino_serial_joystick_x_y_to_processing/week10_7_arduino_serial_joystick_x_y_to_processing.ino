//week10_7_arduino_serial_joystick_x_y_to_processing
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(2, INPUT_PULLUP);
  pinMode(8, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(30);
  int x = analogRead(A2);//X -> A2
  int y = analogRead(A3);//Y -> A3
  Serial.write(x / 4);//把0 ~ 1023 變 0 ~ 255
  Serial.write(y / 4);
  if(x > 900) tone(8, 784, 100);
  if(x < 100) tone(8, 523, 100);
  if(y > 900) tone(8, 659, 100);
  if(y < 100) tone(8, 500, 100);
}
