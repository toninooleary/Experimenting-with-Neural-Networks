class Point {
  float x;
  float y;
  int label;
  
  // constructor
  Point(){
    x = random(width);
    y = random(height);
    
    if (x > y){
      label = 1;
    } else {
      label = -1;
    }
  }
  
  // display the points onto the canvas
  void show() {
    stroke(0);
    if (label == 1){
      fill(255);
    } else {
      fill(0);
    }
    
    ellipse(x,y, 6, 6);   
  }
  
}
