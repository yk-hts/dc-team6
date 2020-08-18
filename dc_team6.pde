//Escape e;

//void setup() {
//  size(800, 800);
//  noStroke();
//  e = new Escape();
//}

//void draw() {
//  background(255);
//  e.life();
//}

//void mouseClicked() {
//  e.h.onClicked();
//  e.playAgain();
//}

int selectedMode = -1;
Escape e;

Ball b;
Ball b2;
Ball b3;
boolean selectLevel = true;
int level;


void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  e = new Escape();
  PFont font = createFont("Meiryo", 50);
  textFont(font);
}

void draw() {
  background(255);
  if (selectedMode == 0) {
    if (selectLevel) {
      selectGameMode();
    } else {
      g1.playGame();
    }
  } else if (selectedMode == 1) {
    if (selectLevel) {
      selectGameMode();
    } else {
      if (level == 1 || level == 2) {
        b.move();
        b.display();
        b.counter();
      } else {
        b2.move();
        b3.move();
        b2.display();
        b3.display();
        if ((b2.Inside()) && (b3.Inside())) {
          fill(0);
          textSize(30);
          textAlign(CENTER, CENTER);
          text("score:"+str(count), width/2, height/2);
        }
      }
    }
  } else if (selectedMode == 2) {
    e.life();
  } else {
    selectView();
  }
}


void mouseClicked() {
  if (selectedMode == 0) {
    if (selectLevel) {
      for (int i = 1; i <= 3; i++) {
        if (((mouseX)-(i*width/4))*((mouseX)-(i*width/4))+((mouseY)-(height/3*2))*((mouseY)-(height/3*2)) <= 2500) {
          level = i;
          g1 = new Game1(level);
          g1.getPoint();
          selectLevel = false;
        }
      }
    } else {
      if (!g1.isCleared && !g1.isGameOver  ) {
        g1.judgeClick();
      } else {
        println("2");
        if (((mouseX)-(width/2)*((mouseX)-(width/2))+((mouseY)-(height/4*3))*((mouseY)-(height/4*3)) <= 3600)) {
          selectLevel = true;
          g1.isGameOver = false;
          g1. isCleared = false;
        }
      }
    }
  } else if (selectedMode == 1) {
    if (selectLevel) {
      for (int i = 1; i <= 3; i++) {
        if (((mouseX)-(i*width/4))*((mouseX)-(i*width/4))+((mouseY)-(height/3*2))*((mouseY)-(height/3*2)) <= 2500) {
          level = i;
          if (i == 1) {
            b = new firstBall(3, 3);
          } else if (i == 2) {
            b = new secandBall(5, -5);
          } else {
            b2 = new thirdBall(2, 2);
            b3 = new thirdBall(2, -2);
          }
          selectLevel = false;
        }
      }
    } else {
      if (level == 1 || level == 2) {
        b.judgeClick();
      } else {
        b2.judgeClick();
        b3.judgeClick();
      }
    }
  } else if (selectedMode == 2) {
    e.h.onClicked();
    e.playAgain();
  } else {
    if (dist(width/4, 3*height/4, mouseX, mouseY) <= 150) {
      selectedMode = 0;
    } else if (dist(2*width/4, 3*height/4, mouseX, mouseY) <= 150) {
      selectedMode = 1;
    } else if (dist(3*width/4, 3*height/4, mouseX, mouseY) <= 150) {
      selectedMode = 2;
    }
  }
}




void selectView() {
  fill(255);
  stroke(1);
  textSize(32);  
  ellipse(width/4, 3*height/4, 150, 150);
  ellipse(2*width/4, 3*height/4, 150, 150);
  ellipse(3*width/4, 3*height/4, 150, 150);

  fill(0);
  text("select mode", width/2, height/2);
  text("fast", width/4, 3*height/4);
  text("arrest", 2*width/4, 3*height/4);
  text("escape", 3*width/4, 3*height/4);
}
