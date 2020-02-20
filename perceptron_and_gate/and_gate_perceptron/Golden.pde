// This is the golden standard for the perceptron. It will be used to produce training data

class Golden{
  int input1;
  int input2;
  int label;
  
  Golden(int i1, int i2, int lbl){
    input1 = i1;
    input2 = i2;
    label = lbl;
  }
  
  int getInput(int index){
    if (index == 0){
      return input1;
    } 
    return input2;
  }
  
  int getLabel(){
    return label;
  }
  
  int logicSum(){
    return input1 - input2;
  }
    
}
