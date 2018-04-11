class Cycle {
  int x, y;
  char moving;

  // Constructor method which initializes a light cycle 
  Cycle(int x, int y, char moving) {
    this.x = x;
    this.y = y;
    this.moving = moving;
  }

  // Changes the movements of the light cycle 
  void play(int player) {
    if (get(x, y) == color(0, 0, 0)) { // Checks if the light cycle has intersected with another trail
      if (player == 1) {
        fill(13, 233, 255);
        noStroke();
        rect(x, y, 10, 10);
      } else {
        fill(255, 196, 44);
        noStroke();
        rect(x, y, 10, 10);
      }

      if (moving == 'u') {
        y -= 10;
      } else if (moving == 'd') {
        y += 10;
      } else if (moving == 'r') {
        x += 10;
      } else if (moving == 'l') {
        x -= 10;
      }
    } else {
      if (turnsDeadUser[player-1] == 0) {
        gameScoreUser ++;
        turnsDeadUser[player-1] ++;
      }
    }
  }

  boolean isAlive() {
    if (get(x, y) != color(0, 0, 0)) {
      return false;
    } else {
      return true;
    }
  }
}
