//shooting stars
Bacteria[] bac = new Bacteria[5];
int click, rad1, rad2;
int points = 5;

void setup()   
{     
  frameRate(15);
  size(800,500);
  background(79, 94, 126);
  for(int i = 0; i < bac.length; i++) {
    bac[i] = new Bacteria();
  }
}   
void draw()   
{    
   for(int i = 0; i < bac.length ; i++) {
     fill((int)(Math.random()*20) + 230,(int)(Math.random()*20) + 224,(int)(Math.random()*20) + 190);
     bac[i].show();
     bac[i].walk();
   }
} 

//code from processing.org's star() function
void star(int x, int y, int radius1, int radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

class Bacteria    
{  
  int myX, myY;
  
  Bacteria() {
    myX = 250;
    myY = 250;
    rad1 = 5;
    rad2 = 10;
  }
  
  void show() {
    star(myX, myY, rad1, rad2, points); 
  }
  
  void walk() {
    //myX = myX + (int)(Math.random()*50) - 25;
    //myY = myY + (int)(Math.random()*50) - 25;
    if(mouseX > myX){
      myX = myX + (int)(Math.random()*20)-5;
    }
    else{
      myX = myX - (int)(Math.random()*20)+5;
    }
    if(mouseY > myY){
      myY = myY + (int)(Math.random()*20)-5;
    }
    else{
      myY = myY - (int)(Math.random()*20)+5;
    }
  }
}  

//resets every 5 clicks
void mouseClicked() {
  points++;
  click++;
  rad1 = (int)(rad1 * 1.5);
  rad2 = (int)(rad2 * 1.5);
  if(click % 5 == 0) {
    background(79, 94, 126);
    points = 5;
    rad1 = 5;
    rad2 = 10;
  }
}
