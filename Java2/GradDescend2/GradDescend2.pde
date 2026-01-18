void setup() {
  float psi = 0.1, eta = 0.001;
  float dx = 0.01, dy = 0.01;
  float xi1 = 2, yi1 = 2;
  float xi0 = 1, yi0 = 1;
  int iteration = 0;

  while (EE(xi0,yi0,xi1,yi1)>eta && iteration < 100) {
    xi0 = xi1;
    yi0 = yi1;
    xi1 -= psi*dfxydx(xi0, yi0, dx);
    yi1 -= psi*dfxydy(xi0, yi0, dy);
    println(xi0 +" "+ yi0 + " >> " + xi1 + " "+ yi1 );
    iteration++;
  }
  println( iteration + "-th  E = " + EE(xi0, yi0, xi1, yi1));
}
float fxy(float x, float y) {  return (x-3)*(x-3) + (y+2)*(y+2); }
float dfxydx(float x, float y, float dx) {  return (fxy(x+dx,y) - fxy(x,y))/dx; }
float dfxydy(float x, float y, float dy){  return (fxy(x, y+dy) - fxy(x, y)) / dy; }
float EE(float x0, float y0, float x1, float y1) {  return sqrt((x0-x1)*(x0 - x1)+ (y0 - y1)*(y0 - y1));}
