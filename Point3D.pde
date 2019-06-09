class Point3D {
  float x, y, z;
  float d;
  
  Point3D (int _x, int _z) {
    x = _x * len / (n - 1);
    z = _z * len / (n - 1);
    d = dist(n/2, n/2, _x, _z);
  }
  
  void show () {
    stroke(255);
    strokeWeight(2);
    point(x, y, z);
  }
  
  void update () {
    y = h * sin((max_d - d)/max_d * PI + off);
  }
}
