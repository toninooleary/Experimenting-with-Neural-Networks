Perceptron p;
Switch[] switches = new Switch[2];
Golden[] trainData = new Golden[4];

void setup(){
  size(800, 800);
  p = new Perceptron();
  
  for (int i = 0; i < switches.length; i++){
    switches[i] = new Switch();
    switches[i].display();
  }
  
  trainData[0] = new Golden(0, 0, 0);
  trainData[1] = new Golden(0, 1, 0);
  trainData[2] = new Golden(1, 0, 0);
  trainData[3] = new Golden(1, 1, 0);
  
  noStroke();
  fill(150);
  ellipse(width/2, height/2, 20, 20);
  //println(p.guess(switches));
}

void draw(){
  //background(255);
  for (int i = 0; i < trainData.length; i++){
    p.train(trainData[i]);
    
    if (p.guess(trainData[i]) == trainData[i].getLabel()){
      fill(244,175,90);
    } else {
      fill(0);
    }
    noStroke();
    ellipse(random(width), random(height), 20, 20);
  }
  
}

//void mousePressed(){
//  for (int i = 0; i < trainData.length; i++){
//    if (p.guess == ){
//      if (p.guess(trainData) == trainData[i].getLabel()){
//        fill(244,175,90);
//      } else {
//        fill(255, 85);
//      }
//      noStroke();
//      ellipse(width/2, height/2, 20, 20);
//    }
//  }

void mousePressed(){
}
