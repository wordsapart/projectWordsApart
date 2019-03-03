import processing.sound.*;

int lastMouseClickX, lastMouseClickY;

Word[] words;

void setup() {
  //pixelDensity(displayDensity()); // Not supported by the Android runner
  //noCursor();
  size(1200, 1920);
  
  // Text color: white, full opacity
  fill(255, 255, 255, 255);
  
  // Words. Arguments: text, x, y, text size, sound file. 
  words = new Word[] {
    new Word("rūkas", width/2, height/2, 48, new SoundFile(this, "blah.wav")), 
    new Word("plūduriuodamas", width/2, height/2-200, 48, new SoundFile(this, "blah.wav")), 
    new Word("stovi", width/2, height/2+200, 48, new SoundFile(this, "blah.wav"))
  };
}

void draw() {
  background(0, 49, 83);
  for (Word word : words) {
    word.draw();  
  }
}

void mouseDragged() {
  for (Word word : words) {
    word.drag(); 
  }
}

void mouseReleased() {
  for (Word word : words) {
    word.release();
  }
}

void mousePressed() {
  lastMouseClickX = mouseX;
  lastMouseClickY = mouseY;
  
  for (Word word : words) {
    word.pressed();
  }
}
