int movex;
int movey;

boolean stop = false;
int rate = 1;
int fade = 10;

int rar = 0;
int gar = 100;
int bar = 0;
int ch = 1;

int entn = 100000;
int rows =  65;
int col = 80;

int dec = 0;
ArrayList<Runner> ents = new ArrayList<Runner>();

PImage im;

void setup() {
  size(800, 650);
  movex = (width/col+1);
  movey = (height/rows+1);
  for (int i = 0; i<entn; i++) {
    ents.add(new  Runner(int(movex*random(1, col)), int(movey*random(1, rows)), int(random(0, 4))));
    while (ents.get(i).x % movex != 0 || ents.get(i).y % movey != 0) {
      ents.get(i).x = int(movex*random(1, col));
      ents.get(i).y = int(movey*random(1, rows));
    }
  }
  im = loadImage("LOGO.png");
  im.loadPixels();
  background(0);
  frameRate(60);
}

void draw() {
  for (int i = 0; i<entn; i++) {
    if (!stop) {
      if (ents.get(i).x % movex == 0 && ents.get(i).y % movey == 0) {
        dec = int(random(0, 4));
        //while (dec == ents.get(i).d) {

          //dec = int(random(0, 4));
        //}
        ents.get(i).d = dec;
        //dec = 0;
        //System.out.println(ents.get(i).d);
      }
      if (ents.get(i).d == 1) {
        ents.get(i).y-=rate;
      } else  if (ents.get(i).d == 2) {
        ents.get(i).x += rate;
      } else  if (ents.get(i).d == 3) {
        ents.get(i).y+=rate;
      } else {
        ents.get(i).x-=rate;
      }
      if (ents.get(i).x > width || ents.get(i).y > height || ents.get(i).x < 0 || ents.get(i).y < 0) {
        while (ents.get(i).x % movex != 0 || ents.get(i).y % movey != 0) {
          ents.get(i).x = int(movex*random(1, col));
          ents.get(i).y = int(movey*random(1, rows));
        }
      }
      noStroke();



      if (ents.get(i).y * width + ents.get(i).x < 520000 && ents.get(i).y * width + ents.get(i).x > 0) {
        color c = im.pixels[ents.get(i).y * width + ents.get(i).x];

        if (red(c) + green(c) + blue(c) < 255) {
          fill(rar, gar, bar);
        } else {
          if (ch == 0) {
            fill(rar+150, gar, bar);
          } else if (ch== 1) {
            fill(rar, gar+150, bar);
          } else {
            fill(rar, gar, bar+150);
          }
        }
        circle(ents.get(i).x, ents.get(i).y, 1.2);
      }
    }
  }

  if(!stop){
    fill(0, fade);
    rect(0, 0, width, height);
  }
}

void keyPressed() {
  if (key == 'w') {
  }
  if (key == 's') {
  }
  if (key == 'a') {
  }
  if (key == 'd') {
  }
  if (key == 'q') {
    stop = !stop;
  }
  if (key == '1') {
    rar = int(random(100));
    bar = int(random(100));
    gar = int(random(100));
  }
  if (key == '2') {
    if (ch == 2) {
      ch = 0;
    } else {
      ch++;
    }
  }
  if (key == '3') {
    fade++;
  }
  if (key == '4') {
    fade--;
  }
}
