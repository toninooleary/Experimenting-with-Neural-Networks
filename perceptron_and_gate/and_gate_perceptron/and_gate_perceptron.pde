Perceptron p;
Switch[] switches = new Switch[2];

void setup(){
  size(800, 800);
  background(255);
  p = new Perceptron();
  
  for (int i = 0; i < switches.length; i++){
    switches[i] = new Switch();
    switches[i].display();
  }
  
  
  ellipse(width/2, height/2, 20, 20);
  println(p.guess(switches));
}

void draw(){
  //int[point]
  
  //used to tell if the guessed answer is correct
}

void mousePressed(){
  if (p.guess(switches) == switches[0].logicPair(switches[1].getLabel())){
    fill(244,175,90);
  } else {
    fill(155);  
  }
  ellipse(width/2, height/2, 20, 20);
}
