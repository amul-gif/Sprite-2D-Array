/* Amulya Mulakala, 3/21/2025 , Modify an existing program to customize a grid-based structure, practicing use of object-oriented programming and 2D array structure and syntax. Document code with comments and create a simple HTML page to embed their Processing sketch and caption it, reinforcing both programming and web development skills. */
// Add a comment to each "//" that you see. 
int cols = 6;  // initalizes the col variable to 6
int rows = 5;  // initializes the rows variable to 5
Sprite[][] sprites; // declares/creates a new 2D array called sprites 

int numFrames = 9;  // initalizes the numFrames variable, which influences the number of frames, to 9
PImage[] spriteFrames; // creates an array of images which alligns with the number of frames in the sprite  
int frameDelay = 20;  // Speed of animation (higher = slower)

void setup() {
  size(500, 500);
  loadSpriteFrames();  //calls the loadSpriteFrames() method and loads each index of the array with a different frame of the sprite. 
  sprites = new Sprite[cols][rows];

  // loads a new Sprite object into every index position of the 2D array; initalizes the 

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * width / cols + width / (cols * 2);
      float y = j * height / rows + height / (rows * 2);
      sprites[i][j] = new Sprite(x, y);
    }
  }
}

void draw() {
  background(0);
  
  // 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

// 
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("rabbit" + i + ".png"); // Ensure images are named _____0.png, _____1.png, etc.
  }
}

// Sprite Class
class Sprite {
  float x, y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 50; // 
  float speedX = 0.75; // 

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // 
    frameCount++;
    if (frameCount % frameDelay == 0) {
        currentFrame = (currentFrame + 1) % numFrames;
    }

    // 
    x += speedX;

    // 
    if (x >= width) {
        x -= width;  // Shift left by one full width to prevent gaps
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);
  }
}
