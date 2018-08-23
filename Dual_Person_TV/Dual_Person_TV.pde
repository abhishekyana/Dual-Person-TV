import processing.serial.*;
Serial myPort;  // Create object from Serial class

/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage[] img = new PImage[2];  // Declare variable "a" of type PImage
int frameNum = 0;
char state[] = {'0', '1'};
int sizeR=400;
void setup() {
  size(400, 400);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  String portName = Serial.list()[4]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 115200);
  img[0] = loadImage("flower.jpg");  // Load the image into the program
  img[1] = loadImage("lion.jpg");  // Load the image into the program
  img[1].resize(sizeR,sizeR);
  img[0].resize(sizeR,sizeR);
  frameRate(24);
}

void draw() {
  frameNum++;
  frameNum %= img.length;    
  myPort.write(state[frameNum]);
  //delay(3);
  image(img[frameNum], 0, 0);
}