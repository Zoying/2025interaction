//week03_8_arduino_beep_beep_Serial_read

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);//設定傳輸設定
  pinMode(8, OUTPUT);//要發聲音
}

int beep = 1;
void serialEvent()//等待 USB 的事件
{
  while(Serial.available())//若有資料
  {
    char now = Serial.read();
    if(now == ' ') beep = 0;
    if(now == 'b') beep = 1;
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  if(beep == 1)
  {
    tone(8, 800, 200);
    delay(1000);
  }
}
