//by Creatorbyte

int[][] cells;//make an array of the states since they are the most important value. there is no need for arrayLists or object classs
int size = 12;
int rows; 
int cols;
boolean pause = false;

void setup() {
   size(displayWidth, displayWidth);
   //fullScreen();
   rows = int(width/size)+2;
   cols = int(height/size)+2;
   cells = new int[rows][cols];
   
   
   for(int i=0;i<rows; i++){
      for(int j=0;j<cols;j++){
       // cells[i][j] = floor(random(2));
      }
   }
}

int checkNeighbors(int [][]grid, int x, int y) {
  int sum = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      int col = (x + i + cols) % cols;
      int row = (y + j + rows) % rows;
      sum += grid[col][row];
    }
  }
  sum -= grid[x][y];
  return sum;
}

void mouseDragged(){

  int row = floor(mouseX/size);
  int col = floor(mouseY/size);
  try{
    if(cells[row][col] != 1){
    cells[row][col] = 1;
    
    } else {
    cells[row][col] =0;
    }
  } catch(Exception e) {
    print("Tried to place cell out of bounds!");
  }
}

void mousePressed(){

  int row = int(mouseX/size);
  int col = int(mouseY/size);
   
  if(cells[row][col] != 1){
  cells[row][col] = 1;
  
  } else {
  cells[row][col] =0;
  }
}

void keyPressed(){
    if (key == 'R' || key == 'r') {
       for(int i=0;i<rows; i++){
      for(int j=0;j<cols;j++){
        cells[i][j] = 0;
      }
     }
    }else if (key == 'f' || key == 'F') {
       for(int i=0;i<rows; i++){
      for(int j=0;j<cols;j++){
        cells[i][j] = floor(random(2));
      }
   }}
    
   if (pause == false && (key == 'P' || key == 'p')) {
      pause = true;
    } else if (pause == true){
    pause = false;
    }
}

void draw() {
  
   background(218.0, 209.0, 255);
   noStroke();
   
   for(int i=0;i<rows; i++){
      for(int j=0; j<cols;j++){
        if(cells[i][j]==1){
          fill(204.0, 250, 223);
          rect((i*size),(j*size), size, size);
        }
      }
    }
   int[][] next = new int[cols][rows];

  if(pause != true){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int state = cells[i][j];
      // Count living neighbors
      int sum = 0;
      int neighbors = checkNeighbors(cells, i, j);

      if (state == 0 && neighbors == 3) {
        next[i][j] = 1;
      } else if (state == 1 && (neighbors < 2 || neighbors > 3)) {
        next[i][j] = 0;
      } else {
        next[i][j] = state;
      }

    }
  }
  cells = next;
  }
}
