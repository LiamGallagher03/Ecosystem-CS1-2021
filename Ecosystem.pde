ArrayList<Blob> blobs = new ArrayList();
ArrayList<Food> foods = new ArrayList();
ArrayList<Blue> blues = new ArrayList();
ArrayList<Red> reds = new ArrayList();
String mode = "";

public void setup() {
  size(900, 900);
}

public void draw() {
  background(200);

  for (Blob blob : blobs) {
    if (!blob.isActive()) continue;
    
    for (Food food : foods) {
      blob.blobVsFood(food);
    }
    
    blob.move();
    blob.draw();
  }
  for (Food food : foods) {
    if (!food.isActive()) continue;
    
    food.draw();
  }
  for (Blue blue : blues) {
    if (!blue.isActive()) continue;
    
    for (Food food : foods) {
      blue.blobVsFood(food);
    }
    
    for (Red red : reds) {
      blue.fight(red);
    }
    
    blue.draw();
    blue.move();
    
  }
  for (Red red : reds) {
    if (!red.isActive()) continue;
    
    for (Food food : foods) {
      red.blobVsFood(food);
    }
    
    red.draw();
    red.move();
  }
  
  takeOutTheTrash();
}

private void takeOutTheTrash() {
  ArrayList<Blob> trash = new ArrayList();
  for (Blob blob : blobs) {
    if (!blob.isActive()) trash.add(blob);
  }
  blobs.remove(trash);
  
  ArrayList<Food> trashFood = new ArrayList();
  for (Food food : foods) {
    if (!food.isActive()) trashFood.add(food);
  }
  foods.remove(trashFood);
  
  ArrayList<Blue> trashBlue = new ArrayList();
  for (Blue blue : blues) {
    if (!blue.isActive()) trashBlue.add(blue);
  }
  
  ArrayList<Red> trashRed = new ArrayList();
  for (Red red : reds) {
    if (!red.isActive()) trashRed.add(red);
  }
}

//1. Spawn Reds and Blues, not Blobs
public void mouseReleased() {
  if (mode.equals("blob")) {
    Blob newBlob = new Blob(mouseX, mouseY, #FF00FF, 30);
    blobs.add(newBlob);
  }
  else if (mode.equals("food")) {
    Food newFood = new Food(mouseX, mouseY);
    foods.add(newFood);
  }
  else if (mode.equals("blue")) {
    Blue newBlue = new Blue(mouseX, mouseY);
    blues.add(newBlue);
}
  else if (mode.equals("red")) {
    Red newRed = new Red(mouseX, mouseY);
    reds.add(newRed);
  }
}
public void keyPressed() {
  if (keyCode == 70) {
    mode = "food";
    System.out.println("food mode");
  } else if (keyCode == 66) {
    mode = "blob";
  }
    else if (keyCode == 49) {
      mode = "blue";
    }
    else if (keyCode == 50) {
      mode = "red";
    }
}
