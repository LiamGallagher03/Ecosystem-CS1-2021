public class Blue extends Blob {
 public Blue(int x, int y) {
   super(x, y, #0000FF, 20);
 }
 
 public void fight(Red r) {
   if (dist(super.getX(),super.getY(),r.getX(),r.getY()) < (super.getSize() + r.getSize())/2.0) {
     if (getHp() > r.getHp()) {
       r.setActive(false);
     }
     else super.setActive(false);
      }
  }
}
