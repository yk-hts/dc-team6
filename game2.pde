class Escape {
  private int diff = 7, score = 0;
  private boolean dead = false;
  Hero h = new Hero();
  Devil d1 = new Devil();
  Devil d2 = new Devil();


  Escape() {
  }

  void life() {
    noStroke();
    //textAlign(CENTER, CENTER);
    if (dead) {
      textSize(width / 10);
      text("game over", width/2, height/6);
      text("score:" + score, width / 2, 2 * height/6);
      text("play again", width / 2, 3 * height/6);
      noFill();
      stroke(1);
      textSize(32);
      ellipse(width / 4, 5 * height / 6, 200, 200);
      text("easy", width / 4, 5 * height / 6);
      ellipse(3*width / 4, 5 * height / 6, 200, 200);
      text("hard", 3*width / 4, 5 * height / 6);
    } else {
      textSize(32);
      text("score:"+score, width / 7, height / 7);
      stroke(1);
      line(0, 3 * height / 4.0 + h.getR(), width, 3 * height / 4.0 + h.getR());
      noStroke();
      h.life();
      if (d1.getX() + d1.getR() <= diff) {
        if (d1.getY() == d2.getY()) {
          score += 1;
        } else {
          score += 2;
        }
      }
      d1.life();
      d2.life();
      isDamaged();
    }
  }

  void isDamaged() {
    if (dist(h.getX(), h.getY(), d1.getX(), d1.getY()) <= h.getR() + d1.getR()) {
      dead = true;
    }
    if (dist(h.getX(), h.getY(), d2.getX(), d2.getY()) <= h.getR() + d2.getR()) {
      dead = true;
    }
  }

  void playAgain() {
    if (dead) {
      if (dist(mouseX, mouseY, width / 4, 5 * height / 6) <= 200) {
        dead = false;
        h = new Hero();
        d1 = new Devil();
        d2 = new Devil();
        score = 0;
        diff = 7;
      } else if (dist(mouseX, mouseY, 3*width / 4, 5 * height / 6) <= 200) {
        dead = false;
        h = new Hero();
        d1 = new Devil();
        d2 = new Devil();
        score = 0;
        diff = 10;
      }
      noStroke();
    }
  }

  abstract class Slime {
    private float x, y, r;

    Slime(float _x, float _y, float _r) {
      x = _x;
      y = _y;
      r = _r;
    }

    float getX() {
      return x;
    }

    float getY() {
      return y;
    }

    float getR() {
      return r;
    }

    void setCoordinates (float _x, float _y) {
      x = _x;
      y = _y;
    }

    abstract void display();

    abstract void life();
  }

  class Hero extends Slime {
    private int jumpCount = 0;
    private float y_temp, y_prev;

    Hero() {
      super(width / 6.0, 3 * height / 4.0, 50);
    }

    void life() {
      display();
      jump();
    }

    void jump() {
      if (jumpCount >= 1) {
        y_temp = getY();
        if (getY() + (getY() - y_prev) + 1 >= 3 * height / 4.0) {
          setCoordinates(getX(), 3 * height / 4.0);
        } else {
          setCoordinates(getX(), 2 * getY() - y_prev + 0.7);
          y_prev = y_temp;
        }
        if (getY() >= 3 * height / 4.0) {
          jumpCount--;
        }
      }
    }

    void display() {
      fill(255, 235, 59);
      ellipse(getX(), getY(), 2 * getR(), 2 * getR());
      fill(255, 0, 0);
      quad(getX()- 3 * getR() / 4.0, getY() - getR() / 2.0, getX() - getR() / 4.0, getY() - getR() / 2.0, getX() - getR() / 2.0, getY() + getR(), getX() - 3 * getR() / 2.0, getY() + 3 * getR() / 4.0);
    }

    void onClicked() {
      if (jumpCount < 2) {
        jumpCount++;
        y_prev=getY();
        setCoordinates(getX(), getY() - 16);
      }
    }
  }

  class Devil extends Slime {

    Devil() {
      super(width + 50, height / 4.0, 50);
    }

    void life() {
      display();
      move();
      if (getX() + getR() <= 0) {
        respone();
      }
    }

    void move() {
      setCoordinates(getX() - diff, getY());
    }

    void respone() {
      int r = int(random(3));
      if (r == 0) {
        setCoordinates(width + getR(), 1 * height / 4.0);
      } else if (r == 1) {
        setCoordinates(width + getR(), 2 * height / 4.0);
      } else {
        setCoordinates(width + getR(), 3 * height / 4.0);
      }
    }

    void display() {
      fill(103, 58, 183);
      triangle(getX() - getR() / 2, getY() - 1.3 * getR(), getX() - getR() / 4, getY() - getR() / 2, getX() - 3 * getR() / 4.0, getY() - getR() / 2);      
      triangle(getX() + getR() / 2, getY() - 1.3 * getR(), getX() + getR() / 4, getY() - getR() / 2, getX() + 3 * getR() / 4.0, getY() - getR() / 2);
      ellipse(getX(), getY(), 2 * getR(), 2 * getR());
    }
  }
}
