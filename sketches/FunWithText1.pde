/**
made by creatorbyte
https://github.com/Creatorbyte
*/


string letters[("color".length())]={

   'h','e','l','l','o','!'

};


int offX[10]={20,40,40,35,32,35};

float bump=2;

float coldir=1;

float hue = 0;

PFont font;


void setup() {

   size(screen.width, screen.height);

   textSize(50);

   colorMode(HSB);

   font = loadFont("mono",64);

   /*

   for(int i=0;i<letters.length();i++){

      if(letters[i]=='l' || letters[i] == 't'){

         offX[i]+=bump;

         bump=0;

      }else if(bump==0){

         bump=2;

         offX[i]-=bump;

      }

   }*/

}

   

   void draw() {

      background(0);

      

      float m = millis();

      

      int i;

      

      for(i=0;i<letters.length();i++){

         

         fill(hue+5*i,200,200);

         

         

         float offY = 10*cos((m*0.01)+i);

         

         textFont(font);

         

         text(letters[i],(100)+(offX[i]*i),(height/2)+(offY));


         

         

      }

      

      if(hue>=250){

         coldir = 0;

      }

      else if(hue<=-20){

         coldir = 1;

      }

      if(coldir== 1){

         hue+=0.5;

      }

      else

      {

         hue-=0.5;

      }

      

      

   }
