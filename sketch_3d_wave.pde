import peasy.*;

int len = 200;
int h = 50;
int n = 100;
float max_d;
float off = 0;
float ma;

PeasyCam cam;

Point3D[][] points;


void setup () { 
  size(600, 600, P3D);
  colorMode(HSB, 255);
  
  max_d = n * sqrt(0.5);
  ma = atan(cos(QUARTER_PI));
  //cam = new PeasyCam(this, 400);
  
  points = new Point3D[n][n];
  
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      points[i][j] = new Point3D(i+1, j+1);
    }
  }
  
}

void draw () {
  //if (frameCount <= 360) {
    background(0);
    
    translate(width/2 - 10, height/2 - 2 * h);
    rotateX(-ma);
    rotateY(-QUARTER_PI + PI/32);
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        points[i][j].update();  
        //points[i][j].show();
      }
    }
    
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - 1; j++) {
        Point3D p1 = points[i][j];
        Point3D p2 = points[i+1][j];
        Point3D p3 = points[i+1][j+1];
        Point3D p4 = points[i][j+1];
        
        float avg_h = map(p1.y + p2.y + p3.y + p4.y, -4*h, 4*h, 0, 1);
        color c = color(avg_h * 255, 255, 255);
        
        fill(c);
        noStroke();
        
        beginShape(QUADS);
          
        vertex(p1.x, p1.y, p1.z);
        vertex(p2.x, p2.y, p2.z);
        vertex(p3.x, p3.y, p3.z);
        vertex(p4.x, p4.y, p4.z);
          
        endShape();
      }
    }
    
    //saveFrame("img/###.png");
  //} else {
    //exit(); 
  //}
  
  off += radians(1);
}
