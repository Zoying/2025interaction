//week06_1_sound_library_soundfile_play
//file_preference字形改大
//sketch-library-managelibrary-sound
//file-examples-libraries-sound
import processing.sound.*;//使用聲音外掛模組
SoundFile sound;//宣告變數
void setup()
{
  size(500, 400);
  sound = new SoundFile(this, "music.mp3"); 
  sound.play();
}
void draw()
{

}
