import processing.sound.*;

int lastMouseClickX, lastMouseClickY;
int margin = 10;
int idleSecondsForScreenshot = 2;
String screenshotPath = detectSdCardPath();
boolean enableEnergySaving = true;

boolean screenshotSaved = true; // do not make a screenshot on loading the app
long lastInteraction = millis();
long idleMillis = idleSecondsForScreenshot * 1000;
boolean idle;

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
    new Word("įbridęs", 500, 240, 48, new SoundFile(this, "R_01_Delay2.wav"), MyFont, margin),
    new Word("vidury", 500, 300, 48, new SoundFile(this, "R_02_Delay2.wav"), MyFont, margin), 
    new Word("upės", 500, 360, 48, new SoundFile(this, "R_03_Delay2.wav"), MyFont, margin), 
    
    //new Word("įbridęs", 540, 220, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("vidury", 540, 280, 36, new SoundFile(this, "blah.wav"), MyFont, margin), 
    //new Word("upės", 540, 340, 36, new SoundFile(this, "blah.wav"), MyFont, margin), 
    
    new Word("stovi", 500, 480, 48, new SoundFile(this, "R_04_Delay2.wav"), MyFont, margin),
    new Word("žmogus", 500, 540, 48, new SoundFile(this, "R_05_Delay2.wav"), MyFont, margin),
    
    //new Word("stovi", 540, 460, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("žmogus", 540, 520, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    
    new Word("atrodo", 500, 660, 48, new SoundFile(this, "R_06_Delay2.wav"), MyFont, margin),
    new Word("niekas", 500, 720, 48, new SoundFile(this, "R_07_Delay2.wav"), MyFont, margin),
    new Word("jam", 500, 780, 48, new SoundFile(this, "R_08_Delay2.wav"), MyFont, margin),
    new Word("lyg", 500, 850, 48, new SoundFile(this, "R_09_Delay2.wav"), MyFont, margin),
    new Word("nerūpi", 500, 900, 48, new SoundFile(this, "R_10_Delay2.wav"), MyFont, margin),
    
    //new Word("atrodo", 540, 640, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("niekas", 540, 700, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("jam", 540, 760, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("lyg", 540, 820, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("nerūpi", 540, 880, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    
    new Word("ramus", 500, 1020, 48, new SoundFile(this, "R_11_Delay2.wav"), MyFont, margin),
    new Word("stovi", 500, 1080, 48, new SoundFile(this, "R_12_Delay2.wav"), MyFont, margin),
    new Word("jis", 500, 1140, 48, new SoundFile(this, "R_13_Delay2.wav"), MyFont, margin),
    new Word("ir", 500, 1200, 48, new SoundFile(this, "R_14_Delay2.wav"), MyFont, margin),
    new Word("nejudėdamas", 500, 1260, 48, new SoundFile(this, "R_15_Delay2.wav"), MyFont, margin),
    new Word("žiūri", 500, 1320, 48, new SoundFile(this, "R_16_Delay2.wav"), MyFont, margin),
    
    //new Word("ramus", 540, 1000, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("stovi", 540, 1060, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("jis", 540, 1120, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("ir", 540, 1180, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("nejudėdamas", 540, 1240, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("žiūri", 540, 1300, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
   
    new Word("kaip", 500, 1440, 48, new SoundFile(this, "R_17_Delay2.wav"), MyFont, margin),
    new Word("juda", 500, 1500, 48, new SoundFile(this, "R_18_Delay2.wav"), MyFont, margin),
    new Word("plūdė", 500, 1560, 48, new SoundFile(this, "R_19_Delay2.wav"), MyFont, margin),
    new Word("kaip", 500, 1620, 48, new SoundFile(this, "R_20_Delay2.wav"), MyFont, margin),
    new Word("plaukia", 500, 1680, 48, new SoundFile(this, "R_21_Delay2.wav"), MyFont, margin),
    new Word("rūkas", 500, 1740, 48, new SoundFile(this, "R_22_Delay2.wav"), MyFont, margin),
    
    //new Word("kaip", 540, 1420, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("juda", 540, 1480, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("plūdė", 540, 1540, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("kaip", 540, 1600, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("plaukia", 540, 1660, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
    //new Word("rūkas", 540, 1720, 36, new SoundFile(this, "blah.wav"), MyFont, margin),
  };
}

void draw() {
  if (!screenshotSaved && (millis() - lastInteraction) > idleMillis) {
    screenshotSaved = true;
    saveScreenshot();
  }
  
  if (enableEnergySaving && idle) return;
  
  background(0, 49, 83);
  
  for (int i = 0, n = words.length; i < n; i++) {
    words[i].draw();
  }
}

void mouseReleased() {
  for (int i = 0, n = words.length; i < n; i++) {
    words[i].dragStopped();
  }
  idle = true;
}

void mouseDragged() {
  updateLastInteraction();
  idle = false;
}

void mousePressed() {
  updateLastInteraction();
  lastMouseClickX = mouseX;
  lastMouseClickY = mouseY;
  
  for (int i = 0, n = words.length; i < n; i++) {
    words[i].pressed();
  }
  idle = false;
}

private void updateLastInteraction() {
  lastInteraction = millis();
  screenshotSaved = false;
}

private void saveScreenshot() {
  String name = year() + "-" + String.format("%02d", month()) + "-" + String.format("%02d", day()) + " " + 
  String.format("%02d", hour()) + "." + String.format("%02d", minute()) + "." + String.format("%02d", second());
  saveFrame(screenshotPath + name + ".png");
}

// Try to detect the SD card path by checking a number of standard paths
private String detectSdCardPath() {
  String[] candidates = new String[] {
    System.getenv("EXTERNAL_STORAGE"),
    System.getenv("SECONDARY_STORAGE"),
    "/storage/sdcard0",
    "/storage/extSdCard", 
    "/mnt/sdcard",
    "/mnt/external_sd"
  };
  for (String candidate : candidates) {
    try {
      if (new File(candidate).exists()) {
        if (!candidate.endsWith("/")) {
          candidate = candidate + '/';
        }
        return candidate;
      }
    } catch (Exception e) {
      // path invalid
    }
  }
  return "";
}
