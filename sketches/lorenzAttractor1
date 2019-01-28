/**
made by creatorbyte
https://github.com/Creatorbyte
*/

double x = 0.01; 

double y = 0;

double z = 0; 

double dx;

double dy;

double dz;

double a = 20.0;

double b = 28.0;

double c = (8.0 / 3.0);

double dt = 0.01; 

int i;


void setup() {

   size(screen.width, screen.height,P3D);

   background(0);

   colorMode(HSB);

}


void draw() {

   /**

   x=0;

   y=0;

   z=0;

*/

   background(0);

   translate(width/2, height/2);

   rotateY(PI/3 + mouseX/float(height) * PI*4);

   rotateX(PI/3 + mouseY/float(height) * PI*4);

   strokeWeight(2);

   //stroke(255);

   fill(255);

   scale(3);

   beginShape();

   noFill();

   int h=255;

   for(i=0;i<=1000;i++){

      

      dx= dt*(a*(y - x));

      dy= dt*((x*(b-z)-y));

      dz= dt*(x*y-c*z);

      

      x+=dx;

      y+=dy;

      z+=dz;

      stroke(h,255,255);

      vertex(x,y,z);

      strokeWeight(3);

      //point(x,y,z);

      h--;

      if(h<=0){

         h=255;

      }

   }

   endShape();

}
