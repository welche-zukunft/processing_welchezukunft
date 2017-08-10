// A class to describe a Polygon (with a PShape)

class Polygon {
  // The PShape object
  PShape s;

  // The location where we will draw the shape
  float x, y,z;
  // Variable for simple motion
  float speed;
  float scaler = 0.2;
  String content = "test";
  PGraphics pg;
  PShape s1;

  Polygon(PShape s_,PGraphics img) {
    x = random(width);
    y = random(-200, -100); 
    z = 0;//random(-100,100);
    //s = s_;
    
    s = createShape();
    s.beginShape();
    s.normal(0,1,0);
    s.fill(255, 255, 255);
    s.noStroke();
    s.vertex(0, 0);
    s.vertex(0, 5);
    s.vertex(5, 5);
    s.vertex(5, 0);
    s.endShape();

    
    speed = random(2, 6);
    pg = img;
    s1 = createShape();
    s1.beginShape();
    s1.noStroke();
    s1.fill(0,0,0,255);
    s1.vertex(x,0,z);
    s1.vertex(x,y,z);
    s1.vertex(x+1,y,z);
    s1.endShape(CLOSE);
    //s.setTexture(pg);
  }
  
  // Simple motion
  void move() {
    y+=speed/10.;
    if (y > height+100) {
      y = -100;
    }
     for(int i = 1; i <= 2; i++){
      PVector v = s1.getVertex(i);
      v.y = y;
      s1.setVertex(i,v);
    }
  }
  
  // Draw the object
  void display(int j) {
    if(x <= cameraPosX + 300 && x >= cameraPosX - 300){
    pushMatrix();
    translate(x, y, z);
    picker.start(j);
    shape(s);
    //scale(scaler);
    //s.setTexture(pg);
    //shape(s);
    //text(content,x,y,z);
    popMatrix();
    //shape(s1);
    }
  }
  
}