int size = 50;
class Game1 {
  int n, missClick;
  float[] pointX;
  float[] pointY;
  int ballCnt = n, ms0, ms;
  boolean isGameOver = false;
  boolean isCleared = false;
  int countDown, timeLimit;
  Game1(int count) {
    n = count*10;
    pointX = new float[n];
    pointY = new float[n];
    timeLimit = count * 15;
  }
  void GameOver() {
    fill(0);
    textSize(80);
    textAlign(CENTER, CENTER);
    text("your score:"+ballCnt, width/2, height/2);
    text("GameOver", width/2, height/4);
    fill(255);
    stroke(1);
    ellipse(width/2, height/4*3, 120, 120);
    fill(0);
    textSize(20);
    text("next game", width/2, height/4*3);
  }
  void getPoint() {
    for (int i = 0; i < n; i++) {
      pointX[i] = random(size, width-size);
      pointY[i] = random(size, height-size);
    }
    ms = millis()/1000;
    ms0 = ms;
  }
  void drawEllipse() {
    for (int i = n-1; i >= ballCnt; i--) {
      getCol(i);
      noStroke();
      ellipse(pointX[i], pointY[i], size, size);
      drawNum(pointX[i], pointY[i], i+1);
    }
  }
  void drawNum(float x, float y, int n) {
    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(n, x, y-5);
  }
  void getCol(int i) {
    if (i%3==0) {
      fill(255, 0, 0);
    } else if (i%3==1) {
      fill(255, 255, 0);
    } else {
      fill(0, 255, 255);
    }
  }
  void judgeClick() {
    if (((mouseX)-(pointX[ballCnt]))*((mouseX)-(pointX[ballCnt]))+((mouseY)-(pointY[ballCnt]))*((mouseY)-(pointY[ballCnt])) <= size/2*size/2) {
      ballCnt += 1;
      missClick = 0;
    } else {
      missClick += 1;
      if (missClick == 5) {
        isGameOver = true;
      }
    }
    if (ballCnt == n) {
      isCleared = true;
    }
  }
  void playGame() {
    if (!isCleared) {
      if (!isGameOver) {
        drawEllipse();
        remainBalls();
        timer();
        remailTime();
      } else {
        GameOver();
      }
    } else {
      fill(0);
      textSize(60);
      textAlign(CENTER);
      text("congratulations!", width/2, height/2);
      fill(255);
      stroke(1);
      ellipse(width/2, height/4*3, 120, 120);
      fill(0);
      textSize(20);
      text("next game", width/2, height/4*3);
    }
  }
  void remailTime() {
    fill(0);
    textSize(30);
    text("残り"+countDown+"秒", 80, 30);
  }
  void timer() {
    ms = millis()/1000;
    fill(0);
    countDown = timeLimit - (ms-ms0);
    if (countDown == 0) {
      isGameOver = true;
    }
  }
  void remainBalls() {
    fill(0);
    textSize(30);
    text("残り"+(n-ballCnt)+"個", width-80, 30);
  }
}

Game1 g1;
