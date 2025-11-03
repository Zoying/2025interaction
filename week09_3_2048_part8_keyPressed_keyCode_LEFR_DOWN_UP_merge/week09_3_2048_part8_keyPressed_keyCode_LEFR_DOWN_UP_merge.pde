//week09_3_2048_part8_keyPressed_keyCode_LEFR_DOWN_UP_merge
//增加不同板子顏色
//要有4*4陣列
color [] c = {#CEC2B9, #EFE5DA, #EDE1CA, #EFB37E, #F69462, #EF7F63, #F76543};//2^1, 2^2, 2^3, ....2^6
color [] c2 = {#776E66, #776E66, #776E66, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5};//字的色彩
int [] N = {0, 2, 4, 8, 16, 32, 64};//對應的數字
int [][] B = {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}};//板子
//找出陣列0的地方，挑1個變成空白
void keyPressed()
{
    if(keyCode == RIGHT)//右鍵
    {
      for(int i = 0; i < 4; i ++)
      {
        int now = 3;
        for(int j = 3; j >= 0; j --)//右往左 慢慢找
        {
          if(B[i][j] > 0)//找到有板子
          {
            B[i][now] = B[i][j];
            if(now < 3)//檢查是否要merge
            {
              //if(now < 3 && B[i][now + 1] == B[i][now])
              while(now < 3 && B[i][now + 1] == B[i][now])//與右邊的相同 要重複多次 所以不能用if
              {
                B[i][now + 1]++;//編號變大
                now++;
              }
            }
            now--;//下一格
          }
        }
        for(int j = now; j >= 0; j --)
        {
          B[i][j] = 0;//剩下皆為0
        }
      }
    }
    else if(keyCode == LEFT)
    {
      for(int i = 0; i < 4; i ++)
      {
        int now = 0;
        for(int j = 0; j < 4; j ++)//左往右 慢慢找
        {
          if(B[i][j] > 0)//找到有板子
          {
            B[i][now] = B[i][j];
            //if(now < 3)//檢查是否要merge
              //if(now < 3 && B[i][now + 1] == B[i][now])
              while(now > 0 && B[i][now - 1] == B[i][now])//與右邊的相同 要重複多次 所以不能用if
              {
                B[i][now - 1]++;//編號變大
                now--;
              }
            now++;//下一格
          }
        }
        for(int j = now; j < 4; j ++)
        {
          B[i][j] = 0;//剩下皆為0
        }
      }
    }
    else if(keyCode == UP)
    {
      for(int j = 0; j < 4; j ++)
      {
        int now = 0;
        for(int i = 0; i < 4; i ++)
        {
          if(B[i][j] > 0)
          {
            B[now][j] = B[i][j];
            while(now > 0 && B[now - 1][j] == B[now][j])
            {
              B[now - 1][j]++;
              now--;
            }
            now++;
         }
        }
        for(int i = now; i >= 0; i --)
        {
          B[i][j] = 0;
        }
      }
    }
    else if(keyCode == DOWN)
    {
      for(int j = 0; j < 4; j ++)
      {
        int now = 3;
        for(int i = 3; i >= 0; i --)
        {
          if(B[i][j] > 0)
          {
            B[now][j] = B[i][j];
            while(now < 3 && B[now + 1][j] == B[now][j])
            {
              B[now + 1][j]++;
              now++;
            }
            now--;
           }
        }
        for(int i = now; i >= 0; i --)
        {
          B[i][j] = 0;
        }
      }
    }
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
