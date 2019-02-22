import processing.sound.*;


class Word {
  String text;
  int x, y;
  float size; 
  final int width, height;
  boolean isDragged;
  SoundFile soundFile;
  int mouseXDiff, mouseYDiff;
  
  public Word(String text, int x, int y, float size, SoundFile soundFile) {
    this.text = text;
    this.x = x;
    this.y = y;
    this.size = size;
    textSize(size);
    this.height =  (int)textAscent(); //(int)size;
    this.width = (int)textWidth(text);
    this.soundFile = soundFile;
  }
  
  public void draw() {
    fill(0);
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
    return mouseX >= x && mouseX <= (x + width) 
    && mouseY >= y - height && mouseY <= (y);
  }
}
