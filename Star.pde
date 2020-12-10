public class Star {
  
  private PVector position;
  private float size;
  private float angle;
  private PVector rgb;

  public Star() {
    position = new PVector(random(0, width), random(0, height));
    size = random(STAR_SIZE_MIN, STAR_SIZE_MAX);
    angle = findAngle(position, new PVector(width/2, height/2));
    if (toCenter) angle -= HALF_PI;
    else angle += HALF_PI;
    if (colorful) rgb = new PVector(random(100, 255), random(100, 255), random(100, 255));
    else rgb = new PVector(255, 255, 255);
  }
  
  public void move(float dist, float sizeChange, float angleChange) {
    if (!nearCenter(10)) {
      size += sizeChange;
      angle += angleChange;
      PVector d = PVector.fromAngle(angle);
      d.setMag(dist);
      PVector p = new PVector(position.x, position.y);
      position = new PVector(p.x + d.x, p.y + d.y);
    }
  }
  
  private boolean nearCenter(float threshold) {
    boolean before = position.x > (width / 2) - threshold;
    boolean after = position.x < (width / 2) + threshold;
    boolean below = position.y > (height / 2) - threshold;
    boolean above = position.y < (height / 2) + threshold;
    return before && after && below && above && sticky;
  }
  
  public void display() {
    fill(rgb.x, rgb.y, rgb.z);
    circle(position.x, position.y, size);
  }
}
