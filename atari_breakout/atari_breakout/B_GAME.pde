void game() {
  background(ocean);
  fill(255);
  timer = timer - 1;

  //bricks
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      management(i);
    }
    i++;
  }

  //text
  fill(gold);
  textSize(60);
  text("score:" + score, 100, 700);
  text("lives:" + lives, 700, 700);

  //paddle
  fill(gold);
  circle(paddlex, paddley, paddled);

  //ball
  circle(ballx, bally, balld);

  //move paddles
  if (akey == true) paddlex = paddlex - 7;
  if (dkey == true) paddlex = paddlex + 7;

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

  if (ballx >= 800 - balld/2) {
    ballx = 800 - balld/2;
  }
  if (ballx <= 0 + balld/2) {
    ballx = 0 + balld/2;
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
  if (bally >= 800 + balld/2) {
    timer = 100;
    ballx = height/2;
    bally = width/2;
    lives = lives - 1;
    error.rewind();
    error.play();
  } else if (lives <= 0) {
    mode = GAMEOVER;
  } else if (score >= 40) {
    mode = GAMEOVER;
  }
  
  //pause
  fill(purple);
  tactile(750, 10, 30, 30);
  rect(750, 10, 30, 30);
  fill(gold);
  stroke(0);
  strokeWeight(5);
  line(760, 15, 760, 35);
  line(770, 15, 770, 35);
  
}


void gameClicks() {
  if (mouseX >= 750 && mouseX <= 780 && mouseX >= 10 && mouseY <= 40) {
    click.rewind();
    click.play();
    mode = PAUSE;
  }
}

void management(int i) {
  if (y[i] == 75) fill(red);
  if (y[i] == 150) fill(orange);
  if (y[i] == 225) fill(green);
  if (y[i] == 300) fill(blue);
  if (y[i] == 375) fill(pink);
  noStroke();
  circle(x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) <= brickd/2 + balld/2) {
    ballvx = (ballx - x[i])/8;
    ballvy = (bally - y[i])/8;
    alive[i] = false;
    score++;
    coin.rewind();
    coin.play();
  }
}
