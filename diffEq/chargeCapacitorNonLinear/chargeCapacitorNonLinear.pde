//------------------------------------------------------
// Nonlinear RC Circuit
// Euler Method
//
// dVc/dt = (Vs-Vc)/(R*C) * (1+alpha*(Vs-Vc)^2)
//
// Processing 4
//------------------------------------------------------

float Vs = 5.0;          // Supply voltage (V)
float R  = 1000.0;       // Resistance (ohms)
float C  = 100e-6;       // Capacitance (F)
float alpha = 0.10;      // Nonlinearity (1/V^2)

float dt = 0.0005;       // Time step (s)
float T  = 0.50;         // Total simulation time (s)

int steps;

float[] t;
float[] V;

void setup() {

  size(900,600);

  steps = int(T/dt);

  t = new float[steps+1];
  V = new float[steps+1];

  //---------------------------------
  // Initial condition
  //---------------------------------
  t[0] = 0.0;
  V[0] = 0.0;

  //---------------------------------
  // Euler Integration
  //---------------------------------

  for (int i=0; i<steps; i++) {
    float Vr = Vs - V[i];
    float dVdt = (Vr/(R*C)) * (1.0 + alpha*Vr*Vr);
    V[i+1] = V[i] + dt*dVdt;
    t[i+1] = t[i] + dt;
  }

  //---------------------------------
  // Print every 20 ms
  //---------------------------------

  println(" Time(s)\tVoltage(V)");

  for (int i=0; i<=steps; i+=40) {
    println(
      nf(t[i],1,3) + "\t\t" +
      nf(V[i],1,4)
    );
  }

  noLoop();
}

void draw() {

  background(255);

  drawAxes();
  drawVoltageCurve();
}

//--------------------------------------------

void drawAxes() {

  stroke(0);

  // x-axis
  line(70,height-60,width-40,height-60);

  // y-axis
  line(70,height-60,70,40);

  fill(0);

  text("Time (s)", width/2, height-20);

  pushMatrix();
  translate(20,height/2);
  rotate(-HALF_PI);
  text("Capacitor Voltage (V)",0,0);
  popMatrix();

  // x ticks
  for (float x=0; x<=T+1e-6; x+=0.1) {

    float sx = map(x,0,T,70,width-40);

    line(sx,height-60,sx,height-55);

    text(nf(x,1,1),sx-8,height-40);
  }

  // y ticks
  for (float y=0; y<=Vs+0.1; y+=1.0) {

    float sy = map(y,0,Vs,height-60,40);

    line(65,sy,70,sy);

    text(nf(y,1,0),40,sy+5);
  }
}

//--------------------------------------------

void drawVoltageCurve() {

  stroke(0,0,255);
  strokeWeight(2);

  noFill();

  beginShape();

  for (int i=0; i<=steps; i++) {

    float sx = map(t[i],0,T,70,width-40);
    float sy = map(V[i],0,Vs,height-60,40);

    vertex(sx,sy);
  }

  endShape();

  fill(0);
  text("Blue: Capacitor Voltage",120,40);
}
