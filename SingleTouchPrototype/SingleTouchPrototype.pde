import processing.sound.*;

int lastMouseClickX, lastMouseClickY;

Word[] words;

float [] Buffer1;
float [] Buffer2;

// Ripple settings
final float flow = 20;
final float dampening = dampening(flow);
final int background = 20;
final int dropsize = 5;

void setup() {
  //pixelDensity(displayDensity()); // Not supported by the Android runner
  //noCursor();
  size(1200, 1920,P3D);
  
  // Text color: white, full opacity
  fill(255, 255, 255, 255);
  
  Buffer1 = new float[width * height];
  Buffer2 = new float[width * height];
  
  // Words. Arguments: text, x, y, text size, sound file. 
  words = new Word[] {
    new Word("rūkas", width/2, height/2, 48, new SoundFile(this, "blah.wav")), 
    new Word("plūduriuodamas", width/2, height/2-200, 48, new SoundFile(this, "blah.wav")), 
    new Word("stovi", width/2, height/2+200, 48, new SoundFile(this, "blah.wav"))
  };
}

void draw() {
  ripple();
  for (Word word : words) {
    word.draw();  
  }
}

void ripple() {
  loadPixels();
  for (int i = width; i < width * height - width; i++) {
    Buffer2[i] = (
      Buffer1[i - width] + 
      Buffer1[i + width] + 
      Buffer1[i - 1] + 
      Buffer1[i + 1]
    ) / 2 - Buffer2[i];
    
    Buffer2[i] *= dampening;
    pixels[i] = color(Buffer1[i]*100 + background);
  }
  //for (int x = 1; x < width - 1; x++) {
  //  for (int y = 1; y < height - 1; y++) {
  //    Buffer2[x][y] =(
  //      Buffer1[x - 1][y] +
  //      Buffer1[x + 1][y] +
  //      Buffer1[x][y + 1] +
  //      Buffer1[x][y - 1]) / 2 - Buffer2[x][y];

  //    Buffer2[x][y] *= dampening; //dampening(flow);

  //    int index = x + y * width;
  //    pixels[index] = color(Buffer1[x][y]*100 + background);
  //  }
  //}

  float[] temp = Buffer2;
  Buffer2 = Buffer1;
  Buffer1 = temp;

  updatePixels();
}

void mouseDragged() {
  Buffer1[mouseX + mouseY * width] = dropsize;
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
  Buffer1[mouseX + mouseY * width] = 40*dropsize;
  lastMouseClickX = mouseX;
  lastMouseClickY = mouseY;
  
  for (Word word : words) {
    word.pressed();
  }
}

float dampening(float flow) {
  return (1 / (1 + pow((float)Math.E, -(flow/5))));
}
