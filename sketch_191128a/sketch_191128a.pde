import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.sound.*;

PImage filtro;
PImage inicio;
PImage instruccion;
int pant;

Capture video;
OpenCV open;
SoundFile sound;
deteccion d;

void setup(){
  size(640,480);
  sound = new SoundFile(this, "fondo.mp3");
  sound.play();
  filtro = loadImage("floress.png");
  inicio = loadImage("imag1.png");
  instruccion = loadImage("imag2.png");
  video = new Capture(this, 640/2, 480/2);
  open = new OpenCV(this, 640/2, 480/2);
  open.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  d = new deteccion();
  video.start();
}

void draw(){
  switch(pant){
    case 0:
    image(inicio,0,0,640,480);
    if(key == ENTER){
      pant = 1;
    }
    break;
    
    case 1:
    image(instruccion,0,0,640,480);
    if(key == 'a' || key == 'A'){
      pant = 2;
    }
    break;
    
    case 2:
    d.imagen();
    d.detec();
    break;
  }
}

void captureEvent(Capture c) {
  c.read();
}
