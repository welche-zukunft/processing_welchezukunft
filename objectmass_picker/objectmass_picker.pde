import picking.*;

Picker picker;

// A list of objects
ArrayList<Polygon> polygons;
Polygon[] pins;

String teststring = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sollicitudin tincidunt felis eget luctus. Donec posuere, purus id sagittis tristique, est lorem convallis odio, non ultricies nunc ante ac nisl. Suspendisse aliquam, elit ut lobortis scelerisque, neque arcu mollis ante, at interdum ipsum ipsum ut velit. Proin tempor risus vitae urna dignissim cursus. Sed eu porttitor justo. Duis vel urna eget lacus pharetra ultricies ut ac lorem. Nullam varius justo sed lacus aliquam blandit. In gravida gravida odio ut semper. ";
String testheadline = "Headline";

PVector start = new PVector(1920/2,200,-600);

// Three possible shapes
PShape[] shapes = new PShape[3];

boolean wPressed = false, sPressed = false,aPressed = false, dPressed = false, shiftPressed = false,qPressed = false,rPressed = false;
float cameraPosY = -100.;
float cameraPosZ = 200;
float cameraPosX = 300;

float cameraLookX = 0.;
float cameraLookY = 0.;
float cameraLookZ = 115.;
float cameraLookSpeed = 0.5;
int speed = 5;
int count = 500;

boolean move = false;
int num = 0;

void setup() {
  size(1920, 760, P3D);
  smooth(8);
  picker = new Picker(this);
  pins = new Polygon[count];
  
  shapes[0] = createShape(ELLIPSE,0,0,100,100);
  shapes[0].setFill(color(255, 127));
  shapes[0].setStroke(false);
  shapes[1] = createShape(RECT,0,0,100,100);
  shapes[1].setFill(color(255, 127));
  shapes[1].setStroke(false);
  shapes[2] = createShape();  
  shapes[2].beginShape();
  shapes[2].fill(0, 127);
  shapes[2].noStroke();
  shapes[2].vertex(0, -50);
  shapes[2].vertex(14, -20);
  shapes[2].vertex(47, -15);
  shapes[2].vertex(23, 7);
  shapes[2].vertex(29, 40);
  shapes[2].vertex(0, 25);
  shapes[2].vertex(-29, 40);
  shapes[2].vertex(-23, 7);
  shapes[2].vertex(-47, -15);
  shapes[2].vertex(-14, -20);
  shapes[2].endShape(CLOSE);

  // Make an ArrayList
  polygons = new ArrayList<Polygon>();
  
  PGraphics[] canvas = new PGraphics[count]; 
  for(int i=0;i<canvas.length; i++){
    canvas[i]=createGraphics(80, 80, P3D);
  }
  for(int i=0;i<canvas.length; i++){
    canvas[i].beginDraw();
    canvas[i].background(0,0,0);
    canvas[i].stroke(255,255,255);
    canvas[i].text("test"+str(i)+str(i)+str(i)+str(i)+teststring,10,10,70,70);
    canvas[i].endDraw();
  }
  
  
  for (int i = 0; i < count; i++) {            
     /*Polygon p = new Polygon(shapes[1],canvas[i],i);        // Use corresponding PShape to create Polygon
     polygons.add(p);*/
     pins[i] = new Polygon(shapes[1],canvas[i]);
  }


  
}

void draw() {
  background(102);
  if(wPressed == true){
      cameraPosZ = cameraPosZ - speed;
    }
     if(sPressed == true){
      cameraPosZ = cameraPosZ + speed;
    }
     if(aPressed == true){
      cameraPosX -= speed/5;
    }
     if(dPressed == true){
      cameraPosX += speed/5;
    } 
    if(qPressed == true){
      cameraPosY -= speed/5.;
    }
     if(rPressed == true){
      cameraPosY += speed/5.;
    } 
  
   camera(cameraPosX, cameraPosY,  cameraPosZ, cameraPosX, cameraPosY,cameraPosZ-300,0.0, 1.0, 0.0);  
  if (move == true){
    //println(num);
    pins[num].x = mouseX;
    pins[num].y = mouseY;   
    //println(cubes[num].x,cubes[num].y);
  }
  
  // Display and move them all
  /*for (Polygon poly : polygons) {
    poly.display();
    //poly.move();
  }*/

  for (int j = 0; j < pins.length; j++) {
    
    pins[j].display(j);
    
  }

  surface.setTitle(str(int(frameRate))+ " / " + str(cameraPosX)+','+str(cameraPosY)+','+str(cameraPosZ));
}


void keyPressed() {
  if      (key == 'w')       wPressed = true;
  else if (key == 's')       sPressed = true;
  else if (key == 'a')       aPressed = true;
  else if (key == 'd')       dPressed = true;
  else if (key == 'q')       qPressed = true;
  else if (key == 'r')       rPressed = true;

}

void keyReleased() {
  if      (key == 'w')       wPressed = false;
  else if (key == 's')       sPressed = false;  
  else if (key == 'a')       aPressed = false;
  else if (key == 'd')       dPressed = false; 
  else if (key == 'q')       qPressed = false; 
  else if (key == 'r')       rPressed = false; 
}

void mousePressed() {
  
  int id = picker.get(mouseX, mouseY);
  println("ID: " + id);
  if (id > -1 && id < pins.length) {
    //cubes[id].changeColor();
    move = true;
    num = id;
  }
}

void mouseReleased(){
  if(move == true){
   move = false; 
  }
}