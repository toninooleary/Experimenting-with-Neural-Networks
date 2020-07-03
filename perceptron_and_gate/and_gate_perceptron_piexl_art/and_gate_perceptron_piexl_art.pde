Perceptron p;
Bulb bulb;
Switch[] switches = new Switch[2];
Golden[] trainData = new Golden[4];
Golden currentlySelected;
int genNum;
boolean light;
int rectSize;
int rectPosX;
int rectPosY;
int inp1PosX;
int inp1PosY;
int inp2PosX;
int inp2PosY;
boolean overTrain;
boolean overInput1;
boolean overInput2;
boolean animateLight;
PImage andGateImg;

PImage switchOnSS;
JSONObject switchOnJsn;
PImage[] switchOnFrames = new PImage[3];

PImage switchOffSS;
JSONObject switchOffJsn;
PImage[] switchOffFrames = new PImage[3];

PImage lightFaultSS;
JSONObject lightFaultJsn;
PImage[] lightFaultFrames = new PImage[4];

PImage lightOnSS;
JSONObject lightOnJsn;
PImage[] lightOnFrames = new PImage[9];

void setup(){
  size(1200, 800);
  switchOnSS = loadImage("/animations/switch_on_v2_sheet.png");
  switchOnJsn = loadJSONObject("/animations/switch_on_v2_data.json");

  switchOffSS = loadImage("/animations/switch_off_v2_sheet.png");
  switchOffJsn = loadJSONObject("/animations/switch_off_v2_data.json");
  
  lightFaultSS = loadImage("/animations/light_faulty_sheet.png");
  lightFaultJsn = loadJSONObject("/animations/light_faulty_data.json"); 
  
  lightOnSS = loadImage("/animations/light_on_sheet.png");
  lightOnJsn = loadJSONObject("/animations/light_on_data.json");
  
  andGateImg = loadImage("/animations/and_gate_sprite_larger.png");
  genNum = 0;
  light = false;
  rectSize = 50;
  rectPosX = (width/width * 100);
  rectPosY = height/6 * 5;
  inp1PosX = (width/7) -33;
  inp1PosY = (height/4) -60;
  inp2PosX = inp1PosX;
  inp2PosY = inp1PosY * 3;
  overTrain = false;
  overInput1 = false;
  overInput2 = false;
  animateLight = false;
  p = new Perceptron();
  
  //initialising training data
  trainData[0] = new Golden(0, 0, 0);
  trainData[1] = new Golden(0, 1, 0);
  trainData[2] = new Golden(1, 0, 0);
  trainData[3] = new Golden(1, 1, 1);
  
  JSONObject frames = switchOnJsn.getJSONObject("frames");
  JSONObject imgData;
  JSONObject frameData;
  PImage img;
  for (int i = 0; i < frames.size(); i++){
    imgData = frames.getJSONObject("switch_on_v2 " + i + ".aseprite" );
    frameData = imgData.getJSONObject("frame");
    img = switchOnSS.get(frameData.getInt("x"), frameData.getInt("y"), frameData.getInt("w"), frameData.getInt("h"));
    switchOnFrames[i] = img;
  }

  frames = switchOffJsn.getJSONObject("frames");
  for (int i = 0; i < frames.size(); i++){
    imgData = frames.getJSONObject("switch_off_v2 " + i + ".aseprite" );
    frameData = imgData.getJSONObject("frame");
    img = switchOffSS.get(frameData.getInt("x"), frameData.getInt("y"), frameData.getInt("w"), frameData.getInt("h"));
    switchOffFrames[i] = img;
  }
  
  frames = lightFaultJsn.getJSONObject("frames");
  for (int i = 0; i < frames.size(); i++){
    imgData = frames.getJSONObject("light_faulty " + i + ".aseprite" );
    frameData = imgData.getJSONObject("frame");
    img = lightFaultSS.get(frameData.getInt("x"), frameData.getInt("y"), frameData.getInt("w"), frameData.getInt("h"));
    lightFaultFrames[i] = img;
  }
  
  frames = lightOnJsn.getJSONObject("frames");
  for (int i = 0; i < frames.size(); i++){
    imgData = frames.getJSONObject("light_on " + i + ".aseprite" );
    frameData = imgData.getJSONObject("frame");
    img = lightOnSS.get(frameData.getInt("x"), frameData.getInt("y"), frameData.getInt("w"), frameData.getInt("h"));
    lightOnFrames[i] = img;
  }
 
  switches[0] = new Switch(inp1PosX, inp1PosY, 88, 121, switchOnFrames, switchOffFrames);
  switches[1] = new Switch(inp2PosX, inp2PosY, 88, 121, switchOnFrames, switchOffFrames);
  bulb = new Bulb((width/7) * 6, height/2, lightOnFrames, lightFaultFrames, switches);
}

void draw(){
  background(255);
  buttonUpdate();
  displayAttributes();
  //ellipse(width/2,height/2,50,50);
}

void displayAttributes(){
  //switches circles
  switches[0].display();
  switches[1].display();
  bulb.display();
  if (animateLight == true){
    if (!light){
      fill(150);
      bulb.animate(0);
    } else {
      fill(140,234,20);
      bulb.animate(1);
    }
    animateLight = false;
  }
  
  noStroke();
  fill(150); 
  rect(rectPosX, rectPosY, rectSize * 3, rectSize);
  
  //display current generation text
  textSize(20);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Adjustments: " + genNum, 100, 70);

  textSize(20);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Press To Tune", rectPosX + (rectSize * 3/2), rectPosY + (rectSize/2));
  image(andGateImg, width/2 - 366/2, height/2 - 148/2 - 60);
}

void mousePressed(){
  println(overTrain);
  if (overTrain){
    genNum++;
    // This trains the data.
    for (int i = 0; i < trainData.length; i++){    
      p.train(trainData[i]);
    }
  } else if (overInput1){
    switches[0].change();
    animateLight = true;
    //display bulb
  } else if (overInput2){
    switches[1].change();
    animateLight = true;
  }
  
  if (genNum > 0){
    outputCheck();
  } 
}

//updates checks if the mouse is over a 
void buttonUpdate(){
  if (hoverTrain(rectPosX, rectPosY, rectSize * 3, rectSize)){
    overTrain = true;
    overInput1 = false;
    overInput2 = false;
  } else if (hoverInput1(inp1PosX, inp1PosY, 88, 121)){
    overInput1 = true;
    overTrain = false;
    overInput2 = false;
  } else if (hoverInput2(inp2PosX, inp2PosY, 88, 121)){
    overInput2 = true;
    overInput1 = false;
    overTrain = false;   
  } else {
    overTrain = false;
    overInput1 = false;
    overInput2 = false;
  }
}

boolean hoverTrain(int x, int y, int w, int h){
  //Checks if the mouse is in the boundary of the edge height and width of the "buttons"
  if (mouseX >= x && mouseX <= x+w &&
      mouseY >= y && mouseY <= y+h){
    return true;
  }
  return false;
}

boolean hoverInput1(int x, int y, int w, int h){
  //Checks if the mouse is in the boundary of the edge height and width of the "buttons"
  if (mouseX >= x && mouseX <= x+w &&
      mouseY >= y && mouseY <= y+h){
    return true;
  }
  return false;
}

boolean hoverInput2(int x, int y, int w, int h){
  //Checks if the mouse is in the boundary of the edge height and width of the "buttons"
  if (mouseX >= x && mouseX <= x+w &&
      mouseY >= y && mouseY <= y+h){
    return true;
  }
  return false;
}

void outputCheck(){
  for (int i = 0; i < trainData.length; i++){
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
