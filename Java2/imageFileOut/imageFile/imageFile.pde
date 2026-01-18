PImage img;

void setup() {
  size(600, 400);

  // --- 1) Read BMP file ---
  // Put "test.bmp" inside the "data" folder of the sketch
  img = loadImage("test.bmp");

  if (img == null) {
    println("Image load failed: please check that test.bmp exists in the data folder.");
    exit();
  }

  // Resize the window to match the image size and display it
  surface.setSize(img.width, img.height);
  image(img, 0, 0);

  // --- 2) Simple processing: color inversion ---
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    int r = 255 - int(red(c));
    int g = 255 - int(green(c));
    int b = 255 - int(blue(c));
    img.pixels[i] = color(r, g, b);
  }
  img.updatePixels();

  // Show the processed image
  image(img, 0, 0);

  // --- 3) Save as BMP file ---
  // Saved as "output.bmp" in the sketch folder
  img.save("output.bmp");

  println("Saved: output.bmp");
}

void draw() {
  // nothing to do here
}
