package it.dping.cloudvendingmachines.model;

public class Product {
    private Long id_product;
    private Double price;
    private String description;
    private String image;
    private boolean cup;

    public Product() {
    }

    public Product(Long id_product, Double price, String description, String image, boolean cup) {
        this.id_product = id_product;
        this.price = price;
        this.description = description;
        this.image = image;
        this.cup = cup;
    }

    public Long getId_product() {
        return id_product;
    }

    public void setId_product(Long id_product) {
        this.id_product = id_product;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isCup() {
        return cup;
    }

    public void setCup(boolean cup) {
        this.cup = cup;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id_product=" + id_product +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", cup=" + cup +
                '}';
    }
}
