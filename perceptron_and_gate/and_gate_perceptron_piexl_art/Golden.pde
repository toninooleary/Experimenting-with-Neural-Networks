// This is the golden standard for the perceptron. It will be used to produce training data

class Golden{
  int input1;
  int input2;
  int label;
  
  //constructor
  Golden(int i1, int i2, int lbl){
    input1 = i1;
    input2 = i2;
    label = lbl;
  }
  
  //returns one of the training data's inputs for the Gate
  int getInput(int index){
    if (index == 0){
      return input1;
    } 
    return input2;
  }
  
  //returns the expected output for the gate
  int getLabel(){
    return label;
  } 
}
