/**
made by creatorbyte
https://github.com/Creatorbyte
*/

int particles=2048;

int cloudSpreadRadius= 240;

double[] x = new int[particles];

double[] y = new int[particles];

double[] z = new int[particles];

int j=0;

void setup() {

   size(screen.width, screen.height, P3D);

   background(0);

   //noFill();

   stroke(255);

   strokeWeight(3);

   colorMode(HSB);

   

}

void draw() {

   background(0);  

   translate(width/2, height/2);

   rotateY(frameCount / 100.0);

   rotateX(frameCount*0.01);

   scale(mouseY/100);

   

   double p = j*(PI/1024);//j*(PI/1024);

   double t = 4*PI*cos(j*(TWO_PI/1024));

   double r =50;/**random(

   -cloudSpreadRadius,

   cloudSpreadRadius);

   */

   double xm= r*sin(p)*cos(t);

   double ym = r*sin(p)*sin(t);

   double zm =r*cos(p);

   

   x[j] = (xm);

   y[j] = (ym);

   z[j] = (zm);

   //}

   if(j<particles){

      j = j+1;

   }

   //box(300);

   noFill();

   //stroke(j*(255/particles),255,255);

   beginShape();

   for(int i = particles; i>=0; i--) {

      //strokeWeight(2);

      stroke(i*(255/(particles)),255,255);

//fill(i*(255/particles),255,255);

      vertex(x[i], y[i], z[i]);

   }

   endShape();

}
