PImage img;

void setup() {
  img = loadImage("stegosaurus.png");
  int widtha = img.width;
  int heighta = img.height;
  size(widtha, heighta);
}

void draw() {
  image(img, 0, 0);
}
