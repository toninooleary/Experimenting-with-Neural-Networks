class Bulb{
  int x;
  int y;
  PImage[] animOn;
  PImage[] animFaulty;
  boolean animateO;
  boolean animateF;
  int counter;
  PImage currentFrame;
  Switch[] switches;

  Bulb(int x, int y, PImage[] animOn, PImage[] animFaulty, Switch[] switches){
    this.x = x;
    this.y = y;
    this.animOn = new PImage[animOn.length];
    for (int i = 0; i < animOn.length; i++){
      this.animOn[i] = animOn[i];
    }
    this.animFaulty = new PImage[animFaulty.length];
    for (int i = 0; i < animFaulty.length; i ++){
      this.animFaulty[i] = animFaulty[i];
    }
    animateF = false;
    animateO = false;
    currentFrame = animFaulty[0];
    print(animFaulty.length);
    this.switches = switches;
  }
  
  void display(){
    // animates bulb
    if (animateO == true){
      for (int i = 0; i < animOn.length; i++){
        background(255);
        switches[0].display();
        switches[1].display();
        image(animOn[(counter / 30) % (animOn.length)], x - (71 + 64/2), y - (47 + 116/2) - 60);
        currentFrame = animOn[(counter / 30) % (animOn.length)];
        counter++; // counter is used instead of "frameCount" 
                   // FrameCount is unreliable. A counter can be reset and manipulated easily
      }
      if (currentFrame == animOn[animOn.length - 1]){
        animateO = false;
        currentFrame = animOn[animOn.length - 1];
      }
    } else if (animateF == true){
      for (int i = 0; i < animFaulty.length; i++){
        background(255);
        switches[0].display();
        switches[1].display();
        image(animFaulty[(counter / 30) % (animFaulty.length)], x - (71 + 64/2), y - (47 + 116/2) - 60);
        currentFrame = animFaulty[(counter / 30) % (animFaulty.length)];
        counter++; // counter is used instead of "frameCount" 
                   // FrameCount is unreliable. A counter can be reset and manipulated easily
      }
      print(currentFrame);
      print(animFaulty[3]);
      if (currentFrame == animFaulty[animFaulty.length - 1]){
        animateF = false;
        currentFrame = animFaulty[0];
      }  
    } else {
      image(currentFrame, x - (71 + 64/2), y - (47 + 116/2) - 60);
    }
  }

  void animate(int a){
    if (a == 0){
      animateO = false;
      animateF = true;
      counter = 0;
    } else if (a == 1){
      animateF = false;
      animateO = true;
      counter = 0;
    }  
  }

}
