import processing.sound.*;


class Word {
  String text;
  int x, y;
  float size; 
  boolean isDragged;
  SoundFile soundFile;
  int mouseXDiff, mouseYDiff;
  
  public Word(String text, int x, int y, float size, SoundFile soundFile) {
    this.text = text;
    this.x = x;
    this.y = y;
    this.size = size;
    this.soundFile = soundFile;
  }
  
  public void draw() {
    fill(255 );
    textSize(this.size);
    text(text, x, y);  
  }
  
  public void drag() {
    if (isDragged) {
      x = mouseX - mouseXDiff;
      y = mouseY - mouseYDiff;
    }
  }
  
  public void pressed() {
    boolean intersectsMouse = intersectsMouse();
    if (intersectsMouse && !isDragged) {
      isDragged = true;
      mouseXDiff = lastMouseClickX - x;
      mouseYDiff = lastMouseClickY - y;
    }
    if (intersectsMouse && !soundFile.isPlaying()) soundFile.play();  
  }
  
  public void release() {
    isDragged = false;
  }
  
  public boolean intersectsMouse() {
    return mouseX >= x && mouseX <= (x + textWidth(text)) 
    && mouseY >= y - size && mouseY <= (y);
  }
}
