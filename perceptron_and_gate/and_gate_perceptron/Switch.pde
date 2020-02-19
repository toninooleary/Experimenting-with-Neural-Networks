class Switch {
  int label;
  
  //constructor
  Switch(){
    label = 1;
  }
  
  // Returns the label of the switch at this current moment
  int getLabel(){
    return label;
  }
  
  // changes inputs from the current to its opposite. e.g. 1 to 0
  void change(){
    if (label == 1){
      label = -1;
      fill(255, 0, 0);
    } else {
      label = 1;
      fill(0, 255, 0);
    }
  }
  
  // It will get the other input and check if it should be a 0 or 1 for the AND gate's logic.
  int logicPair(int labelPair){
    if (label == 1 && labelPair == 1){
      return 1;
    }

    return -1;    
  }
  
  void display(){
    ellipse(random(width/2), random(height/2), 30, 30);
  }
}
