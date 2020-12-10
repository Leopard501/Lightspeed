void keyReleased() {
  if (key == ' ') {
    enterLightspeed();
  }
  if (key == 'r') {
    reset();  
  }
  if (key == '1') {
    spiral = !spiral;
    reset();
  }
  if (key == '2') {
    trails = !trails;
    reset();
  }
  if (key == '3') {
    colorful = !colorful;
    reset();
  }
  if (key == '4') {
    sticky = !sticky;
    reset();
  }
  if (key == '5') {
    toCenter = !toCenter;
    reset();
  }
}
