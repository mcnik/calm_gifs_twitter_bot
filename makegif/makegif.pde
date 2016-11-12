import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 120;
color startColor;

public void setup() {
  smooth();
  size(400, 400);
  startColor = color(random(0, 255), random(0, 255), random(0, 255));
  gifExport = new GifMaker(this, "export" + startColor +  ".gif", 100);
  gifExport.setRepeat(0); // make it an "endless" animation
  
  stroke(0);
  strokeWeight(5);
}

void draw() {
  background(255);
  //setFillColor(width, 0.0, height, 0.0);
  fill(startColor);
  float size = 100.0 * sin(TWO_PI * frames / float(totalFrames)) + 100.0;
  ellipse(width/ 2.0, height / 2.0, size, size);
  export();
}

void setFillColor(int x, float origin, float target, float offset) {
  float gradientPos = map(x,origin-offset,target-offset,0,1);
  float r = map(gradientPos,0,1,red(startColor), red(startColor));
  float g = map(gradientPos,0,1,green(startColor), green(startColor));
  float b = map(gradientPos,0,1,blue(startColor), blue(startColor));
  fill(color(r,g,b));
}

void export() {
  if(frames < totalFrames) {
    gifExport.setDelay(60);
    gifExport.addFrame();
    frames++;
  } else {
    gifExport.finish();
    frames++;
    println("gif saved");
    exit();
  }
}