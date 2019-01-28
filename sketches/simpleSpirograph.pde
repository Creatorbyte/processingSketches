/**
made by creatorbyte
https://github.com/Creatorbyte
*/

float x,y,nx,ny,ox,oy;

int t = 0;


void setup() {

   size(screen.width, screen.height);

   x=0;

   y=0;

   nx=0;

   ny=0;

   ox=0;

   oy=0;

}


void draw() {

   //background(0,0,255);

   f=50;

   r=100*cos(t/(0.625*f));

   

   nx=r*cos(t/(f));

   ny=r*sin(t/(f));

   x=nx;

   y=ny;

   

   stroke(255);

   strokeWeight(5);

   point((width/2)+x,(height/2)+y);


   t+=1;

}
