// Here is a new comment

Button rulesButton;                                                         // See class definition for "Button"
String[] line;                                                              // Used in the help file function
int big = 90;                                                               // Size of large Gobblets
int medium = 65;                                                            // Size of medium Gobblets
int small = 40;                                                             // Size of small Gobblets
int mini = 15;                                                              // Size of smallest Gobblets

float[][] xBig = { {674, 799, 924}, {674, 799, 924} };                      // Starting x-coordinates of large Gobblets
float[][] yBig = { {89, 89, 89}, {389, 389, 389} };                         // Starting y-coordinates of large Gobblets
boolean[][] overBig = { {false, false, false}, {false, false, false} };     // Check to see if mouse button is pressed
boolean[][] lockBig = { {false, false, false}, {false, false, false}};

float[][] xMedium = { {674, 799, 924}, {674, 799, 924} };                   // Starting x-coordinates of medium Gobblets
float[][] yMedium = { {174, 174, 174}, {474, 474, 474} };                   // Starting y-coordinates of medium Gobblets
boolean[][] overMedium = { {false, false, false}, {false, false, false} };  // Check to see if mouse button is pressed
boolean[][] lockMedium = { {false, false, false}, {false, false, false}};

float[][] xSmall = { {674, 799, 924}, {674, 799, 924} };                    // Starting x-coordinates of small Gobblets
float[][] ySmall = { {234, 234, 234}, {534, 534, 534} };                    // Starting y-coordinates of small Gobblets
boolean[][] overSmall = { {false, false, false}, {false, false, false} };   // Check to see if mouse button is pressed
boolean[][] lockSmall = { {false, false, false}, {false, false, false}};

float[][] xMini = { {674, 799, 924}, {674, 799, 924} };                     // Starting x-coordinates of mini Gobblets
float[][] yMini = { {269, 269, 269}, {569, 569, 569} };                     // Starting y-coordinates of mini Gobblets
boolean[][] overMini = { {false, false, false}, {false, false, false} };    // Check to see if mouse button is pressed
boolean[][] lockMini = { {false, false, false}, {false, false, false}};

void setup()                                                                // Set up the display
{
  size (1000, 600);                                                         //   - Size of board
  rulesButton = new Button (769, 4, 60, 20);                                //   - See class definition for "Button"
}

void draw()                                                                 // Draw the board, Gobblets and buttons
{
  theBoard();                                                               //   - Draw the board

  for (int i = 0; i < 2; i++) {                                             //   - Test if the cursor is over a big Gobblet
    for (int j = 0; j < 3; j++) {
      if (mouseX > xBig[i][j]-big && mouseX < xBig[i][j]+big &&
          mouseY > yBig[i][j]-big && mouseY < yBig[i][j]+big) {
        overBig[i][j] = true;
      } else {
        overBig[i][j] = false;
      }
    }
  }
  for (int i = 0; i < 2; i++) {                                             //   - Test if the cursor is over a medium Gobblet
    for (int j = 0; j < 3; j++) {
      if (mouseX > xMedium[i][j]-medium && mouseX < xMedium[i][j]+medium &&
          mouseY > yMedium[i][j]-medium && mouseY < yMedium[i][j]+medium) {
        overMedium[i][j] = true;
      } else {
        overMedium[i][j] = false;
      }
    }
  }
  for (int i = 0; i < 2; i++) {                                             //   - Test if the cursor is over a small Gobblet
    for (int j = 0; j < 3; j++) {
      if (mouseX > xSmall[i][j]-small && mouseX < xSmall[i][j]+small &&
          mouseY > ySmall[i][j]-small && mouseY < ySmall[i][j]+small) {
        overSmall[i][j] = true;
      } else {
        overSmall[i][j] = false;
      }
    }
  }
  for (int i = 0; i < 2; i++) {                                             //   - Test if the cursor is over a mini Gobblet
    for (int j = 0; j < 3; j++) {
      if (mouseX > xMini[i][j]-mini && mouseX < xMini[i][j]+mini &&
          mouseY > yMini[i][j]-mini && mouseY < yMini[i][j]+mini) {
        overMini[i][j] = true;
      } else {
        overMini[i][j] = false;
      }
    }
  }

  for (int i = 0; i < 3; i++) {
    fill (0, 0, 0);                                                         //   - Fill color = black
    ellipse (xBig[0][i], yBig[0][i], big, big);                             //   - Draw the Gobblets
    ellipse (xMedium[0][i], yMedium[0][i], medium, medium);
    ellipse (xSmall[0][i], ySmall[0][i], small, small);
    ellipse (xMini[0][i], yMini[0][i], mini, mini);
    fill (255, 255, 255);                                                   //   - Fill color = white
    ellipse (xBig[1][i], yBig[1][i], big, big);
    ellipse (xMedium[1][i], yMedium[1][i], medium, medium);
    ellipse (xSmall[1][i], ySmall[1][i], small, small);
    ellipse (xMini[1][i], yMini[1][i], mini, mini);
  }

  if (rulesButton.over() == 1) {                                            //   - Placeholder
  }
  if (rulesButton.press() == 1) {                                           //   - Read the rules
    reading();
  }
  rulesButton.over();                                                       //   - Determine if mouse is over the button
  rulesButton.press();                                                      //   - Determine if button was pressed
}

void mousePressed() {                                                       // FUNCTION: Action if mouse is pressed
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      if (overBig[i][j]) {
        lockBig[i][j] = true;
        fill (80, 0, 0);
      } else {
      lockBig[i][j] = false;
      }
    }
  }
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      if (overMedium[i][j]) {
        lockMedium[i][j] = true;
        fill (80, 0, 0);
      } else {
      lockMedium[i][j] = false;
      }
    }
  }
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      if (overSmall[i][j]) {
        lockSmall[i][j] = true;
        fill (80, 0, 0);
      } else {
      lockSmall[i][j] = false;
      }
    }
  }
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      if (overMini[i][j]) {
        lockMini[i][j] = true;
        fill (80, 0, 0);
      } else {
      lockMini[i][j] = false;
      }
    }
  }
}

void mouseDragged() {                                                       // FUNCTION: Action if mouse is dragged
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      if (lockBig[i][j]) {
        xBig[i][j] = mouseX;
        yBig[i][j] = mouseY;
      }
    }
  }
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      if (lockMedium[i][j]) {
        xMedium[i][j] = mouseX;
        yMedium[i][j] = mouseY;
      }
    }
  }
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      if (lockSmall[i][j]) {
        xSmall[i][j] = mouseX;
        ySmall[i][j] = mouseY;
      }
    }
  }
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      if (lockMini[i][j]) {
        xMini[i][j] = mouseX;
        yMini[i][j] = mouseY;
      }
    }
  }
}

void mouseReleased() {                                                      // FUNCTION: Action if mouse is released
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      lockBig[i][j] = false;
      lockMedium[i][j] = false;
      lockSmall[i][j] = false;
      lockMini[i][j] = false;
    }
  }
}

void theBoard() {                                                           // FUNCTION: Draw the board
  background (124, 48, 4);                                                  //   - Background color = dark orange
  fill (255, 141, 0);                                                       //   - Semicircle color = gold
  strokeWeight (4);                                                         //   - Line weight

  int a = 30;                                                               //   - Width of each semicircle
  int b = 150;                                                              //   - Height of each semicircle
  for (int i = 0; i < b * 4; i = i + b) {
    for (int j = 0; j < b * 4; j = j + b) {
      ellipse (0 + i, 74 + j, a, b);                                        //   - Circles and semicircles
      ellipse (74 + i, 0 + j, b, a);
      ellipse (149 + i, 74 + j, a, b);
      ellipse (74 + i, 149 + j, b, a);
      line (0 + i, 0 + j, 149 + i, 0 + j);                                  //   - Outline
      line (149 + i, 0 + j, 149 + i, 149 + j);
      line (149 + i, 149 + j, 0 + i, 149 + j);
      line (0 + i, 149 + j, 0 + i, 0 + j);
    }
  }
  fill (125, 125, 125);                                                     //   - Sideline
  rect (600, 0, 399, 599);
  
  fill (8, 88, 255);                                                        //   - Draw the button
  strokeJoin (ROUND);
  rect (769, 4, 60, 20);
  fill (0);
  textSize (14);
  text ("Rules", 782, 20);
}

void reading() {                                                            // FUNCTION: Display help file
  background (125, 125, 125);
  textSize (18);
  String[] lines = loadStrings ("help.txt");
  for (int i = 0; i < lines.length; i++) {
    text (lines[i], 0, 50 + (i * 30));
  }
}

class Button {                                                              // CLASS: Button
  float xLocB;                                                              //   - x-coordinate
  float yLocB;                                                              //   - y-coordinate
  float xSizeB;                                                             //   - Button width
  float ySizeB;                                                             //   - Button height
  int myButtonOver;                                                         //   - Determine if mouse is over the button
  int myButtonPressed;                                                      //   - Determine if button is pressed

  Button (float xLocB0, float yLocB0, float xSizeB0, float ySizeB0) {       //   - Define buttons
    xLocB = xLocB0;
    yLocB = yLocB0;
    xSizeB = xSizeB0;
    ySizeB = ySizeB0;
  }

  int over() {                                                              //   - Returns 1 if mouse is over button, o.w. returns 0
    if (mouseX >= xLocB && mouseX <= (xLocB + xSizeB) &&
        mouseY >= yLocB && mouseY <= (yLocB + ySizeB)) {
      myButtonOver = 1;
    }
    else {
      myButtonOver = 0;
    }
    return myButtonOver;
  }

  int press() {                                                             //   - Returns 1 if button is pressed, o.w. returns 0
    if (myButtonOver == 1 && mousePressed) {
      myButtonPressed = 1;
    } else {
      myButtonPressed = 0;
    }
    return myButtonPressed;
  }
}
