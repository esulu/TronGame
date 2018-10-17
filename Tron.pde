/* BM Tron inspired game
 Made by Eren Sulutas
 04-06-2018
 */

Cycle[] cycle;
CycleBot[] cycleBot;
boolean playUser = false;
boolean playBot = false;
int playMode;
public int gameScoreUser = 0;
public int gameScoreBot = 0;
boolean gameOver = false;
public int[] turnsDeadUser;
public int[] turnsDeadBot;

void reset() {
  turnsDeadUser = new int[2];
  turnsDeadBot = new int[3];
  gameScoreUser = 0;
  gameScoreBot = 0;
  cycle[0] = new Cycle(100, 100, 'r');
  cycle[1] = new Cycle(1500, 1500, 'l');
  cycleBot[0] = new CycleBot(1500, 1500, 'l');
  cycleBot[1] = new CycleBot(100, 1500, 'u');
  cycleBot[2] = new CycleBot(1500, 100, 'd');
  gameOver = false;
  setup();
}

void setup() {
  size (1600, 1600);
  cycle = new Cycle[2];
  cycleBot = new CycleBot[3];
  cycle[0] = new Cycle(100, 100, 'r');
  cycle[1] = new Cycle(1500, 1500, 'l');
  cycleBot[0] = new CycleBot(1500, 1500, 'l');
  cycleBot[1] = new CycleBot(100, 1500, 'u');
  cycleBot[2] = new CycleBot(1500, 100, 'd');
  background(0);
  fill(13, 233, 255);
  rect(0, 0, width, 10); 
  noStroke();
  rect(width-10, 0, 10, height); 
  noStroke();
  rect(0, height-10, width, 10); 
  noStroke();
  rect(0, 0, 10, height); 
  noStroke();
}

void draw() {

  if (gameOver) {
    textAlign(CENTER);
    textSize(70);
    fill(255, 0, 0);
    text("GAME OVER", 800, 700);
    fill(255);
    textSize(45);
    text("Main Menu", 800, 850);
    noFill();
    stroke(255, 0, 0);
    rect(675, 800, 250, 70);
    textSize(30);
    fill(255);
    text("Space to continue", 800, 1000);
    textSize(60);

    if (playMode == 1) { // 1 v 1
      if (cycle[0].isAlive() && !cycle[1].isAlive()) { // Player 1 victory 
        text("Player 1 wins!", 800, 550);
      } else if (!cycle[0].isAlive() && cycle[1].isAlive()) { // Player 2 victory 
        text("Player 2 wins!", 800, 550);
      } else {
        gameDraw();
      }
    } else if (playMode == 2) { // 1 v 1 bot
      if (cycle[0].isAlive() && !cycleBot[0].isAlive()) { // Player 1 victory 
        text("Player 1 wins!", 800, 550);
      } else if (!cycle[0].isAlive() && cycleBot[0].isAlive()) { // CPU victory 
        text("CPU wins!", 800, 550);
      } else {
        gameDraw();
      }
    } else if (playMode == 3) { // 2 v 2
      if ((cycle[0].isAlive() || cycle[1].isAlive()) && (!cycleBot[1].isAlive() && !cycleBot[2].isAlive())) { // Player victory 
        text("Players win!", 800, 550);
      } else if (!cycle[0].isAlive() && !cycle[1].isAlive() && (cycleBot[1].isAlive() || cycleBot[2].isAlive())) { // CPU victory 
        text("CPU win!", 800, 550);
      } else {
        gameDraw();
      }
    } else if (playMode == 4) { // FFA
      if (cycle[0].isAlive() && !cycleBot[0].isAlive() && !cycleBot[1].isAlive() && !cycleBot[2].isAlive()) { // Player victory 
        text("Player wins!", 800, 550);
      } else if ((!cycle[0].isAlive() && (cycleBot[0].isAlive()) || cycleBot[1].isAlive() || cycleBot[2].isAlive())) { // CPU victory 
        text("CPU wins!", 800, 550);
      } else {
        gameDraw();
      }
    }
  } else if (playMode == 0) {
    textAlign(CENTER);
    textSize(70);
    fill(255);
    text("TRON", 800, 600);
    textSize(50);
    text("2 Players", 810, 700);
    text("Vs CPU", 810, 800);
    text("2 vs 2", 810, 900);
    text("FFA", 810, 1000);
    fill(13, 233, 255);
    rect(720, 610, 172, 4);
    noFill();
    rect(695, 650, 225, 70);
    rect(695, 750, 225, 70);
    rect(695, 850, 225, 70);
    rect(695, 950, 225, 70);
    stroke(13, 233, 255);
  } else if (playMode == 1) {
    cycle[0].play(1);
    cycle[1].play(2);
  } else if (playMode == 2) {
    cycle[0].play(1);
    cycleBot[0].playBot(0);
  } else if (playMode == 3) {
    cycle[0].play(1);
    cycle[1].play(2);
    cycleBot[1].playBot(1);
    cycleBot[2].playBot(2);
  } else if (playMode == 4) {
    cycle[0].play(1);
    cycleBot[0].playBot(0);
    cycleBot[1].playBot(1);
    cycleBot[2].playBot(2);
  }
  gameIsOver();
}

void gameDraw() {
  text("Draw!", 800, 550);
}

void gameIsOver() {
  if (playMode == 1 || playMode == 2) {
    if ((gameScoreUser + gameScoreBot) >= 1) {
      gameOver = true;
    }
  } else if (playMode == 3) {
    if (gameScoreUser == 2 || gameScoreBot == 2) {
      gameOver = true;
    }
  } else if (playMode == 4) {
    if (gameScoreUser == 1 || gameScoreBot == 3) {
      gameOver = true;
    }
  }
}

void keyPressed() {
  // Player 1
  if (keyCode == 'W' && cycle[0].moving != 'd') { 
    cycle[0].moving = 'u';
  } else if (keyCode == 'S' && cycle[0].moving != 'u') {
    cycle[0].moving = 'd';
  } else if (keyCode == 'D' && cycle[0].moving != 'l') {
    cycle[0].moving = 'r';
  } else if (keyCode == 'A' && cycle[0].moving != 'r') {
    cycle[0].moving = 'l';
  }
  // Player 2
  if (playMode == 1 || playMode == 3) {
    if (keyCode == UP && cycle[1].moving != 'd') { 
      cycle[1].moving = 'u';
    } else if (keyCode == DOWN && cycle[1].moving != 'u') {
      cycle[1].moving = 'd';
    } else if (keyCode == RIGHT && cycle[1].moving != 'l') {
      cycle[1].moving = 'r';
    } else if (keyCode == LEFT && cycle[1].moving != 'r') {
      cycle[1].moving = 'l';
    }
  }
  //Restart
  if (keyCode == ' ') {
    reset();
  }
}

void mousePressed() {
  if (playMode == 0) { // Menu
    if (playerButton()) {
      playMode = 1;
      reset();
    } else if (botButton()) {
      playMode = 2;
      reset();
    } else if (twoOnTwoButton()) {
      playMode = 3;
      reset();
    } else if (ffaButton()) {
      playMode = 4;
      reset();
    }
  } else { 
    if (menuButton()) {
      playMode = 0;
      reset();
    }
  }
}

boolean playerButton () { 
  if (mouseX >= 695 && mouseX <= 915 && mouseY >= 650 && mouseY <= 720) {
    return true;
  } else {
    return false;
  }
}

boolean botButton () { 
  if (mouseX >= 695 && mouseX <= 915 && mouseY >= 750 && mouseY <= 820) {
    return true;
  } else {
    return false;
  }
}

boolean twoOnTwoButton () { 
  if (mouseX >= 695 && mouseX <= 915 && mouseY >= 850 && mouseY <= 920) {
    return true;
  } else {
    return false;
  }
}

boolean ffaButton () { 
  if (mouseX >= 695 && mouseX <= 915 && mouseY >= 950 && mouseY <= 1020) {
    return true;
  } else {
    return false;
  }
}

boolean menuButton () { 
  if (mouseX >= 675 && mouseX <= 925 && mouseY >= 800 && mouseY <= 870) {
    return true;
  } else {
    return false;
  }
}
