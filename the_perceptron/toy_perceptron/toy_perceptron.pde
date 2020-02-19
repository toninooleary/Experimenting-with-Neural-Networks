Perceptron p;
Point[] points = new Point[100];
int pointIndex = 0;
float prevStroke = 0;

void setup() {
  size(500, 500);
  background(255);
  p = new Perceptron();
  
  for (int i = 0; i < points.length; i++){
    points[i] = new Point();
    points[i].show();
  }
  
  // displays our perceptrons guess (untrained)
  float[] inputs = {-1, 0.5};
  int guess = p.guess(inputs);
  println(guess);
}

void draw(){
  stroke(0);
  strokeWeight(1);
  line(0, 0, width, height);

  //trains the perceptron one point at a time
  Point pt = points[pointIndex];
  float[] inputs = {pt.x, pt.y};
  int target = pt.label;
  int guess = p.guess(inputs);
  p.train(inputs, target);
    
  //colours the points green or red depending on if they have been classified correctly or incorrectly
  if (guess == target) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  noStroke();
  ellipse(pt.x, pt.y, 8, 8);
  
  // Deals with incrementing and resetting the pointIndex. The point index refers to the current point being trained.
  pointIndex++;
  if (pointIndex >= points.length){
    pointIndex = 0;
  }
  
}

void mouseDragged(){
  float[] inputs = {mouseX, mouseY};
  int guess = p.guess(inputs);
  
  if (guess == 1) {
    stroke(255, 117, 26);
  } else {
    stroke(26, 117, 255);
  }
  
  // uses linear interpolation to smooth between thickness increase and decrease of the line.
  prevStroke = lerp(prevStroke, abs(mouseX-pmouseX + mouseY-pmouseY), 0.15);
  strokeWeight(prevStroke);
  //pmouse represents the mouse's previous location.
  line(pmouseX, pmouseY, mouseX, mouseY); 
}
//// trains all points at one
//void mousePressed(){
//  //goes through every point training them
//  for (Point pt: points) {
//    float[] inputs = {pt.x, pt.y};
//    int target = pt.label;
//    int guess = p.guess(inputs);
//    p.train(inputs, target);
    
//    //colours the points green or red depending on if they have been classified correctly or incorrectly
//    if (guess == target) {
//      fill(0, 255, 0);
//    } else {
//      fill(255, 0, 0);
//    }
//    noStroke();
//    ellipse(pt.x, pt.y, 8, 8);
//  }
//}
