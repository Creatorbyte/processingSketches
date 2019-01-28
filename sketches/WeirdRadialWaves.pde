/**
made by creatorbyte
https://github.com/Creatorbyte
*/

ArrayList<vertex> points;

int prX,prY;


int targetIndex=0;

int numVertices;


int rad = 100;


void setup() {

   size(screen.width, screen.height,P2D);

   //noStroke();

   prX=prY=0;

   points = new ArrayList<vertex>;

   

   numVertices = 100;

   for(int i = 0;i<numVertices;i++){

      

      points.add(new vertex(

      (width/2),

      (height/2),

      0.01,15,rad,i));

      

   }

   

   

   

}


void draw() {

   

   background(0,0,0,20);

   

   

   for (int i = points.size()-1; i >= 0; i--) {

      vertex p = points.get(i);

      if(i<points.size()){

         line(prX, prY, p.xPos, p.yPos)

      }

      prX=points.get(i).xPos;

      prY=points.get(i).yPos;

      p.update();

      p.display();

      

   }

   

   if(targetIndex>=numVertices){

      targetIndex=0;

      

   }

   targetIndex++

   

   

}




class vertex{

   float xPos;

   float yPos;

   //float speed;

   float freq;

   float amp;

   int radius;

   int index;

   vertex(float xP, float yP,float f,float a,int rad,int i){

      

      xPos = xP;

      yPos = yP;

      freq = f;

      amp = a;

      index = i;

      radius = rad;

   }

   

   void update(){

      //yPos=yPos+(speed*0.1);

      

      float m=millis();

      float theta = (m/100);

      

      r = radius+(amp*sin((theta*freq)*index)); //should be + index

      

      float newX =(width/2) + (r*cos((TWO_PI/numVertices)*index)); // should be *index

      

      float newY = (height/2)+(r*sin((TWO_PI/numVertices)*index));

      

      yPos = newY;

      xPos = newX;

   }

   

   void display(){

      //nostroke();

      //float factor = yPos-200;

      strokeWeight(5);

      //stroke(120,120,255);

      if(index-targetIndex<=5&&index-targetIndex>=0){

         stroke(150,255,255);

         fill(150,255,255);

         //ellipse(xPos,yPos,0.1,0.1);

      }

      else 

      {

         stroke(0,50,100);

         fill(0,50,100);

         //ellipse(xPos,yPos,0.1,0.1);

         

      }

      

      

   }

   

}
