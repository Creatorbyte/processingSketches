cell[][] cells;
int size = 5;
int rows; 
int cols;

void setup() {
   //initialize arraylist
   size(1000, 1000);
   
   rows = int(width/size)-1;
   cols = int(height/size)-1;
   cells = new cell[rows][cols];
   noStroke();
   for(int i=0;i<rows; i++){
      for(int j=0;j<cols;j++){
        //create a new brick
        int st = floor(random(2));
        cells[i][j] = new cell(i*size, j*size, st, i, j);
      }
   }
   
}
void draw() {
   background(0);
   
   for(int i=0;i<rows; i++){
      for(int j=0; j<cols;j++){
        cell c = cells[i][j];
        c.rend();
        c.update();
      }
    }
   
}
class cell{
   float xpos;
   float ypos;
   int state;
   int ix = 0;
   int jx = 0;
   cell me = this;
   int neighbors = 0;
   
   cell(int x,int y,int s, int i, int j){
      xpos = x;
      ypos = y;
      state = s;
      ix = i;
      jx = j;
   }
   
   int getState(){
      return this.state;
   }
   
   int checkNeighbors() {
      int sum = 0;
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          sum += cells[(ix + i + cols) % cols][(jx + j + rows) % rows].getState();
        }
      }
      sum -= cells[ix][jx].getState();//subtact this cell since we dont count as a neighbor
      return sum;
 }
   
   void update(){
     
     int NN = checkNeighbors();
     
     if (state == 0 && NN == 3) {
        cells[ix][jx].state = 1;
      } else if (state == 1 && (NN < 2 || NN > 3)) {
        cells[ix][jx].state = 0;
      } else {
        cells[ix][jx].state = cells[ix][jx].state;
      return;
      }
   }
   
   void rend(){
      
     if(state < 1){
      fill(0,155,0);
     } else {
       fill(0,255,0);
     }
       rect(xpos,ypos,size,size);
   }
   
}
