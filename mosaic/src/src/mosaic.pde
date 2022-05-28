
// Global Varialbes

int width = 500;
int height = 500;
//int[] cellSizes = {10, 20, 25, 50, 100};
float cellSize  = 20;
int gridQuantityX = floor(width/cellSize);
int gridQuantityY = floor(height/cellSize);
float myScale = cellSize;
int nColor = 4;
int[][] colors = new int[nColor][3];

int[][] preset_rectangle_points = {
  {floor(gridQuantityX/2)+2, floor(gridQuantityY/2)-3},
  {floor(gridQuantityX/2)-2, floor(gridQuantityY/2)-3},
  {floor(gridQuantityX/2)-1, floor(gridQuantityY/2)+2},
  {floor(gridQuantityX/2), floor(gridQuantityY/2)+2},
  {floor(gridQuantityX/2)+1, floor(gridQuantityY/2)+2},
};
int[][] preset_arc_0_90_points = {
   {floor(gridQuantityX/2)+2,floor(gridQuantityY/2)},
   {floor(gridQuantityX/2)-1,floor(gridQuantityY/2)},
   {floor(gridQuantityX/2)+2, floor(gridQuantityY/2)+2}
};
int[][] preset_arc_90_180_points = {
  {floor(gridQuantityX/2)+1,floor(gridQuantityY/2)},
  {floor(gridQuantityX/2)-2,floor(gridQuantityY/2)},
  {floor(gridQuantityX/2)-2, floor(gridQuantityY/2)+2},

};
int[][] preset_arc_180_270_points = {
  {floor(gridQuantityX/2)+1 ,floor(gridQuantityY/2)-3},
  {floor(gridQuantityX/2)-3 ,floor(gridQuantityY/2)-3},
  {floor(gridQuantityX/2)+1,floor(gridQuantityY/2)-1},
};
int[][] preset_arc_270_360_points = {
  {floor(gridQuantityX/2)+3,floor(gridQuantityY/2)-3}, 
  {floor(gridQuantityX/2)-1,floor(gridQuantityY/2)-3},
  {floor(gridQuantityX/2)-1,floor(gridQuantityY/2)-1},
};

int[] presetColor = {int(random(0, 256)),int(random(0, 256)),int(random(0, 256))};

void settings(){
  size(width, height);
}

void setup(){
  colorMode(HSB);
  background(0);
  
  // Selecting color
  for(int i=0; i<nColor; i++){
    colors[i][0] = int(random(0, 256));
    colors[i][1] = int(random(0, 256));
    colors[i][2] = int(random(0, 256));
  }
  
  // Draw by a pixel
  for(int x=0; x<gridQuantityX; x++) {
    for(int y=0; y<gridQuantityY; y++){
      
      // fill color
      int randomNumber = int(random(0,nColor));
      fill(colors[randomNumber][0],colors[randomNumber][1],colors[randomNumber][2]);
      noStroke();
      rect( x * myScale, y * myScale, cellSize, cellSize);
      
        
      //draw a shape
      int randomShapeType = int(random(0, 3));
       
      if(randomShapeType == 0){ // rectangle
        continue;
      } else if(randomShapeType == 1){ // triangle
        fill(colors[int(random(0,nColor))][0],colors[int(random(0,nColor))][1],colors[int(random(0,nColor))][2]);
        noStroke();
         
        int randomTriangleType = int(random(0,2));
        if(randomTriangleType == 0) { // default 
          triangle(
            x * myScale, y * myScale,
            x * myScale + cellSize, y * myScale + cellSize,
            x * myScale, y * myScale + cellSize
          );
        } else { // upside-down
          triangle(
            x * myScale, y * myScale,
            x * myScale + cellSize, y * myScale,
            x * myScale, y * myScale + cellSize
          );
        }
      } else if(randomShapeType == 2){ // fan
        fill(colors[int(random(0,nColor))][0],colors[int(random(0,nColor))][1],colors[int(random(0,nColor))][2]);
        noStroke();
        int randomFanType = int(random(0,2));
        if(randomFanType == 0){ // default
          arc(x * myScale, y * myScale, myScale*2, myScale*2, radians(0), radians(90));
        } else { // upside-down
          arc(x * myScale + myScale, y * myScale + myScale , myScale*2, myScale*2, radians(180), radians(270));
        }
      }
    }
  }
  
  //drawPresetEye();
  

  PImage cap = get(0, 0, width, height);
  cap.save("mosaic/mosic_no_eyes/screen-" + str(year())+str(month())+str(day()) + str(random(0,1000)) + ".png");
}


boolean isPresetPoint(int x, int y, int[][] presetPoints, int length) {
  boolean is_preset_point = false;
  for(int i=0; i<length; i++){
    int preset_rectangle_point_x = presetPoints[i][0];
    int preset_rectangle_point_y = presetPoints[i][1];
    
    if(x == preset_rectangle_point_x && y == preset_rectangle_point_y){
       is_preset_point = true;
    }
  }
  return is_preset_point;
}

void drawPresetEye() {  
  fill(0,0,0);
  beginShape(); 
  int begin_x_right = 275;
  int begin_y_right = 200;
  vertex( begin_x_right, begin_y_right );
  bezierVertex( begin_x_right+25, begin_y_right-27, begin_x_right+50, begin_y_right-10, begin_x_right+75, begin_y_right );
  bezierVertex( begin_x_right+50, begin_y_right+15, begin_x_right+25, begin_y_right+27, begin_x_right, begin_y_right );
  endShape();
  
  fill(0,0,0 );
  beginShape(); 
  int begin_x_left = 175;
  int begin_y_left = 200;
  vertex( begin_x_left, begin_y_left );
  bezierVertex( begin_x_left+25, begin_y_left-10, begin_x_left+50, begin_y_left-27, begin_x_left+75, begin_y_left );
  bezierVertex( begin_x_left+50, begin_y_left+27, begin_x_left+25, begin_y_left+15, begin_x_left, begin_y_left );
  endShape();
}
