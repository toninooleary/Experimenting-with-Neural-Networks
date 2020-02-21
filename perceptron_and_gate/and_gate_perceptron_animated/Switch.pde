class Switch {
  int state;
  
  //constructor
  Switch(){
    state = 0;
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
  
  //displays the switches on the screen
  void display(float w, float h){
    noStroke();
    ellipse(w, h, 30, 30);
  }
}
