/**
made by creatobyte
https://github.com/Creatorbyte
*/


PFont f;

void setup() {

   size(screen.width, screen.height);

   textSize(1);

   f = loadFont("mono",25);

   textFont(f);

   /*

   ARRAY SORT

   This is a way that arrays can be sorted in only a few steps.

   */

}


void draw() {

   background(20);

   fill(0,255,0);

   

   int array[8] = {70,32,54,10,67,29,93,36},i,j,temp;

   int arrayLength = array.length();

   text("original",20,160);

   for(i=0; i<arrayLength;i++){

      

      text(" "+array[i]+",",20+(45*i),200);

   }

   for(i=0; i<arrayLength-1;i++){

      for(j=i+1; j<arrayLength;j++){

         if(array[j] < array[i]){

            temp = array[i];

            array[i] = array[j];

            array[j] = temp;

         }

      }

   }

   text("sorted",20,260);

   for(i=0; i<arrayLength;i++){

      

      text(" "+array[i]+",",20+(45*i),300);

   }

   

   

}
