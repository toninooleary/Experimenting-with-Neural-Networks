class Perceptron {
  float[] weights = new float[2];        
  
  //constructor
  Perceptron(){
    for (int i = 0; i < weights.length; i++){
      weights[i] = random(-1, 1);
      //println(w);
    }
  }
  
  // the transfer function. It will convert the activation value to either 0 or -1.
  int transfer(float sum){
    int bias = -1;
    //println(sum);
    sum = sum + bias;
    if (sum >= 0){
      return 1;
    }
    
    return -1;
  }
  
  //The perceptron will make a prediction here of what it thinks the output should be.
  int guess(Switch[] inputs){
    float predict = 0;

    for (int i = 0; i < inputs.length; i++){
      predict += inputs[i].getLabel() * weights[i];
      println(inputs[i].getLabel());
      println(weights[i]);
    }
    println(predict);
    return transfer(transfer(predict));
  }
  
  // This modifies the weights to point them closer to the desired output.
  void train(Switch[] inputs, int desired){
    float learningRate = 0.1;
    int predict = guess(inputs);
    float errorRate = desired - predict;
    
    for (int i = 0; i < weights.length; i++){
      weights[i] = errorRate * inputs[i].getLabel() * learningRate;
    }
  }
  
}
