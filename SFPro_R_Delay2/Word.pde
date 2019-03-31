import processing.sound.*;

class Word {
  final String text;
  final int _width, _height;
  final SoundFile soundFile;
  final PFont font;
  final int margin;
  int x, y;
  final float size; 
  boolean isDragged;
  int mouseXDiff, mouseYDiff;
  
  public Word(String text, int x, int y, float size, SoundFile soundFile, PFont font, int margin) {
    this.text = text;
    this.x = x;
    this.y = y;
    this.size = size;
    this.font = font;
    this.margin = margin;
    textFont(font);
    textSize(size);
    this._height =  (int)textAscent(); //(int)size;
    this._width = (int)textWidth(text);
    this.soundFile = soundFile;
  }
  
  public void draw() {
    if (isDragged) updateLocation();
    textSize(size);
    textFont(font);
    text(text, x, y);  
  }
  
  private void updateLocation() {
    x = clamp(mouseX - mouseXDiff, 0, width - _width);
    y = clamp(mouseY - mouseYDiff, _height, height);
  }
  
  private int clamp(int value, int min, int max) {
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }
  
  public void dragStopped() {
    this.isDragged = false;  
  }
  
  public boolean pressed() {
    if (intersectsMouse()) {
      mouseXDiff = lastMouseClickX - x;
      mouseYDiff = lastMouseClickY - y;
      
      if (!soundFile.isPlaying()) soundFile.play(); 
      isDragged = true;
      return true;
    } 
    return false;
  }
  
  private boolean intersectsMouse() {
    return mouseX >= (x - margin) && mouseX <= (x + _width + margin) 
    && mouseY >= (y - _height - margin) && mouseY <= (y + margin);
  }
}
