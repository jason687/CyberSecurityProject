PImage img, imgAlt;

void setup() {
  img = loadImage("stegosaurus.jpg");
  size(1500, 1000);
  img.resize(750, img.height*750/img.width);
  image(img, 0, 0);
  imgAlt = img.copy();
}

void draw() {
  greenPlane(1);
  image(imgAlt, 750, 0);
}

void redPlane(int plane) {
  loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      int r = (int) red(img.pixels[i]) & plane;
      imgAlt.pixels[i] = color(r / plane * 255);
    }
  }
}

void greenPlane(int plane) {
  loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      int g = (int) green(img.pixels[i]) & plane;
      imgAlt.pixels[i] = color(g / plane * 255);
    }
  }
}

void bluePlane(int plane) {
  loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      int b = (int) blue(img.pixels[i]) & plane;
      imgAlt.pixels[i] = color(b / plane * 255);
    }
  }
}
