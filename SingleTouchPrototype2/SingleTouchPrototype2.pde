import processing.sound.*;

int lastMouseClickX, lastMouseClickY;


Word[] words;

void setup() {
  //pixelDensity(displayDensity());
  //noCursor();
  size(1200, 1920);
  
  words = new Word[] {
    new Word("rūkas", width/2, height/2, 48, new SoundFile(this, "blah.wav")), 
    new Word("plūduriuodamas", width/2, height/2-200, 48, new SoundFile(this, "blah.wav")), 
    new Word("stovi", width/2, height/2+200, 48, new SoundFile(this, "blah.wav"))
  };
}

void draw() {
  //Kam reikalingas stačiakampis?
  fill(0, 49, 83);
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

void mousePressed() {
  lastMouseClickX = mouseX;
  lastMouseClickY = mouseY;
  
  for (Word word : words) {
    word.pressed();
  }
}
 
