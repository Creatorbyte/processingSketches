/**
made by creatorbyte
https://github.com/Creatorbyte
*/

branch[] branches;

int num;

static int count;

void setup() {

  // size(displayWidth, displayHeight);
   fullScreen();

   background(20);

   

   ellipseMode(CENTER);

   stroke(255);

   smooth();

   num = 5;

   count = 0;

   //paths = new pathfinder[num];

   //for(int i = 0; i < num; i++) paths[i] = new pathfinder();

}


void draw() {

   //  println(count);

   //  println(paths.length);

   ellipseMode(CENTER);

   if(branches!=null){

      for (int i = 0; i < branches.length; i++) {

         PVector pos = branches[i].pos;

         PVector prevPos = branches[i].prevPos;

         strokeWeight(branches[i].branchDiameter);

         stroke(255);

         if(branches[i].finished != true){

            line(prevPos.x, prevPos.y, pos.x, pos.y);

            

            strokeWeight(branches[i].branchDiameter*10);

          

stroke(255,255,255,20);

            line(prevPos.x, prevPos.y, pos.x, pos.y);

            branches[i].update();

         }

      }

      //noStroke();

      stroke(255);

      strokeWeight(2);

      fill(10,10,10,20);

      rect(-25,-25,width+50,height+50);

      

   }

   //saveFrame("frames/"+frame+".png");

   //frame++;

}

void keyPressed() {

   background(20);
   num = (int)random(1,3);

   //fill(255);

   //rect(0,450,width,height/2);

   count = 0;

   branches = new branch[num];

   for(int i = 0; i < num; i++) branches[i] = new branch();

}


class branch{

   PVector pos;

   PVector prevPos;

   PVector growDir;

   boolean finished;

   float branchDiameter;

   

   branch(){

      pos = new PVector(width/2,0);

      prevPos = new PVector(pos.x,pos.y);

      growDir = new PVector(0,12);

      branchDiameter = random(10,12); //should probably be random

      finished=false;

      

   }

   branch(branch parent){

      

      pos = parent.pos.get();

      prevPos = parent.prevPos.get();

      growDir = parent.growDir.get();

      branchDiameter = parent.branchDiameter* 0.5; // branch reduction factor. values between 0.5-0.62 are best

      finished = parent.finished;

      parent.branchDiameter = branchDiameter;

   }

   

   void update()

   {

      

      prevPos.set(pos.x,pos.y);

      

      if (branchDiameter > 0.55) {

         count ++;

         PVector noise = new PVector(random(-1, 1), random(-1, 1));

         

         growDir.normalize();

         if(branchDiameter>8){

            //noise.mult(0.5)

         }else{

            noise.mult(random(0.8,1)); //branch bend scaler

         }

         growDir.add(new PVector(0,random(0.5,1)));

         growDir.mult(0.9); //branch length scaler

         growDir.add(noise);

         growDir.mult(random(8, 12)); //random branch length

         pos.add(growDir);

         if (random(0, 1) < 0.12) { // control length

         branches = (branch[]) append(branches, new branch(this));

         

      }

   } else {

      

      if(!finished) {

         
         finished = true;

         //noStroke();

         

         //stroke(255); //branch color

      }

   }

   

}

}
