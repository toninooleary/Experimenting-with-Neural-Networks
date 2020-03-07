class Switch {
  int state;
  float w; 
  float h; 
  float x;
  float y;
  PImage[] anim;
  PImage currentFrame;
  boolean animateOn;
  int counter;
  
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
      counter = 0;
      fill(255, 0, 0);
      currentFrame = null;
    } else {
      state = 1;
      animateOn = true;
      counter = 0;
      fill(0, 255, 0);
      currentFrame = null;
      
    }
    display();
  }
  
  //displays the switches on the screen
  void display(){
    noStroke();
    getFill();
    
    // animates switches
    if (animateOn == true){
      for (int i = 0; i < anim.length; i++){
        image(anim[(counter / 10) % (anim.length)], x - 57, y - 46);
        currentFrame = anim[(counter / 10) % (anim.length)];
        counter++; // counter is used instead of "frameCount" 
                   // FrameCount is unreliable. A counter can be reset and manipulated easily
      }
      if (currentFrame == anim[2]){
        animateOn = false;
      }  
    } else {
      image(currentFrame, x - 57, y - 46);
    }
  }
  
  void getFill(){
    if (state == 0){
      fill(255, 0, 0);
      currentFrame = anim[0];
    } else {
      fill(0, 255, 0);
    }
  }
  
  void setProperties(float x, float y, float w, float h, PImage[] anim){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    print(anim.length);
    this.anim = new PImage[anim.length-1];
    for (int i = 0; i < anim.length-1; i++){
      this.anim[i] = anim[i]; 
    }
    animateOn = false;
  }
}
