void settings() {
  size(600,600);
}

public static ArrayList<Star> stars;

public static final int STAR_COUNT = 500;
public static final float STAR_SIZE_MIN = 1;
public static final float STAR_SIZE_MAX = 3;

public static float starSpeed;
public static float angleSpeed;
public static boolean lightspeed;

public static boolean spiral = false;
public static boolean trails = true;
public static boolean colorful = false;
public static boolean sticky = false;
public static boolean toCenter = false;

void setup() {
  reset();
}

void enterLightspeed() {
  starSpeed = 0.01;
  if (spiral) angleSpeed = 0.01;
}

void reset() {
  stars = new ArrayList();
  starSpeed = 0;
  angleSpeed = 0;
  
  fill(0);
  rect(0,0,width,height);
  
  for (int i = 0; i < STAR_COUNT; i++) {
    stars.add(new Star());
  }
  
  for (Star star : stars) {
    star.display();
  }
}

void draw() { 
  if (!trails) {
    fill(0);
    rect(0,0,width,height);
  }
  
  for (Star star : stars) {
    star.move(starSpeed, starSpeed / 100, angleSpeed);
    star.display();
  }
  starSpeed *= 1.05;
  if (angleSpeed < 0.01) angleSpeed *= 1.01;
}
