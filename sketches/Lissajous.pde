/**
made by creatorbyte
https://github.com/Creatorbyte
*/

ArrayList<vertex> points;

vertex p2;

vertex p;


int prX,prY;


void setup() {

   size(screen.width, screen.height,P2D);

   noStroke();

   prX=prY=0;

   

   points = new ArrayList<vertex>;

   

   int numV = 100;

   for(int i = 0;i<numV;i++){

      points.add(new vertex((width/2),(height/2),0.5,numV/2,i));

      

   }

}


void draw() {

   background(255);

   //stroke(0,255,255);

   for (int i = points.size()-1; i >= 0; i--) {

      p = points.get(i);

      if(i>=1){

         p2 = points.get(i-1);

      }else{

         p2 = points.get(points.size()-1);

         

      }

      

      line(p2.xPos+p2.xOff, p2.yPos+p2.yOff, p.xPos+p.xOff, p.yPos+p.yOff);

      prX=points.get(i).xPos;

      prY=points.get(i).yPos;

      p.update();

      p.display();

      

   }

   

   

   

}




class vertex{

   float xPos;

   float yPos;

   float xOff, yOff;

   //float speed;

   float freq;

   float amp;

   int index;

   vertex(float xP, float yP,float f,float a,int i){

      

      xPos = xP;

      yPos = yP;

      freq = f;

      amp = a;

      index = i;

   }

   

   void update(){

      yPos=width/2;

      

      float m=millis();

      float theta = (m*0.001)*freq;

      xOff =100* sin(2*((theta+(index*(PI/amp)))));

      

      yOff = 100*sin(3*((theta+(index*(PI/amp))))); //+ocillateHeight*cos(theta*ocillateFreq);

      

      yPos = height/2;

   }

   

   void display(){

      //nostroke();

      if(index<1){

         strokeWeight(2);

         stroke(20);

         fill(20);

      } else {

         strokeWeight(2);

         stroke(20);

         fill(20);

      }

      ellipse(xPos+xOff,yPos+yOff,7,7);

   }

   

}
