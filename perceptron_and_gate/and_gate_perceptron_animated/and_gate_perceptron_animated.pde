Perceptron p;
Switch[] switches = new Switch[2];
Golden[] trainData = new Golden[4];
Golden currentlySelected;
int genNum = 0;
boolean light = false;

void setup(){
  size(800, 800);
  p = new Perceptron();
  
  for (int i = 0; i < switches.length; i++){
    switches[i] = new Switch();
  }
  
  //initialising training data
  trainData[0] = new Golden(0, 0, 0);
  trainData[1] = new Golden(0, 1, 0);
  trainData[2] = new Golden(1, 0, 0);
  trainData[3] = new Golden(1, 1, 1);
}

void draw(){
  background(255);
  displayAttributes();
}

void mousePressed(){
  genNum++;
  
  // This trains the data.
  for (int i = 0; i < trainData.length; i++){
    p.train(trainData[i]);
    
    // Gets the training data that matches the "switches" input.
    if (trainData[i].getInput(0) == switches[0].getState() && trainData[i].getInput(1) == switches[1].getState()){
      currentlySelected = trainData[i];
    }
  }
  
  // turns the "light" on if the output from the perceptrons guess is correct.
  // This is irrelevant from whether it is correct or not.
  if (p.guess(currentlySelected) != 1){
    light = false;
  } else {        
    light = true;
  }
}

void displayAttributes(){
  //display current generation text
  textSize(20);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Generation " + genNum, 100, 70);

  //switches circles
  switches[0].display(100, 200);
  switches[0].display(100, 600);
  
  //display bulb
  if (!light){
    fill(150);  
  } else {
    fill(244,175,90);  
  }
  noStroke();
  ellipse(width/2, height/2, 30, 30);
}
