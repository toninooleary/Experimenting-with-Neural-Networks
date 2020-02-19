float[] weights = new float[2];

class Perceptron {
  
  //constructor
  void Perceptron(){
    for (float w: weights){
      w = random(-2, 0);
    }
  }
  
  // the transfer function. It will convert the activation value to either 0 or -1.
  int transfer(float sum){
    if (sum >= 0){
      return 0;
    }
    
    return -1;
  }
  
  
  
}
