// Create and save the French flag as france.bmp
PImage flag,reflag;
void setup() {
  size(600, 400);
  int w = 600;  // image width
  int h = 400;  // image height
  flag = loadImage("france.bmp");
  reflag = createImage(w, h, RGB);
  flag.loadPixels();
  reflag.loadPixels();

  // Each vertical stripe width
  for (int i = 0; i < flag.pixels.length; i++) {
    color c = flag.pixels[i];
    int r = 255 - int(red(c));
    int g = 255 - int(green(c));
    int b = 255 - int(blue(c));
    reflag.pixels[i] = color(r,g,b);
  }

  reflag.updatePixels();
  // draw on screen
  image(reflag, 0, 0);

  // save as BMP
  reflag.save("franceReverted.bmp");
  println("Saved france.bmp in the sketch folder.");
}

void draw() {
  // nothing needed
}
