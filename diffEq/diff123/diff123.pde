float px, py, cx, cy, dx;
void setup() {
  size(800, 600);
  background(255);
  drawFx(-1, 4);
}
void drawFx(float x1, float x2) {
  line(0, height-200, width, height-200);
  line(200,0,200,height);
  dx = 1f/1024;
  px = x1;
  py = y(px);
  for (cx = x1; cx<x2; cx+=dx) {
    cy = y(cx);
    fline();
    px = cx;
    py = cy;
  }
}
float y(float x) {
  return (x-1)*(x-2)*(x-3);
}
void fline(){
  line(xx(px),yy(py),xx(cx),yy(cy));
}
float xx(float x0){   return (x0*100+200); }
float yy(float y0){   return height - (y0*100+200); }
