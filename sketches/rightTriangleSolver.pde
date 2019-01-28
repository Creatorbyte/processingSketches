/** 
triangle calculator designed and programmed by creatorbyte. please note that this calculator auto-rounds the answers.
https://github.com/Creatorbyte/
*/


//############################

/** enter the lengths of two sides of a right triangle.*/


PFont f;


float sideA = 80;

//the red side



float sideB = 60;

//the blue side


//###########################






float sideC;

float angleA, angleB, angleC;

PVector AB,BC,CA;


void setup() {

   size(screen.width, screen.height);

   f=loadFont("mono",25);

   textSize(20);

   textFont(f);

   sideC = round( sqrt((sideA*sideA)+(sideB*sideB)));

   

   angleA = round( acos(sideB/sideC)*(180/PI));

   angleB = round( acos(sideA/sideC)*(180/PI));

   

   

}




void draw() {

   

   background(0);

   strokeWeight(4);

   stroke(255);

   

   text("Right Triangle Calculator",width/2-5*"Right Triangle Calculator".length(),height/2-250);

   

   boolean bo =false;

   

   if(bo ==true){

      float m = millis()/100;

      sideA = 150+(20*cos(m));

      sideB = 150-(20*cos(m*2));

      sideC = sqrt((sideA*sideA)+(sideB*sideB));

      angleA = round( acos(sideB/sideC)*(180/PI));

      angleB = round( acos(sideA/sideC)*(180/PI));

      

   }

   

   A = new PVector(sideA,0);

   B = new PVector(0,sideB);

   C = new PVector.sub(A,B);

   

   int x = 50;

   int y = 410;

   

   text(""+sideA, x+(A.x/2),(30)+y);

   stroke(255,0,0);

   line(x,y,x+A.x,y+A.y);

   

   int xb = x + A.x;

   int yb = y + A.y;

   

   text(""+sideB, xb+20,yb-(B.y/2));

   stroke(0,0,255);

   line(xb,yb,xb+B.x,yb-B.y);

   

   int xc;

   int yc;

   

   text(""+sideC, (A.x/2)+30,y-(B.y/2)-30);

   stroke(0,255,0);

   line(x,y,x+C.x,y+C.y);

   

   

   

   text("θ", xb,y-B.y-10);

   text("ϕ", x-20, y-A.y+20);

   

   int wb= 12;

   stroke(255);

   noFill();

   rect(x+A.x-wb,y-wb,wb,wb);

   

   text("θ: "+angleB+"°", width/2-50,height-150);

   text("ϕ: "+angleA+"°", width/2-50,height-180);

   

}
