public class Button {
  int rectX, rectY;      // Position of square button
  int rectSize = 90;     // Diameter of rect
  color rectColor;
  color rectHighlight;

  boolean rectOver = false;
  String text = "";
  
  public Button (int x, int y, String txt){
    rectColor = color(100);
    rectHighlight = color(150);
    rectX = x;
    rectY = y;
    text = txt;
  }
  
  void update() {
    rectOver = overRect(rectX, rectY, rectSize, rectSize);
  }
  
  void displayText(){
    fill(255);
    text(text, rectX+45, rectY+45);
  }
  
  boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
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
