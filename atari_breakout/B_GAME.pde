void game() {
  background(0);
  fill(255);
  timer = timer - 1;

  textSize(40);
  text("score:" + score, 100, 80);
  text("lives:" + lives, 100, 120);

  //paddle
  circle(paddlex, paddley, paddled);

  //ball
  circle(ballx, bally, balld);

  //move paddles
  if (akey == true) paddlex = paddlex - 5;
  if (dkey == true) paddlex = paddlex + 5;

  if (paddlex <= 75) {
    paddlex = 75;
  }
  if (paddlex > 725) {
    paddlex = 725;
  }

  //move ball
  if (timer < 0) {
    ballx = ballx + ballvx;
    bally = bally + ballvy;
  }

  if (ballx >= 785) {
    ballx = 785;
  }
  if (ballx <= 15) {
    ballx = 15;
  }

  //ball bouncing 
  if (bally <= balld/2) {
    ballvy = ballvy * -1;
  }
  if (ballx <= balld/2 || ballx >= width - balld/2) {
    ballvx = ballvx * -1;
  }
  if (dist(paddlex, paddley, ballx, bally) <= paddled/2 + balld/2) {
    ballvx = (ballx - paddlex)/12;
    ballvy = (bally - paddley)/12;
  }

  //gameover 
  if (bally >= 815) {
    timer = 100;
    ballx = height/2;
    bally = width/2;
    lives = lives - 1;
  } else if (lives <= 0) {
    mode = GAMEOVER;
  }
}


void gameClicks() {
}
