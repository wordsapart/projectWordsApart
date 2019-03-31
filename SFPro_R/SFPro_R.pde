import processing.sound.*;

int lastMouseClickX, lastMouseClickY;

Word[] words;

void setup() {
  //pixelDensity(displayDensity()); // Not supported by the Android runner
  //noCursor();
  size(1200, 1920);
  
  // Text color: white, full opacity
  //fill(0, 0, 0, 225);
  fill(255, 255, 255, 225);
  
  PFont MyFont = loadFont("SFProText-Regular-48.vlw");
  //PFont MyFont = loadFont("MinionPro-Regular-48.vlw");
  //PFont MyFont = loadFont("MinionPro-Regular-36.vlw");
  
  
  // Words. Arguments: text, x, y, text size, sound file. 
  words = new Word[] {
    new Word("įbridęs", 500, 240, 48, new SoundFile(this, "R01.wav"), MyFont),
    new Word("vidury", 500, 300, 48, new SoundFile(this, "R02.wav"), MyFont), 
    new Word("upės", 500, 360, 48, new SoundFile(this, "R03.wav"), MyFont), 
    
    //new Word("įbridęs", 540, 220, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("vidury", 540, 280, 36, new SoundFile(this, "blah.wav"), MyFont), 
    //new Word("upės", 540, 340, 36, new SoundFile(this, "blah.wav"), MyFont), 
    
    new Word("stovi", 500, 480, 48, new SoundFile(this, "R04.wav"), MyFont),
    new Word("žmogus", 500, 540, 48, new SoundFile(this, "R05.wav"), MyFont),
    
    //new Word("stovi", 540, 460, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("žmogus", 540, 520, 36, new SoundFile(this, "blah.wav"), MyFont),
    
    new Word("atrodo", 500, 660, 48, new SoundFile(this, "R06.wav"), MyFont),
    new Word("niekas", 500, 720, 48, new SoundFile(this, "R07.wav"), MyFont),
    new Word("jam", 500, 780, 48, new SoundFile(this, "R08.wav"), MyFont),
    new Word("lyg", 500, 850, 48, new SoundFile(this, "R09.wav"), MyFont),
    new Word("nerūpi", 500, 900, 48, new SoundFile(this, "R10.wav"), MyFont),
    
    //new Word("atrodo", 540, 640, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("niekas", 540, 700, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("jam", 540, 760, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("lyg", 540, 820, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("nerūpi", 540, 880, 36, new SoundFile(this, "blah.wav"), MyFont),
    
    new Word("ramus", 500, 1020, 48, new SoundFile(this, "R11.wav"), MyFont),
    new Word("stovi", 500, 1080, 48, new SoundFile(this, "R12.wav"), MyFont),
    new Word("jis", 500, 1140, 48, new SoundFile(this, "R13.wav"), MyFont),
    new Word("ir", 500, 1200, 48, new SoundFile(this, "R14.wav"), MyFont),
    new Word("nejudėdamas", 500, 1260, 48, new SoundFile(this, "R15.wav"), MyFont),
    new Word("žiūri", 500, 1320, 48, new SoundFile(this, "R16.wav"), MyFont),
    
    //new Word("ramus", 540, 1000, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("stovi", 540, 1060, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("jis", 540, 1120, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("ir", 540, 1180, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("nejudėdamas", 540, 1240, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("žiūri", 540, 1300, 36, new SoundFile(this, "blah.wav"), MyFont),
   
    new Word("kaip", 500, 1440, 48, new SoundFile(this, "R17.wav"), MyFont),
    new Word("juda", 500, 1500, 48, new SoundFile(this, "R18.wav"), MyFont),
    new Word("plūdė", 500, 1560, 48, new SoundFile(this, "R19.wav"), MyFont),
    new Word("kaip", 500, 1620, 48, new SoundFile(this, "R20.wav"), MyFont),
    new Word("plaukia", 500, 1680, 48, new SoundFile(this, "R21.wav"), MyFont),
    new Word("rūkas", 500, 1740, 48, new SoundFile(this, "R22.wav"), MyFont),
    
    //new Word("kaip", 540, 1420, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("juda", 540, 1480, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("plūdė", 540, 1540, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("kaip", 540, 1600, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("plaukia", 540, 1660, 36, new SoundFile(this, "blah.wav"), MyFont),
    //new Word("rūkas", 540, 1720, 36, new SoundFile(this, "blah.wav"), MyFont),
  };
}

void draw() {
  background(0, 49, 83);
  //background(255, 255, 255);
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
