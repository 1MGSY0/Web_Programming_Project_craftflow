package bean;
import java.io.Serializable;

public class ShoppingCart extends Products implements Serializable{
    private int quantity;

    public ShoppingCart(){
       super();
   }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}