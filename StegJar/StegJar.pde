PImage img, imgAlt;

void setup() {
  img = loadImage("stegosaurus.jpg");
  size(1500, 1000);
  img.resize(750, img.height*750/img.width);
  image(img, 0, 0);
  imgAlt = img.copy();
}

void draw() {
  image(imgAlt, 750, 0);
}

void red1() {
  loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int i = x + y*img.width;
      int r = (int) red(img.pixels[i]) / 100000;
      imgAlt.pixels[i] = r;
    }
  }
}
