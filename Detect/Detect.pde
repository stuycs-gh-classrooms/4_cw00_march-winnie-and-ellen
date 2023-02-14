
int DOT_RESOLUTION = 20;
String PICFILE = "us-temps.png";

PImage art;
boolean showDots;
int resolution;
int threshold;

/*================================
 You should leave setup alone, with the exception
 of changing the size if not using the provided boats.jpg
 imgage.
 ================================*/
void setup() {
  size(770, 550);
  showDots = false;
  threshold = 200;
  resolution = DOT_RESOLUTION;
  art = loadImage(PICFILE);
  art.loadPixels();
}//setup

/*================================
 You should leave draw alone.
 ================================*/
void draw() {
  background(255);
  image(art, 0, 0);
  if (showDots) {
    dots(art, resolution);
  }
}//draw


/*================================
 keyPressed
 `r`: reset back to the original image.
 `g`: grayScale the image
 `e`: perform edge detection on the image (this will be added tomorrow)
 ================================*/
void keyPressed() {
  if (key == 'h') {
    art = highlightRed(art);
  } else if (key == 'd') {
    showDots = !showDots;
  }//edge detect
  else if (key == 'r') {
    art = loadImage(PICFILE);
    art.loadPixels();
  }//reset image
}//keyPressed


/*================================
 Returns the grayScale value of a color
 ================================*/
int calculateGray(color c) {
  int g = int((red(c) + green(c) + blue(c)))/3;
  return g;
}//calculateGray
/*================================
 Returns the correct pixel index for img based on the provided x and y values.
 ================================*/
int getIndexFromXY(int x, int y, PImage img) {
  return y * img.width + x;
}//getIndexFromXY

boolean redBig (color c) {
  if (red(c) > blue(c) && red(c) > green(c)) {
    return true;
  } else {
    return false;
  }
}

PImage highlightRed(PImage img) {
  PImage newImg = new PImage(img.width, img.height);
  for (int i=0; i<newImg.pixels.length; i++) {
    float p = calculateGray(img.pixels[i])/255;
    color c = #FF0000;
    int r = int(red(c)*p);
    int g = int(green(c)*p);
    int b = int(blue(c)*p);
    if (redBig(img.pixels[i])) {
      newImg.pixels[i] = color(r, g, b);
    } else {
      newImg.pixels[i] = color(calculateGray(img.pixels[i]));
    }
  }
  return newImg;
}//higlightRed



void dots(PImage img, int resolution) {
}//dots
