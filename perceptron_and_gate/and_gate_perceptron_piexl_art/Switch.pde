class Switch {
  int state;
  float w; 
  float h; 
  float x;
  float y;
  PImage[] onAnim;
  PImage currentFrame;
  boolean animateOn;
  boolean animateOff;
  int counter;
  
  //constructor
  Switch(float x, float y, float w, float h, PImage[] onAnim){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.onAnim = new PImage[onAnim.length-1];
    for (int i = 0; i < onAnim.length-1; i++){
      this.onAnim[i] = onAnim[i]; 
    }
    state = 0;
    animateOn = false;
    animateOff = false;
  }
  
  // Returns the label of the switch at this current moment
  int getState(){
    return state;
  }
  
  // changes inputs from the current to its opposite. e.g. 1 to 0
  void change(){
    if (state == 1){
      state = 0;
      counter = 0;
      currentFrame = null;
      animateOff = true;
    } else {
      state = 1;
      counter = 0;
      currentFrame = null;
      animateOn = true;
    }
    display();
  }
  
  //displays the switches on the screen
  void display(){
    noStroke();
    getStill();
    
    // animates switches
    if (animateOn == true){
      for (int i = 0; i < onAnim.length; i++){
        image(onAnim[(counter / 10) % (onAnim.length)], x - 57, y - 46);
        currentFrame = onAnim[(counter / 10) % (onAnim.length)];
        counter++; // counter is used instead of "frameCount" 
                   // FrameCount is unreliable. A counter can be reset and manipulated easily
      }
      if (currentFrame == onAnim[2]){
        animateOn = false;
      }   
    } else {
      image(currentFrame, x - 57, y - 46);
    } 
  }
  
  // Sets the idle frames for the switches when they are not animating 
  void getStill(){
    if (state == 0){
      currentFrame = onAnim[0];
    } else {
      currentFrame = onAnim[2];
    }
  }
}
