/**
made by creatorbyte
https://github.com/Creatorbyte

*/
ArrayList<vertex> points;

int prX,prY;

float rotx;

float roty;

vertex head;

void setup() {

   size(screen.width, screen.height,P3D);

   points = new ArrayList<vertex>();

   prX=prY=0;

   

   //noStroke();

   //noFill();

   

   

   //this is where the armature

   //is created by calling the

   //vertex class

   

   

   // X, Y, Z, Size, Parent

   

   vertex o1 = new vertex(0,100,0,5);

   points.add(o1);

   

   vertex oy = new vertex(0,-30,0,5,o1).setColor(color(0,255,0));

   points.add(oy);

   

   vertex oz = new vertex(0,0,-30,5,o1).setColor(color(0,0,255));

   points.add(oz);

   

   vertex ox = new vertex(30,0,0,5,o1).setColor(color(255,0,0));

   points.add(ox);

   

   

   head = new vertex(0,-100,0,17);

   points.add(head);

   

   

   vertex neck = new vertex(0,20,0,4,head);

   points.add(neck);

   

   

   vertex backHigh = new vertex(0,15,0,4,neck);

   points.add(backHigh);

   

   

   vertex backLow = new vertex(0,25,0,4,backHigh);

   points.add(backLow);

   

   

   vertex hip = new vertex(0,0,0,4,backLow);

   points.add(hip);

   

   

   vertex lHip = new vertex(-6,5,0,4,hip);

   points.add(lHip);

   

   

   vertex rHip = new vertex(6,5,0,4,hip);

   points.add(rHip);

   

   

   vertex lShoulder = new vertex(-20,-1,0,4,neck).setColor(color(0,0,255));

   points.add(lShoulder);

   

   

   vertex lArm = new vertex(-4,25,0,4,lShoulder);

   points.add(lArm);

   

   

   vertex lHand = new vertex(-3,25,-10,10,lArm).setColor(color(0,0,255));;

   points.add(lHand);

   

   

   vertex rShoulder = new vertex(20,-1,0,4,neck).setColor(color(255,0,0));

   points.add(rShoulder);

   

   

   vertex rArm = new vertex(4,25,0,4,rShoulder);

   points.add(rArm);

   

   

   vertex rHand = new vertex(3,25,-10,10,rArm).setColor(color(255,0,0));

   points.add(rHand);

   

   

   vertex rLeg = new vertex(2,25,-3,4,rHip);

   points.add(rLeg);

   

   

   vertex rFoot = new vertex(2,25,3,10,rLeg).setColor(color(255,0,0));

   points.add(rFoot);

   

   

   vertex lLeg = new vertex(-2,25,-3,4,lHip);

   points.add(lLeg);

   

   

   vertex lFoot = new vertex(-2,25,3,10,lLeg).setColor(color(0,0,255));

   points.add(lFoot);

   

   

   

   //(centaur stuff)---------------------

   //

   vertex hip2 = new vertex(0,0,70,4,hip);

   points.add(hip2);

   

   vertex lHip2 = new vertex(-6,5,0,4,hip2);

   points.add(lHip2);

   

   vertex rHip2 = new vertex(6,5,0,4,hip2);

   points.add(rHip2);

   

   vertex rLeg2 = new vertex(2,25,3,4,rHip2);

   points.add(rLeg2);

   

   vertex lLeg2 = new vertex(-2,25,3,4,lHip2);

   points.add(lLeg2);

   

   vertex rFoot2 = new vertex(2,25,-3,4,rLeg2);

   points.add(rFoot2);

   

   vertex lFoot2 = new vertex(-2,25,-3,4,lLeg2);

   points.add(lFoot2);

   

   

   vertex tail = new vertex(0,5,15,4,hip2);

   points.add(tail);

   

   vertex tail2 = new vertex(0,20,7,4,tail);

   points.add(tail2);

   

   

   

   //(end horse half)---------------------

   

   

}

void draw() {

   background(0);

   

   // makes all of the drawn objects rotate about the center of the display window

   translate(width/2, height/2);

   //rotateY(frameCount / 80.0);

   rotateY(PI/3 + mouseY/float(height) * PI*4);

   

   // finds all of the joins and connects them together in the correct order

   

   for (int i = points.size()-1; i >= 0; i--) {

      vertex p = points.get(i);

      

      // finds the head and places a sphere at its location

      if(p== points.get(0)){

         

         pushMatrix();

         //print(p.PointColor+"\n");

         fill(p.PointColor);

         //noStroke();

         stroke(p.PointColor);

         //sphere(7);

         popMatrix();

         

      }

      

      // draws the lines between the joints

      strokeWeight(5);

      stroke(p.PointColor);

      line(p.parentX,p.parentY,p.parentZ,p.xPos, p.yPos,p.zPos);

      

      // calls the update and draw functions from the points

      p.update();

      p.display();

      

   }

   

   

   

}

class vertex{

   float xPos;

   float yPos;

   float zPos;

   float parentX;

   float parentY;

   float parentZ;

   int size;

   color PointColor = color(255);

   

   //* X, Y, Z, Size, color

   vertex(float xP, float yP, float zP, int s){

      

      //PointColor = color(255);

      xPos = xP;

      yPos = yP;

      zPos = zP;

      parentX = xP;

      parentY = yP;

      parentZ = zP;

      size = s;

      

   }

   

   // X, Y, Z, Size, Color, Parent 

   vertex(float xP, float yP, float zP,int s,vertex p){

      // PointColor = color(255);

      xPos = p.xPos + (xP);

      yPos = p.yPos + (yP);

      zPos = p.zPos + (zP);

      parentX = p.xPos;

      parentY = p.yPos;

      parentZ = p.zPos;

      size=s;

   }

   

   vertex setColor(color c)

   {

      this.PointColor = c;

      return this;

   }

   

   void update(){

      //yPos=yPos+(speed*0.1);

      

      //translate(width/2, height/2);

      rotateY(roty);

      rotateX(rotx);

      

      

   }

   

   void display(){

      //nostroke();

      

      stroke(this.PointColor);

      fill(this.PointColor);

      

      pushMatrix();

      strokeWeight(size);

      point(xPos,yPos,zPos);

      popMatrix();

      

   }

   

}
