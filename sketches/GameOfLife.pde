//by Creatorbyte

int[][] cells;//make an array of the states since they are the most important value. there is no need for arrayLists or object classs
int size = 2;
int rows; 
int cols;

void setup() {
    size(1000, 1000);
   
   rows = int(width/size)-1;
   cols = int(height/size)-1;
   cells = new int[rows][cols];
   
   
   for(int i=0;i<rows; i++){
      for(int j=0;j<cols;j++){
        cells[i][j] = floor(random(2));
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

void draw() {
   background(0,50,0);
   noStroke();
   
   for(int i=0;i<rows; i++){
      for(int j=0; j<cols;j++){
        if(cells[i][j]==1){
          fill(0,255,0);
          rect((i*size),(j*size), size, size);
        }
      }
    }
   int[][] next = new int[cols][rows];

  
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

