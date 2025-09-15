//week02_3_myMusic_serial
//修改自week02_2
//把 MakeUNO_DefaultSketch 先複製過來
//把 setup() 裡的 for迴圈，copy 到 myMusic
#define NOTE_C5 523
#define NOTE_E5 659
#define NOTE_G5 784

#define BUTTON 2
#define BUZZER 8

int melody[] = {
  NOTE_E5, NOTE_E5, 0, NOTE_E5, 0, NOTE_C5, NOTE_E5, 0, NOTE_G5
};

int noteDurations[] = {
  10, 10, 10, 10, 10, 10, 10, 10, 10
};

int pin;
int ledArrayHigh;
int ledArrayLow;
boolean mode = false;
boolean buttonPressed = false;

void setup()
{
  delay(1000);
  Serial.begin(9600);//5.在 Arduino 裡 setup
  pinMode(BUTTON, INPUT_PULLUP);
  for (pin = 3; pin < 14; pin++) { 
    pinMode(pin, OUTPUT);
  }

  for (int thisNote = 0; thisNote < 9; thisNote++) {
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(BUZZER, melody[thisNote], noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    noTone(BUZZER);
  }
}

void myMusic()
{
  for (int thisNote = 0; thisNote < 9; thisNote++) {
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(BUZZER, melody[thisNote], noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    noTone(BUZZER);
  }
}
void serialEvent()//6.負責 USB 的 Serial 的函式
{
  while (Serial.available())//7.如果 USB 有資料
  {
    Serial.read();//8.讀入
    myMusic();//9.myMusic 播音樂
  }
}
void loop()
{
  for (pin = 0; pin < 5; pin++) {
    if (digitalRead(BUTTON) == LOW &&
        buttonPressed == false) {
      myMusic();
      myMusic();
      myMusic();
      buttonPressed = true;
      mode = !mode;
      pin = 0;
      if (mode == false) {
        tone(BUZZER, NOTE_C5, 100);
        delay(100);
        tone(BUZZER, NOTE_G5, 100);
        delay(100);
        noTone(BUZZER);
      }
      else if (mode == true) {
        tone(BUZZER, NOTE_G5, 100);
        delay(100);
        tone(BUZZER, NOTE_C5, 100);
        delay(100);
        noTone(BUZZER);
      }
    }

    if (mode == false) {
      ledArrayHigh = 13 - pin;
      ledArrayLow = 7 - pin;
    }
    else if (mode == true) {
      ledArrayHigh = 9 + pin;
      ledArrayLow = 3 + pin;
    }
    digitalWrite(ledArrayHigh, HIGH);
    digitalWrite(ledArrayLow, HIGH);
    delay(100);
    digitalWrite(ledArrayHigh, LOW);
    digitalWrite(ledArrayLow, LOW);
    if (pin == 4) delay(100);
  }

  if (buttonPressed == true) {
    buttonPressed = false;
  }
}