class Ball extends GameElement {
  // Fields
  float r; // radius

  // Constructors
  Ball (float x, float y, float r) {
    super(x, y, 4, 4, color(255));
    this.r = r;
  }

  // Methods
  void plot() {
    fill(c);
    ellipse(x, y, r*2, r*2);
  }

  void reactToBorders() {
    // Border check
    if (x > width-r) {
      // reset
      x = width/2;
      y = height/2;
      s1 = 0;
      s2 = 0;
      dx = dx * -1;
    }
    if (x < r) {
      // reset
      x = width/2;
      y = height/2;
      s1 = 0;
      s2 = 0;
      dx = dx * -1;
    }
    if (y > height-r || y < r) {
      dy = dy * -1;
    }
    
    // Bounce when touching the bat; gap from margin: 50; height of bat: 20
    if (x == margin + thickness + r && y > a1.y && y < a1.y + len1) {
      dx = (dx > 0) ? -(dx + speed) : -(dx - speed);
      dy = (dy > 0) ? (dy + speed) : (dy - speed);
      s1 += 1;
    }
    if (x == width - margin - thickness - r && y > a2.y && y < a2.y + len2) {
      dx = (dx > 0) ? -(dx + speed) : -(dx - speed);
      dy = (dy > 0) ? (dy + speed) : (dy - speed);
      s2 += 1;
    }
  }
}