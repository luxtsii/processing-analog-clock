void setup(){
  size(250,250);
  
  
  // gets centre of screen
  midx = width/2;
  midy = height/2;
  
  points = new PVector[12];
  shortHand = new PVector[2];
  longHand = new PVector[2];
  secondHand = new PVector[2];
  
  shortHand[0] = new PVector(midx, midy);
  longHand[0] = new PVector(midx, midy);
  secondHand[0] = new PVector(midx, midy);
  
  // gets the points for the clock times
  for(int x = 0; x < 12; x++){
    float xPos = midx + 100 * cos(radians((360/12) * x));
    float yPos = midy + 100 * sin(radians((360/12) * x));

    points[x] = new PVector(xPos, yPos);
  }
}

int midx, midy;
PVector[] points;

PVector[] secondHand;
PVector[] shortHand;
PVector[] longHand;
int second, min, hour;

void draw(){
  background(255);
  
  min = minute();
  hour = hour();
  second = second();
  
  // 12 hour time
  if (hour > 12)
    hour-=12;

  // gets where the hands should be pointing
  shortHand[1] = minuteToPoint(midx, midy, min, 75);
  longHand[1] = hourToPoint(midx, midy, hour, 60);
  secondHand[1] = secondToPoint(midx, midy, second, 90);
  
  // draws the middle point
  drawPoint(midx, midy, 3);
  
  for (PVector vec : points){
   drawPoint(round(vec.x), round(vec.y), 3); 
  }
  
  line(shortHand[0].x, shortHand[0].y, shortHand[1].x, shortHand[1].y);
  line(longHand[0].x, longHand[0].y, longHand[1].x, longHand[1].y);
  line(secondHand[0].x, secondHand[0].y, secondHand[1].x, secondHand[1].y);
}

// draws a square of width pointWidth
void drawPoint(int xPos, int yPos, int pointWidth){
  for(int x = -pointWidth; x <= pointWidth; x++){
   for (int y = -pointWidth; y <= pointWidth; y++){
     point(x + xPos, y + yPos);
   }
  }
}


// translates the current minute to a point on the circle
PVector secondToPoint(int originX, int originY, int time, int radius){
  float xPos = originX + radius * cos(radians((360/60) * time) - HALF_PI);
  float yPos = originY + radius * sin(radians((360/60) * time) - HALF_PI);
  
  return new PVector(xPos, yPos);
}

// translates the current minute to a point on the circle
PVector minuteToPoint(int originX, int originY, int time, int radius){
  float xPos = originX + radius * cos(radians((360/60) * time) - HALF_PI);
  float yPos = originY + radius * sin(radians((360/60) * time) - HALF_PI);
  
  return new PVector(xPos, yPos);
}

// translates the current hour to a point on the circle
PVector hourToPoint(int originX, int originY, int time, int radius){
  float xPos = originX + radius * cos(radians((360/12) * time) - HALF_PI);
  float yPos = originY + radius * sin(radians((360/12) * time) - HALF_PI);
  
  return new PVector(xPos, yPos);
}
