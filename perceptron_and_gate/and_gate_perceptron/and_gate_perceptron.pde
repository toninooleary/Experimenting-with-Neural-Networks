Perceptron p;
Golden[] trainData = new Golden[4];

void setup(){
  size(800, 800);
  background(255);
  p = new Perceptron();
  
  trainData[0] = new Golden(0, 0, 0);
  trainData[1] = new Golden(0, 1, 0);
  trainData[2] = new Golden(1, 0, 0);
  trainData[3] = new Golden(1, 1, 1);
  
}

void draw(){
  for (int i = 0; i < trainData.length; i++){
    p.train(trainData[i]);
    
    if (p.guess(trainData[i]) == trainData[i].getLabel()){
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(random(width), random(height), 20, 20);
  }
  
}
