//week11_6_pacman_part5_wall_turning_point
void setup()
{
  size(600, 600);
}
int x = 300 - 15, y = 300-15, dx = 0, dy = 0, dir = 0;
float m = 0, dm = 0.05;//嘴巴大小 m, 嘴巴改變量 diff of m
boolean [][] bean_eaten = new boolean[20][20];//JAVA的二維陣
void draw()
{
  background(0);
  for(int i = 0; i < 20; i++)//y座標
  {
    for(int j = 0; j < 20; j++)//x座標
    {
      if(bean_eaten[i][j] == false)
      {
        fill(255);//white
        ellipse(15 + j * 30, 15 + i * 30, 5, 5);
        if(dist(x, y, 15 + j * 30, 15 + i * 30) < 15) bean_eaten[i][j] = true;
      }
    }
  }
  fill(255, 255, 0);//yellow
  float m0 = dir * PI / 2;
  arc(x, y, 30, 30, m0 + m, m0 + PI * 2 - m);//弧度
  if(x + dx >= 15 && x + dx <= 600 - 15) x += dx;//不超過四周的牆
  if(y + dy >= 15 && y + dy <= 600 - 15) y += dy;//不超過四周的牆
  //豆子，轉折點座標(15 + j * 30, 15 + i * 30)
  if((x - 15) % 30 == 0 && (y - 15) % 30 == 0)
  {
    if(next == 2)  {dx = -1; dy = 0; dir = 2;}//dir:2, 向左 PI
    if(next == 0)  {dx = +1; dy = 0; dir = 0;}//dir:0, 向右 0 度
    if(next == 3)  {dx = 0; dy = -1; dir = 3;}//dir:3, 向上 PI * 1.5
    if(next == 1)  {dx = 0; dy = +1; dir = 1;}//dir:1, 向下 PI / 2
    next = -1;//沒有要轉動
  }
  if(m > 1 || m < 0) dm = -dm;//正負倒過來
  m += dm;
}
int next = -1;//一開始不轉動
void keyPressed()
{
  if(keyCode == LEFT)   next = 2;
  if(keyCode == RIGHT)  next = 0;
  if(keyCode == UP)     next = 3;
  if(keyCode == DOWN)   next = 1;
}
