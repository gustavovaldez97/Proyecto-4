import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
int count=0;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_EYE);

  video.start();
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );
  switch(count){
    case 1:
    filter(THRESHOLD);
    break;
    case 2:
    filter(GRAY);
    break;
    case 3:
    filter(INVERT);
    break;
    case 4:
    filter(POSTERIZE, 4);
    break;
    case 5:
    filter(BLUR, 6);
    break;
    default:
    break;
  }
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] eyes = opencv.detect();

  for (int i = 0; i < eyes.length; i++) {
    if(count >=5 ){
      count=0;
    }else {
      count++;
    }
  }
}
