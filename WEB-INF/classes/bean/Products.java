package bean;
import java.io.Serializable;

public class Products implements Serializable{
    private int id;
    private String seller;
    private String name;
    private String category;
    private String imageFileName;
    private float price;
    private int availableQty;
    private String description;

    public Products(int id, String seller, String name, String category, String imageFileName, float price, int availableQty, String description){
        this.id = id;
        this.seller = seller;
        this.name = name;
        this.category = category;
        this.imageFileName = imageFileName;
        this.price = price;
        this.availableQty = availableQty;
        this.description = description;
    }

    public Products(int id, String name, String category, String imageFileName, float price, int availableQty, String description){
        this.id = id;
        this.name = name;
        this.category = category;
        this.imageFileName = imageFileName;
        this.price = price;
        this.availableQty = availableQty;
        this.description = description;
    }

    public Products(String name, String category, float price, int availableQty, String description){
        this.name = name;
        this.category = category;
        this.price = price;
        this.availableQty = availableQty;
        this.description = description;
    }

    public Products() {

    }

    public int getId() {
        return id;
    }

    public String getSeller() {
        return seller;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getImageFileName(){
        return imageFileName;
    }

    public float getPrice() {
        return price;
    }


    public int getAvailableQty() {
        return availableQty;
    }

    public String getDescription() {
        return description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setImageFileName(String imageFileName){
        this.imageFileName = imageFileName;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setAvailableQty(int availableQty) {
        this.availableQty = availableQty;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}