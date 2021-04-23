//emma sun
//4/13/2021
//1.4A

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound varaibles
Minim minim;
AudioPlayer start, error, click, coin, win, lose;

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
PFont game;

//keyboard
boolean akey, dkey;

//score
int score, timer, lives, highscore;

//brick variables
int[] x;//x array
int[] y;//y array
int n;// pages
int brickd;//brick diameter
int tempx, tempy;
boolean[] alive;

//colours
color red = #FF5039;
color orange = #FF9439;
color green = #33E46D;
color blue = #33A7E4;
color pink = #F43779;
color purple = #AD2BAD;
color ocean = #2F2BAD;
color gold = #F7DB15;

//gif variables
PImage[] intro;
PImage[] gameover;
int introF;
int introN;
int gameoverF;
int gameoverN;

void setup() {
  size(800, 800, FX2D);
  mode = INTRO;
  textAlign(CENTER, CENTER);

  //minim
  minim = new Minim(this);
  start = minim.loadFile("start.mp3");
  click = minim.loadFile("click.wav");
  error = minim.loadFile("error.mp3");
  coin = minim.loadFile("coin.wav");
  win = minim.loadFile("win.mp3");
  lose = minim.loadFile("lose.mp3");

  game = createFont("GameOn.ttf", 50);

  //initialze entites
  paddlex = 400;
  paddley = 800;
  paddled = 150;

  //initialize ball
  ballx = width/2;
  bally = height/2 + 100;
  balld = 10; 
  ballvx = random(3, -3);
  ballvy = random(-3, 3);

  //initalize keyboard
  akey = dkey = false;

  //initialize score
  score = 0;
  timer = 100;
  lives = 3;

  //brick array setup
  n = 40;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];

  brickd = 35;
  tempx = 50;
  tempy = 75;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;

    tempy = tempy + 75;
    if (tempy > 400) {
      tempx = tempx + 100;
      tempy = 75;
    }
    i=i+1;
  }

  //intro gif
  introF = 17;
  intro = new PImage[introF];
  int introI = 0;
  while (introI < introF) {
    intro[introI] = loadImage("frame_"+introI+"_delay-0.1s.gif");
    introI++;
  }

  //gameover gif
  gameoverF = 10;
  gameover = new PImage[gameoverF];
  int gameoverI = 0;
  while (gameoverI < gameoverF) {
    gameover[gameoverI] = loadImage("frame_"+gameoverI+"_delay-0.05s.gif");
    gameoverI++;
  }
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
  } else {
    println("Mode error:" + mode);
  }
}

void reset() {
  int i = 0;
  while (i < n) {
    alive[i] = true;
    i=i+1;
  }

    timer = 100;
    score = 0;
    lives = 3;
    paddlex = 400;
    ballx = width/2;
    bally = height/2 + 100;
    ballvx = random(3, -3);
    ballvy = random(-3, 3);
  }

  void tactile(int x, int y, int w, int h) {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      stroke(purple); 
      strokeWeight(8);
    } else {
      noStroke();
    }
  }
