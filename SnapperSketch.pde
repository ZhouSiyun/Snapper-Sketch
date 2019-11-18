import processing.video.*;
import processing.sound.*;

PImage pic;
PImage pic_duck;
Capture cam;
AudioIn input;
Amplitude loudness;
boolean flag = false;
String[] lines;
BufferedReader  bfReader;
int count;


void setup(){
  size(1000, 450);
  startCamera();
  startAudio();
  frameRate(65);
  pic_duck = loadImage("pic.png");
}

void draw(){
  background(#ffcc00);
  image(pic_duck, 720, 140, 200, 200);
  textSize(30);
  fill(#b36b00);
  text("Snap To Take A Photo.", 650, 50); 
  image(cam,20,20, 600, 400);
  input.amp(0.5);
  // the vol of the sound
  float volume = loudness.analyze();
  int size = int(map(volume, 0, 0.5, 1, 350));
  savePic(cam, size);
}

void startCamera(){
  // Gain all cameras.
  String[] cameras = Capture.list();
  if (cameras.length != 0){
    cam  = new Capture(this, cameras[0]);
    cam.start();
  }
}

void startAudio(){
  // Gain sounds.
  input = new AudioIn(this,0);
  input.start();
  // Analysissing sounds.
  loudness = new Amplitude(this);
  loudness.input(input);
}

void captureEvent(Capture cam){
  cam.read();
}

void savePic(Capture cam, float size){
  if(size > 80 && flag == false){
    count = getCount();
    print("flag:" + count);
    count++;
    flag = true;
    pic = cam;
    String picName = "pic"+ count +".jpeg";
    pic.save(dataPath(picName));
    frameRate(1);
    textSize(30);
    fill(#ffff00);
    text("PHOTO SAVED!", 700, 110); 
    println("PHOTO SAVED!  COUNT:"+count);
    savePicInfo(count);
  }
  
  if (size < 10 ) {
    frameRate(65);
    textSize(30);
    fill(#ffffff);
    text("No PHOTO SAVED!", 680, 110); 
    flag = false;
  }
}

void savePicInfo(int count){
  if(lines == null){
    lines = new String[1];
    lines[0] = "The number of photos:" + count;
  } else {
    lines = append(lines, "The number of photos:" + count);
  }
  saveStrings(dataFile("count.txt"),lines);
}

int getCount() {
  File f = dataFile("count.txt");
  boolean exist = f.isFile();
  println(exist);
  if (exist == true) {
    println("123");
    String[] lines = loadStrings("count.txt");
    String temp = lines[lines.length-1];
    println(temp);
    
    if (temp != null) {
      String[] pieces = split(temp, ':');
      count = int(pieces[pieces.length-1]);
    }
  } 
  return count;
}
