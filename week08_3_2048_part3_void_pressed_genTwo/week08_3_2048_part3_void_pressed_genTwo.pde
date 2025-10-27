//week08_3_2048_part3_void_pressed_genTwo
//增加不同板子顏色
//要有4*4陣列
color [] c = {#CEC2B9, #EFE5DA, #EDE1CA, #EFB37E, #F69462, #EF7F63, #F76543};//2^1, 2^2, 2^3, ....2^6
color [] c2 = {#776E66, #776E66, #776E66, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5};//字的色彩
int [] N = {0, 2, 4, 8, 16, 32, 64};//對應的數字
int [][] B = {{0, 0, 0, 0}, {1, 2, 3, 4}, {5, 0, 0, 0}, {0, 0, 0, 0}};//板子
//找出陣列0的地方，挑1個變成空白
void keyPressed()
{
  genTwo();
}
void genTwo()
{
  int zero = 0;//找有幾個0
  for(int i = 0; i < 4; i ++)
  {
    for(int j = 0; j < 4; j ++)
    {
      if(B[i][j] == 0) zero ++;//找到0的板子
    }
  }
  int ans = int(random(zero));//用亂數決定找到第幾個0要放2
  for(int i = 0; i < 4; i ++)
  {
    for(int j = 0; j < 4; j ++)
    {
      if(B[i][j] == 0)
      {
        if(ans == 0)
        {
          B[i][j] = 1;
          return;
        }
        else ans --;//倒數用掉一個
      }
    }
  }
}
void setup()
{
  size(410, 410);
}
void draw()
{
  background(188, 174, 162);//色彩用滴管吸出來
  for(int i = 0 ; i < 4; i ++)
  {
    for(int j = 0; j < 4; j ++)
    {
      int id = B[i][j];//對應的代碼
      fill(c[id]);
      //fill(206, 194, 185);//色彩用滴管吸出來
      noStroke();//無黑線外框
      rect(j * 100 + 10, i * 100 + 10, 90, 90, 5);  //弧角是5
      fill(c2[id]);
      textAlign(CENTER, CENTER);
      textSize(60);
      text(N[id], j * 100 + 55, i * 100 + 55);
    }
  }
}
