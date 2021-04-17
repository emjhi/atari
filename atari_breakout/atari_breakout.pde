//emma sun
//4/13/2021
//1.4A

//mode 
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int OPTIONS = 5;

void setup() {
  size(800, 600);
  mode = INTRO;
  textAlign(CENTER, CENTER);
}

void draw() {
    if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == OPTIONS) {
    options();
  } else {
    println("Mode error:" + mode);
  }
}
