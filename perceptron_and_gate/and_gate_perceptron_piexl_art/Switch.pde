class Switch {
  int state;
  float w; 
  float h; 
  float x;
  float y;
  PImage[] onAnim;
  PImage[] offAnim;
  PImage currentFrame;
  boolean animateOn;
  boolean animateOff;
  int counter;
  
  //constructor
  Switch(float x, float y, float w, float h, PImage[] onAnim, PImage[] offAnim){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.onAnim = new PImage[onAnim.length];
    for (int i = 0; i < onAnim.length; i++){
      this.onAnim[i] = onAnim[i]; 
    }
    this.offAnim = new PImage[offAnim.length];
    for (int i = 0; i < offAnim.length; i++){
      this.offAnim[i] = offAnim[i];
      print(offAnim.length);
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
    fill(150, 200);
    rect(x - 20, y, w + 20, h + 20);    
    getFill();
    rect(x - 10, y - 10, w + 20, h + 20);
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
    } else if (animateOff == true){
      for (int i = 0; i < offAnim.length; i++){
        image(offAnim[(counter / 10) % (offAnim.length)], x - 57, y - 46);
        currentFrame = offAnim[(counter / 10) % (offAnim.length)];
        counter++; // counter is used instead of "frameCount" 
                   // FrameCount is unreliable. A counter can be reset and manipulated easily
      }
      if (currentFrame == offAnim[2]){
        animateOff = false;
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
  
  void getFill(){
    if (state == 0){
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
  }
}
