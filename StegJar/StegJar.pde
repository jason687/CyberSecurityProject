import java.util.*;
PImage img, imgAlt;
ArrayList<Button> buttons = new ArrayList();
int planecounter = 0; // 0 = 
int plane = 0;
void setup() {
  textAlign(CENTER);
  img = loadImage("stegosaurus.png");
  size(1500, 1000);
  if (img.height > img.width) {
    img.resize(750, img.height*750/img.width);
  } else {
    img.resize(img.width*750/img.height, 750);
  }
  
  Button left = new Button(400, 800, "left");
  Button right = new Button(1000, 800, "right");
  Button center = new Button(705, 800, "original image");
  buttons.add(left);
  buttons.add(right);
  buttons.add(center);
  
}

void draw() {
  background(0);
  fill(255, 0, 0); // control panel bg color
  stroke(255,0,0);
  image(img, 0, 0);
  imgAlt = img.copy();
  rect(0, 750, 1500, 250);
  
  boolean original = false; // cheating here because code - case 0 is original, theres an if statement at the end that tells it to just display the regular image if it is the original
  switch (plane){
    case 0: original = true; break;
    case 1: redPlane(planecounter); imgAlt.updatePixels(); break;
    case 2: greenPlane(planecounter); imgAlt.updatePixels(); break;
    case 3: bluePlane(planecounter); imgAlt.updatePixels(); break;
    case 4: alphaPlane(planecounter); imgAlt.updatePixels(); break;
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
    i.displayText();
  }
  if(original){
    image(img, 750, 0);
  }
  displayCounter();
}

void displayCounter(){
  fill(255); // planecounter bg color
  stroke(0);
  rect(0, 750, 1500, 30);
  fill(0);
  switch (plane){
    case 0: text("Original image", 750, 775); break;
    case 1: text("Red plane " + planecounter, 750, 775); break;
    case 2: text("Green plane " + planecounter, 750, 775); break;
    case 3: text("Blue plane " + planecounter, 750, 775); break;
    case 4: text("Alpha plane " + planecounter, 750, 775); break;
  } 
}


void mousePressed() {
  if (mousePressed) {
    if (mouseButton == 37) {
      //right button, INCREASES planecounter
      if (mouseY < buttons.get(0).getY() + 90 && mouseY > buttons.get(0).getY()) {
        if (mouseX < buttons.get(0).getX() + 90 && mouseX > buttons.get(0).getX()) {
          if(plane == 0){
            plane = 4;
            planecounter = 7;
            print(plane + " ");
            println(planecounter);
            return;
          }
          planecounter -= 1;
          if (planecounter < 0) {
            planecounter = 7;
            plane -= 1;
            if (plane < 0){
              plane = 4;
            }
          }
          //print(planecounter);
        }
      }
      //left button, DECREASES planecounter
      if (mouseY < buttons.get(1).getY() + 90 && mouseY > buttons.get(1).getY()) {
        if (mouseX < buttons.get(1).getX() + 90 && mouseX > buttons.get(1).getX()) {
          if(plane == 0){
            plane = 1;
            planecounter = 0;
            print(plane + " ");
            println(planecounter);
            return;
          }
          planecounter += 1;
          if (planecounter > 7) {
            planecounter = 0;
            plane += 1;
            if (plane > 4){
              plane = 0;
            }
          }
          //print(planecounter);
        }
      }
    }
  }
  //print(plane + " ");
  //println(planecounter);
}



void originalPlane(){
  loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      imgAlt.pixels[i] = color( red(img.pixels[i]) , green(img.pixels[i]) , blue(img.pixels[i]) );
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
