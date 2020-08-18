int count = 0;
abstract class Ball {
  int x;
  int y;
  int size = 50;
  int stepX;
  int stepY;
  boolean inside = false;
  Ball(int stepX0, int stepY0) {
    x = int(random(350, 450));
    y = int(random(350, 450));
    stepX = stepX0;
    stepY = stepY0;
  }

  void display() {
    ellipse(x, y, size, size);
  }
  void move() {
    x += stepX;
    y += stepY;
  }
  float InsideBall() {
    return dist(mouseX, mouseY, x, y);
  }
  boolean Inside() {
    if (x > width || x < 0 || y > height || y < 0) {
      inside = true;
    }
    return inside;
  }
  void counter() {
    if (Inside()) {
      result();
    }
  }
  void judgeClick() {
    if (InsideBall() < 50) {
      randomStep();
    }
  }
  void result () {
    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("score:"+str(count), width/2, height/2);
  }
  abstract void randomStep();
}



void selectGameMode() {
  if (selectLevel) {
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("please Select Level", width/2, height/3);
    for (int i = 1; i <= 3; i++) {
      fill(255);
      ellipse(i*width/4, height/3*2, 100, 100);
      fill(0);
      textSize(30);
      textAlign(CENTER);
      text("Level"+i, i*width/4, height/3*2+10);
    }
  }
}


class firstBall extends Ball {
  firstBall(int stepX0, int stepY0) {
    super(stepX0, stepY0);
  }
  void randomStep() {
    if (stepX == 3 || stepX == -3) {
      stepX *= -1;
      stepY *= int(random(2))*2-1;
    }
    if (stepY == 3 ||stepY == -3) {
      stepY *= -1;
      stepX *= int(random(2))*2-1;
    }
    count += 1;
  }
}
class secandBall extends Ball {
  secandBall(int stepX0, int stepY0) {
    super(stepX0, stepY0);
  }
  void randomStep() {
    if (stepX == 5 || stepX == -5) {
      stepX *= -1;
      stepY *= int(random(2))*2-1;
    }
    if (stepY == 5 ||stepY == -5) {
      stepY *= -1;
      stepX *= int(random(2))*2-1;
    }
    count += 1;
  }
}
class thirdBall extends Ball {
  thirdBall(int stepX0, int stepY0) {
    super(stepX0, stepY0);
  }
  void randomStep() {
    if (stepX == 2 || stepX == -2) {
      stepX *= -1;
      stepY *= int(random(2))*2-1;
    }
    if (stepY == 2 ||stepY == -2) {
      stepY *= -1;
      stepX *= int(random(2))*2-1;
    }
    count += 1;
  }
}
