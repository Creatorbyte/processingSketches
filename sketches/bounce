/**
made by creatorbyte
https://github.com/Creatorbyte
*/

ball B;

int count=0;

void setup() {

   size(screen.width, screen.height,P3D);

   

   B = new ball(width/2,height/2, 50, 10);

   

}


void draw() {

   background(0);

   fill(255);

   //rect(0,0,width,600); collision area

   

   B.update();

   B.draw();

   

}


class ball{

   float Ypos=0;

   float Xpos=0;

   int size=0;

   float speedX;

   float speedY;

   float Xdir=1;

   float Ydir=1;

   float gravity = 0.2;

   float damping = 0.9;

   

   ball(x,y,sz,spd){

      Ypos=y;

      Xpos=x;

      size=sz;

      speedX=speedY=spd;

   }

   

   void update(){

      

      Ypos=Ypos+speedY;

      Xpos=Xpos+speedX;

      

      //assing the velocity in helps make the collisions more reliable

      if(Xpos+speedX-(size/2)<=0 || Xpos+(size/2)+speedX>=width){

         speedX=speedX*(-1)*damping;

      }

      

      if(Ypos+speedY-(size/2)<=0||Ypos+(size/2)+speedY>=600){

         speedY=speedY*(-1)*damping;

         

      } else{

         speedY+=0.2//gravity

      }

      

      if(sqrt(speedY*speedY)<=0.05){

         count+=1;

         if(count >=10){

            speedY = random(15);

            speedX = random(15);

            count=0;

         }

      }

      

      

   }

   

   void draw(){

      

      fill(0,0,100);

      

      translate(Xpos,Ypos,-50);

      stroke(0,0,255);

      strokeWeight(3);

      //noFill();


      box(50);

      

      //ellipse(Xpos,Ypos,size,size);

      

      

   }

}
