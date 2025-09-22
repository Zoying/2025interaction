//week03_7_arduino_serial_read_tone

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);//設定傳輸設定
  pinMode(8, OUTPUT);//要發聲音
}

void serialEvent()//等待 USB 的事件
{
  while(Serial.available())//若有資料
  {
    Serial.read();
    tone(8, 800, 200);
  }
}

void loop() {
  // put your main code here, to run repeatedly:

}
