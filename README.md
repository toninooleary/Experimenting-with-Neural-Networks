# Neural Networks Experiments:

## The perceptron:
This perceptron aims to classify points as 1 or -1 depending on what side of the line they are on.

#### Begin Training:
![image](./the_perceptron/pictures/begin_training.png "What the perceptron's guessed classifications look like at the start of its training")

#### Half Trained:
![image](./the_perceptron/pictures/half_trained.png "What the perceptron's guessed classifications look like in the middle of its training")

#### Fully Trained:
![image](./the_perceptron/pictures/fully_classified.PNG "What the perceptron's guessed classifications look like at the end of its training")

#### Exapanding on the perceptron - classifying a drawn line as greater or less than a given boundary:

- This feature allows you to draw on the canvas. The line drawn will either be blue or orange depending on whether the perceptron guesses that this line is either on the left or right side of the boundary.

![image](./the_perceptron/pictures/classifying_a_drawn_line.PNG "Draw ellipses are classified to be on one side or another side of the boundary line")

- This image shows the line after using linear interpolation to smooth the transitions when the weight of the line increases and decreases.

![image](./the_perceptron/pictures/classifying_a_drawn_line_smooth.PNG "Draw line is classified to be on one side or another side of the boundary line")

- The draw feature now has a thickness limit of 5px.

![image](./the_perceptron/pictures/classifying_a_drawn_line_smooth_limited.PNG "Draw line is classified to be on one side or another side of the boundary line (smooth dransition between line hickness increase and decrease)")