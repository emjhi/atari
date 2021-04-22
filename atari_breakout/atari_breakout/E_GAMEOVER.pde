void gameover() {
  if (score >= highscore) {
    highscore = score;
  }

  if (score >= 40) {
    win.play();
    background(ocean);//win
    textSize(100);
    text("WIN!!", 400, 400);
  } else {
    error.play();
    background(ocean);
    image(gameover[gameoverN], 150, 100, 500, 300);
    if (frameCount % 6 == 0) gameoverN = gameoverN + 1;
    if (gameoverN == gameoverF) gameoverN = 0;//lose
    textSize(100);
    text("LOST", 400, 50);
    text("Highscore:" + highscore, 400, 600);
  }
}

void gameoverClicks() {
  reset();
  click.rewind();
  click.play();
  mode = INTRO;
}
