void pause() {
  textSize(150);
  text("PAUSED", 400, 300);
}

void pauseClicks() {
  if (mouseX >= 750 && mouseX <= 780 && mouseX >= 10 && mouseY <= 40) {
    mode = GAME;
    click.rewind();
    click.play();
  }
}
