import java.util.*;
PImage img, imgAlt;
ArrayList<Button> buttons = new ArrayList();
int planecounter = 0;

void setup() {
  img = loadImage("stegosaurus.png");
  size(1500, 1000);
  if (img.height > img.width) {
    img.resize(750, img.height*750/img.width);
  } else {
    img.resize(img.width*750/img.height, 750);
  }
  fill(255, 0, 0);
  
  image(img, 0, 0);
  imgAlt = img.copy();
  rect(0, 1000, 1500, -250);
  Button left = new Button(400, 800);
  Button right = new Button(1000, 800);
  Button center = new Button(700, 800);
  buttons.add(left);
  buttons.add(right);
  buttons.add(center);
  
}

void draw() {
  switch (planecounter) {
    case 0: redPlane(planecounter); imgAlt.updatePixels();
    case 1: redPlane(planecounter); imgAlt.updatePixels();
    case 2: redPlane(planecounter); imgAlt.updatePixels();
    case 3: redPlane(planecounter); imgAlt.updatePixels();
    case 4: redPlane(planecounter); imgAlt.updatePixels();
    case 5: redPlane(planecounter); imgAlt.updatePixels();
    case 6: redPlane(planecounter); imgAlt.updatePixels();
    case 7: redPlane(planecounter); imgAlt.updatePixels();
    
  //if(planecounter / 7 == 0){
  //  redPlane(planecounter % 7);
  //} else if (planecounter / 7 == 1){
  //  greenPlane(planecounter % 7);
  //} else if (planecounter / 7 == 2){
  //  bluePlane(planecounter % 7);
  //} else if (planecounter / 7 == 3){
  //  alphaPlane(planecounter / 7);
  //} else {
  //  print("Uh oh, something not good happened");
  }
  

  image(imgAlt, 750, 0);
  for(Button i : buttons){
    i.update();
    
    if (i.rectOver) {
      fill(i.rectHighlight);
    } else {
      fill(i.rectColor);
    }
    stroke(255);
    rect(i.rectX, i.rectY, i.rectSize, i.rectSize);
  }
}

void mousePressed() {
  if (mousePressed) {
    if (mouseButton == 37) {
      if (mouseY < buttons.get(1).getY() + 90 && mouseY > buttons.get(1).getY()) {
        if (mouseX < buttons.get(1).getX() + 90 && mouseX > buttons.get(1).getX()) {
          planecounter -= 1;
          if (planecounter < 0) {
            planecounter = 7;
          }
          print(planecounter);
        }
      }
      if (mouseY < buttons.get(0).getY() + 90 && mouseY > buttons.get(0).getY()) {
        if (mouseX < buttons.get(0).getX() + 90 && mouseX > buttons.get(0).getX()) {
          planecounter += 1;
          if (planecounter > 7) {
            planecounter = 0;
          }
          print(planecounter);
        }
      }
    }
  }
}

void redPlane(int plane) {
  loadPixels();
  int digit = (int) Math.pow(2, plane);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      int r = (int) red(img.pixels[i]) & digit;
      imgAlt.pixels[i] = color(r / digit * 255);
    }
  }
}

void greenPlane(int plane) {
  loadPixels();
  int digit = (int) Math.pow(2, plane);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      int g = (int) green(img.pixels[i]) & digit;
      imgAlt.pixels[i] = color(g / digit * 255);
    }
  }
}

void bluePlane(int plane) {
  loadPixels();
  int digit = (int) Math.pow(2, plane);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      int b = (int) blue(img.pixels[i]) & digit;
      imgAlt.pixels[i] = color(b / digit * 255);
    }
  }
}

void alphaPlane(int plane) {
  loadPixels();
  int digit = (int) Math.pow(2, plane);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      int a = (int) alpha(img.pixels[i]) & digit;
      imgAlt.pixels[i] = color(a / digit * 255);
    }
  }
}

////buttons

//class Button{
//  int rectX, rectY;      // Position of square button
//  int rectSize = 90;     // Diameter of rect
//  color rectColor, baseColor;
//  color rectHighlight;
//  color currentColor;
//  boolean rectOver = false;
  
//  Button (int x, int y){
//    rectColor = color(0);
//    rectHighlight = color(51);
//    baseColor = color(102);
//    currentColor = baseColor;
//    rectX = x;
//    rectY = y;

//  }
  
//  void draw() {
//    update();
    
//    if (rectOver) {
//      fill(rectHighlight);
//    } else {
//      fill(rectColor);
//    }
//    stroke(255);
//    rect(rectX, rectY, rectSize, rectSize);
//    mousePressed();
//  }
  
//  void update() {
//    rectOver = overRect(rectX, rectY, rectSize, rectSize);
//  }
  
//  void mousePressed() {
//    print("abc");
//  }
  
//  boolean overRect(int x, int y, int width, int height)  {
//    if (mouseX >= x && mouseX <= x+width && 
//        mouseY >= y && mouseY <= y+height) {
//      return true;
//    } else {
//      return false;
//    }
//  }
  
//  boolean overCircle(int x, int y, int diameter) {
//    float disX = x - mouseX;
//    float disY = y - mouseY;
//    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//}
  
  
