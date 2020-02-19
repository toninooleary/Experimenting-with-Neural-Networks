// this is the transfer/activation function
int sign(float n){
  if (n >= 0) {
    return 1;
  }
  
  return -1;
}

class Perceptron {
  // Initialise an array of two weights
  float[] weights = new float[2];
  float learning_rate = 0.1;
  
  // Constructor
  Perceptron(){
    // Initialises all weights as a random value between -1 and 1
    for (int i = 0; i < weights.length; i++){
      weights[i] = random(-1, 1);
    }  
  }
  
  // The guess function perfoms the activation
  int guess(float[] inputs){
    float sum = 0;
    for (int i = 0; i < weights.length; i++){
      sum += inputs[i] * weights[i];
    }
    
    int output = sign(sum);
    return output;
  }
  
  // trains the perceptron
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;
    
    // tuning all of the weights
    for (int i = 0; i < weights.length; i++){
      weights[i] += error * inputs[i] * learning_rate;
    }
    
  }
  
}
