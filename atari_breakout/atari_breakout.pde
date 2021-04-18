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

//entities
float paddlex, paddley, paddled;//paddle
float ballx, bally, balld;//ball
float ballvx, ballvy;//velocity

//keyboard
boolean akey, dkey;

//score
int score, timer, lives;

  void setup() {
  size(800, 800);
  mode = GAME;
  textAlign(CENTER, CENTER);

  //initialze entites
  paddlex = 400;
  paddley = 800;
  paddled = 150;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 30; 
  ballvx = random(2, -2);
  ballvy = random(-2, 2);
  
  //initalize keyboard
  akey = dkey = false;
  
  //initialize score
  score = 0;
  timer = 100;
  lives = 3;
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
