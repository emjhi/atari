void intro() {
  start.play();
  background(0);
  image(intro[introN], 200, 0, 400, 500);
  if (frameCount % 5 == 0) introN = introN + 1;
  if (introN == introF) introN = 0;

  //buttons
  fill(purple);
  tactile(75, 600, 200, 100);
  rect(75, 600, 200, 100);//start
  tactile(525, 600, 200, 100);
  rect(525, 600, 200, 100);//exit
  
  fill(blue);
  textFont(game);
  textSize(60);
  text("START", 175, 650);
  text("QUIT", 625, 650);
}

void introClicks() {
  if (mouseX >= 75 && mouseX <= 275 && mouseY >= 600 && mouseY <= 700) {
    mode = GAME;
    click.rewind();
    click.play();
  }
  if (mouseX >= 525 && mouseX <= 725 && mouseY >= 600 && mouseY <= 700) {
    exit();
    click.rewind();
    click.play();
  }
}
