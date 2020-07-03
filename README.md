# Neural Networks Experiments:

# Final Perceptron:

## Visualised AND Gate Perceptron Complete (Using self made pixel art):

![image](./perceptron_and_gate/pictures/perceptron_pixel_art_gif.gif "Pixel art and gate perceptron")

# Experimental Process:

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

## AND gate perceptron

This perceptron will aim to give correct outputs for an AND gate, given input pairs of 0/1.

- Red circles represent incorrectly classified outputs for given inputs.
- Green represent correct classifications.

![image](./perceptron_and_gate/pictures/and_gate1.png "AND gate classifier in training")

![image](./perceptron_and_gate/pictures/and_gate2.PNG "AND gate classifier finished training")

## Visualising the AND gate

In this extension of the and gate project, I intend to extend upon it and visualise it. I will keep track of each generation and let the user explore the outputs the perceptron has in each generation.

![image](./perceptron_and_gate/pictures/visualised_and_gate.PNG "Implementing a more interative system")

This will be extended further, animations and a more pleasant UI will be implemented.

- You can click on the inputs to change their value. Red is 0. Green is 1.
- There is a button for training the perceptron.
- You can see each output for a generation by changing the inputs (via a click on an input node).

![image](./perceptron_and_gate/pictures/visualised_and_gate_v2.PNG "Mostly complete interactive system for AND gate perceptron visualisation")