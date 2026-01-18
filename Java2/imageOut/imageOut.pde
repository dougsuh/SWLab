// Create and save the French flag as france.bmp
PImage flag;

void setup() {
  size(600, 400);
  int w = 600;  // image width
  int h = 400;  // image height

  flag = createImage(w, h, RGB);
  flag.loadPixels();

  // Each vertical stripe width
  int stripe = w / 3;

  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {

      // Left stripe: blue
      if (x < stripe) {
        flag.pixels[y * w + x] = color(0, 85, 164);      // official blue
      }
      // Middle stripe: white
      else if (x < 2 * stripe) {
        flag.pixels[y * w + x] = color(255, 255, 255);   // white
      }
      // Right stripe: red
      else {
        flag.pixels[y * w + x] = color(239, 65, 53);     // official red
      }
    }
  }

  flag.updatePixels();

  // draw on screen
  image(flag, 0, 0);

  // save as BMP
  flag.save("france.bmp");
  println("Saved france.bmp in the sketch folder.");
}

void draw() {
  // nothing needed
}
