/**
made by creatorbyte
https://github.com/Creatorbyte
*/


int particles=1000;

int cloudSpreadRadius= 240;

ArrayList<P3Vector> pos;

int[] x = new int[particles];

int[] y = new int[particles];

int[] z = new int[particles];

int i=0;

void setup() {

ArrayList<P3Vector> pos = new ArrayList();


   size(screen.width, screen.height, P3D);

   background(0);

   //noFill();

   stroke(255);

   strokeWeight(3);

   

   

   

   for(int i = 0; i<particles; i++) {

      float p = random(0,PI);

      float t = random(0,TWO_PI);

      float r =random(

      -cloudSpreadRadius,

      cloudSpreadRadius);

      

      float xm= r*sin(p)*cos(t);

      float ym = r*sin(p)*sin(t);

      float zm =r*cos(p);

      

      x[i] = int(xm);

      y[i] = int(ym);

      z[i] = int(zm);

   }

i=i+1;

}

void draw() {

   background(0);  

   translate(width/2, height/2);

  rotateY(frameCount / 100.0);

//rotateX(frameCount*0.01);

   

   //box(300);

   for(int i = 0; i<particles; i++) {

      //strokeWeight(2);

      point(x[i], y[i], z[i]);

   }

}
