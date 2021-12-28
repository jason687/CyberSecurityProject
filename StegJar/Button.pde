public class Button {
  int rectX, rectY;      // Position of square button
  int rectSize = 90;     // Diameter of rect
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;
  
  public Button (int x, int y){
    rectColor = color(0);
    rectHighlight = color(51);
    baseColor = color(102);
    currentColor = baseColor;
    rectX = x;
    rectY = y;

  }
  
  //void draw() {
  //  update();
    
  //  if (rectOver) {
  //    fill(rectHighlight);
  //  } else {
  //    fill(rectColor);
  //  }
  //  stroke(255);
  //  rect(rectX, rectY, rectSize, rectSize);
  //}
  // in StegJar draw; unecessary
  
  void update() {
    rectOver = overRect(rectX, rectY, rectSize, rectSize);
  }
  
  //void mousePressed() {
  //  if (mousePressed) {
  //    print("12#");
  //  }
  //}
  // i don't believe it does anthing here; has to be in main class
  
  boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
  
  int getX() {
    return rectX;
  }
  
  int getY() {
    return rectY;
  }
}
