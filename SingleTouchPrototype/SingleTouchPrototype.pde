import processing.sound.*;

int lastMouseClickX, lastMouseClickY;

Word[] words;

void setup() {
  pixelDensity(displayDensity());
  //noCursor();
  size(400, 400);
  
  words = new Word[] {
    new Word("blah", 10, 20, 12, new SoundFile(this, "blah.wav")), 
    new Word("blah", 30, 50, 16, new SoundFile(this, "blah.wav")), 
    new Word("blah", 60, 100, 20, new SoundFile(this, "blah.wav"))
  };
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  for (Word word : words) {
    word.draw();  
  }
}

void mouseDragged() 
{
  for (Word word : words) {
    word.drag(); 
  }
}

void mouseReleased() {
  for (Word word : words) {
    word.release();
  }
}

void mouseClicked() { 
  for (Word word : words) {
    word.clicked();
  }
}

void mousePressed() {
  lastMouseClickX = mouseX;
  lastMouseClickY = mouseY;
  
  for (Word word : words) {
    word.pressed();
  }
}
 
