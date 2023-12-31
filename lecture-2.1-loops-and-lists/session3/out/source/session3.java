/* autogenerated by Processing revision 1293 on 2023-09-10 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class session3 extends PApplet {

// Draw lines
// Integer array to store x position
int mx [];

// Integer array to store y position
int my [];

// Length of line
int len;

public void setup() {
  /* size commented out by preprocessor */;
  len = 100;
  mx = new int [len];
  my = new int [len];
}

public void draw() {
  background(255);

  for (int i = len - 1; i > 0; i--) {
    mx[i] = mx[i-1];
    my[i] = my[i-1];
  }

  // Old version
  // mx[2] = mx[1];
  // my[2] = my[1];

  // mx[1] = mx[0];
  // my[1] = my[0];

  // current position
  mx[0] = mouseX;
  my[0] = mouseY;

  for (int i = 0; i < len - 1; i++) {
    line(mx[i], my[i],mx[i+1],my[i+1]);
  }
  // Old version
  // line(mx[1],my[1],mx[2],my[2]);
  // line(mx[0],my[0],mx[1],my[1]);

}
// End of Draw lines

// Draw rectanlges using loops
// float x;
// float y;
// float s;


// void setup() {
//   size(600, 600);
//   frameRate(2);
// }

// void draw() {
//   background(0);

//   for (int i = 0; i < 100; i++) {
//     x = random(width);
//     y = random(height);
//     s = 50;
//     rect(x,y,i,i);
//     fill(random(255));
//   }

// }
// end of drawing loops


  public void settings() { size(600, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "session3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
