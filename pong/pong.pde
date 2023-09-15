Ball b1;
Bat a1, a2;

PFont myFont; // Declare a PFont variable
int s1, s2; // Scores variable
// Bats constant
int len1 = 140; // left bat length
int len2 = 140; // right bat length
int thickness = 20; // bat width
int margin = 70;
// Ball variables
int r = 10; // radius
int speed = 0; // speed for fast ball


void setup() {
  size(1000,600);
  // Load the built-in font with size 32
  myFont = createFont("Courier", 32); 
  textFont(myFont); // Set the font for text
  resetGame();
}



void draw() {
  // Game console style
  background(0);
  plotMiddleLine();
  plotScores();

  // Object ball
  b1.handle();
  changeBallColor();
  changeBallSpeed();

  // Object bats
  shrinkBats();
  a1.handle();
  a2.handle();
}

void resetGame() {
  b1 = new Ball(width/2, height*3/4, r);
  // Reset score
  s1 = 0;
  s2 = 0;
  a1 = new Bat(margin, height/2, len1, thickness);
  a2 = new Bat(width-margin-thickness, height/2, len2, thickness);
}


void plotMiddleLine() {
  for (int i = 0; i < 30; i++) {
    fill(i % 2 == 0 ? 255 : 0);
    rect(width/2-2.5, 10+20*i, 5, 20);
  }
}

void plotScores() {
  fill(255); // Text color (white)
  text(s1, width/2-10-100, 100);
  text(s2, width/2-10+100-5, 100);
}


void changeBallColor() {
  // Ball color change darler every 5 total scores after player scores when total players' scores reaches 15
  if (s1+s2 > 15) {
    b1.c = 115;
  }
  if (s1+s2 > 20) {
    b1.c = 60;
  }
  if (s1+s2 > 25) {
    b1.c = 30;
  }
}

void changeBallSpeed() {
  if (s1+s2 >= 5 && s1+s2 <= 40 && s1+s2 % 5 == 0) {
    speed = 1;
  } else {
    speed = 0;
  }
}

void shrinkBats() {
  // Shrinking bats after 30 total scores when player scores
  int newLen1 = len2 - min(int(s1) / 5 * 10, 80);
  int newLen2 = len1 - min(int(s2) / 5 * 10, 80);
  a1.w = newLen1;
  a2.w = newLen2;
}

void keyPressed() {
  // Left bar control
  if (key == 'w' && a1.y > 0) {
    a1.dy = -5;
  }
  else if (key == 's' && a1.y < height - len1) {
    a1.dy = 5;
  }
  else if (key == 'a') {
    a1.dx = -5;
  }
  else if (key == 'd') {
    a1.dx = 5;
  }

  // Right bar control
  if (keyCode == UP && a2.y > 0) {
    a2.dy = -5;
  } else if (keyCode == DOWN && a2.y < width - len2) {
    a2.dy = 5;
  } else if (keyCode == RIGHT) {
    a2.dx = 5;
  } else if (keyCode == LEFT) {
    a2.dx = -5;
  }
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    a1.dy = 0;
  } else if (key == 'a' || key == 'd') {
    a1.dx = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    a2.dy = 0;
  } else if (keyCode == LEFT || keyCode == RIGHT) {
    a2.dx = 0;
  } 
}
