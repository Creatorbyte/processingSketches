/**
made by creatorbyte
https://github.com/Creatorbyte
*/

ArrayList<vertex> points;


ArrayList<vertex> points2;



int prX,prY;

int prX2,prY2;

int targetIndex=200;

int numVertices;

int inc = 1;

int rad = 100;

int rad2 = 50;


void setup() {

   size(screen.width, screen.height,P2D);

   noStroke();

   colorMode(HSB);

   prX=prY=0;

   prX2=prY2=0;

   points = new ArrayList<vertex>;

   

   points2 = new ArrayList<vertex>;

   

   numVertices = 50;

   for(int i = 0;i<numVertices;i++){

      

      points.add(new vertex(

      (width/2),

      (height/2),

      1,10,rad,i));

      

      points2.add(new vertex(

      (width/2),

      (height/2),

      -1,10,rad2,i));

      

   }

   

}


void draw() {

   

   background(0,0,0);

   

   

   for (int i = points.size()-1; i >= 0; i--) {

      vertex p = points.get(i);

      //if(i<points.size()){

         line(prX, prY, p.xPos, p.yPos)

         //}

         prX=points.get(i).xPos;

         prY=points.get(i).yPos;

         p.update();

         p.display();

         

      }

      

      for (int i = points2.size()-1; i >= 0; i--) {

         vertex p = points2.get(i);

         //if(i<points.size()){

            line(prX2, prY2, p.xPos, p.yPos)

            //}

            prX2=points2.get(i).xPos;

            prY2=points2.get(i).yPos;

            p.update();

            p.display();

            

         }

         

         

         if(targetIndex>=210){

            //targetIndex=0;

            inc = 0;

         }

         if(targetIndex<=140){

            

            inc = 1;

            

         }

         

         if(inc == 1){

            

            targetIndex+=0.25;

         }

         else

         {

            targetIndex-=0.25;

         }

         

         

      }

      

      class vertex{

         float xPos;

         float yPos;

         //float speed;

         float freq;

         float amp;

         int radius;

         int index;

         float r;

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

            

            r = radius+(amp*sin((theta*freq)+index)); //random(80,120);

            

            float newX =(width/2) + (r*cos((TWO_PI/numVertices)*index));

            

            float newY = (height/2)+(r*sin((TWO_PI/numVertices)*index));

            

            yPos = newY;

            xPos = newX;

         }

         

         void display(){

            //nostroke();

            //float factor = yPos-200;

            strokeWeight(5);

            

            

            stroke(targetIndex,200,200);

            fill(targetIndex,200,200);;

            ellipse(xPos,yPos,1,1);

            

         }

         

      }
