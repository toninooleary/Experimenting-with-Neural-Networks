class Switch {
  int state;
  float w; 
  float h; 
  float diameter;
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
    display();
  }
  
  //displays the switches on the screen
  void display(){
    noStroke();
    getFill();
    ellipse(w, h, diameter, diameter);
  }
  
  void getFill(){
    if (state == 0){
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
  }
  
  void setPos(float w, float h, float diameter){
    this.w = w;
    this.h = h;
    this.diameter = diameter;
  }
}
