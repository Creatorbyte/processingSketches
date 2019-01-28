/**
made for the weirdest holiday, by creatorbyte
https://github.com/Creatorbyte
*/


ArrayList<rain> drops;

float om = 0;

int spawnDel= 0.1;


 String first[]={

   'h','a','p','p','y',''

};

 String second[]={

   'h','a','l','l','o','w','e','e','n','!'

};



int offX[]={20,40,40,40,40,40};

int offX2[]={20,40,30,30,30,32,33,34,35,30};

float bump=2;

float coldir=1;

float hue = 0;

PFont font;


void setup() {

   size(screen.width, screen.height);

   textSize(64);

   colorMode(HSB);

   noStroke();

   font = loadFont("mono",48);

   drops = new ArrayList<rain>;

   

}


void draw() {

   float rand = random(-500,500);

   float rs = random(0,50);

   float m = millis()/1000;

   if((m - om)>spawnDel){

      drops.add(new rain((width/2)+rand,-100,20+rs));

      om = m;

   }

   

   //background(0,50,50);

   float rad = 10*cos(m)+20;

   fill(0,0,0,40);

   rect(-1,-1,width+2,height+2);

   fill(hue,255,255,5*(hue-10));

   stroke(hue,255,255,5*(hue-10));

   ellipse(width/2+10,height/2-10,rad,rad);

   

   for (int i = drops.size()-1; i >= 0; i--) {

      rain p = drops.get(i);

      p.update();

      p.display();

      if (p.isDead()) {

         drops.remove(i);

      }

   }

   m=millis();

   

   for(int i=0;i<first.length();i++){

      

      fill(hue+i,200,200,5*(hue-10));

      

      

      float offY = 60*cos((-m*0.0025)+i*0.8);

      

      float H = 60*sin((-m*0.0025)+i*0.8);

      

      textFont(font);

      

      text(first[i],(width/2)+(H),(height/2)+(offY));

      

   }

   

   for(i=0;i<second.length();i++){

      

      fill(hue+i,200,200,(5*(hue-10)));

      

      

      float offY = 120*cos((-m*0.00125)+i*0.5);

      

      float H = 120*sin((-m*0.00125)+i*0.5);

      textFont(font);

      

      text(second[i],(width/2)+(H),(height/2)+(offY));

      

   }

   

   if(hue>=50){

      coldir = 0;

   }

   else if(hue<=10){

      coldir = 1;

   }

   if(coldir== 1){

      hue+=0.125;

   }

   else

   {

      hue-=0.125;

   }

   

   

   

}


class rain{

   float xPos;

   float yPos;

   float speed;

   float lifespan = 25;

   rain(float xP, float yP,float sp){

      speed = sp;

      xPos = xP;

      yPos = yP;

      

   }

   

   void update(){

      yPos=yPos+(speed*0.1);

      lifespan -= 0.05;

      

   }

   

   // Is the particle still useful?

   boolean isDead() {

      if (lifespan < 0.0) {

         return true;

      } else {

         return false;

      }

   }

   

   

   void display(){

      //nostroke();

      stroke(180+(hue/2),255,255,3*lifespan);

      fill(180+(hue/2),255,255,3*lifespan);

      rect(xPos,yPos,5,5);

      

   }

   

}
