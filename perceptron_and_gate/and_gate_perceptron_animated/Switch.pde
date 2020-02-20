class Switch {
  int state;
  
  //constructor
  Switch(){
    state = 1;
  }
  
  // Returns the label of the switch at this current moment
  int getState(){
    return state;
  }
  
  // changes inputs from the current to its opposite. e.g. 1 to 0
  void change(){
    if (state == 1){
      state = 0;
      fill(255, 0, 0);
    } else {
      state = 1;
      fill(0, 255, 0);
    }
  }
  
  void display(){
    ellipse(random(width/2), random(height/2), 30, 30);
  }
}
