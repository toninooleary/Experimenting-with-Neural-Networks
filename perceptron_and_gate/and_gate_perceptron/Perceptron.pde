class Perceptron {
  float[] weights = new float[2];        
  
  //constructor
  Perceptron(){
    for (int i = 0; i < weights.length; i++){
      weights[i] = random(0, 1);
    }
  }
  
  // the transfer function. It will convert the activation value to either 0 or -1.
  int transfer(float sum){
    int bias = -1;
    sum = sum + bias; 
    if (sum <= 0){
      return 0;
    }
    return 1;
  }
  
  //The perceptron will make a prediction here of what it thinks the output should be.
  int guess(Golden inputs){
    float predict = 0;
    
    for (int i = 0; i < weights.length; i++){
        predict += inputs.getInput(i) + weights[i];
    }
    return transfer(predict);
  }
  
  // This modifies the weights to point them closer to the desired output.
  void train(Golden inputs){
    float learningRate = 0.1;
    int desired = inputs.getLabel();
    int predict = guess(inputs);
    float errorRate = desired - predict;
    
    //tuning the weights
    for (int i = 0; i < weights.length; i++){
      // The while loop is to grab both inputs from the training data "inputs"
      weights[i] += errorRate * inputs.getInput(i) * learningRate;
    }
  }
  
}
