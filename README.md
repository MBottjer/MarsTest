Mars Rover Technical Test
=========

A code kata prepared for ThoughtWorks.

This program was built using Ruby 2.0

The program has five classes:
  - Position: determines position of rover upon moving and turning (initialized with plateau).
  - Compass: knows the directions of North, East, South and West relative to each other.
  - Rover: is initialized with a position.
  - Plateau: dictates boundaries and determines whether coordinates are out sound of these boundaries.
  - Interface: Interprets and executes input from a file.

To demonstrate the programs ability, a file named input.txt can be located from the fixtures folder inside spec. This file contains the kata's specified input and is used in the tests to illustrate the programs ability to determine multiple rovers' new positions and print the output in the terminal. Furthermore, an additional file, called test_input.txt, is included to further tests the programs ability to interpret a larger input file.

Furthermore, there is a script file in the root called main.rb which you can run using ruby main.rb. It takes the input specified in ./spec/fixtures/input.txt and produces the appropriate output.

Assumptions:

  - Rovers cannot collide with each other
  - If rovers go out of bounds it will throw an error
  - A rovers position is located first and then it is moved


Attempt
----

1.0
