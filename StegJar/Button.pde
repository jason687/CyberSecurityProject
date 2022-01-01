public class Button {
  int rectX, rectY;      // Position of square button
  int rectSize = 90;     // Diameter of rect
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;
  String text = "";
  
  public Button (int x, int y, String txt){
    rectColor = color(100);
    rectHighlight = color(150);
    baseColor = color(255);
    currentColor = baseColor;
    rectX = x;
    rectY = y;
    text = txt;

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
  
  void displayText(){
    fill(255);
    text(text, rectX+45, rectY+45);
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
