package it.dping.cloudvendingmachines.DTO;

import java.io.Serializable;

public class ProductDTO implements Serializable {
    private Long id_contains;
    private Long ref_machine;
    private Long id_product;
    private int qty;
    private int qty_stock;
    private String slot;
    private Double price;
    private String description;
    private String image;
    private boolean cup;

    public ProductDTO() {
    }

    public ProductDTO(Long id_contains, Long ref_machine, Long id_product, int qty, int qty_stock, String slot, Double price, String description, String image, boolean cup) {
        this.id_contains = id_contains;
        this.ref_machine = ref_machine;
        this.id_product = id_product;
        this.qty = qty;
        this.qty_stock = qty_stock;
        this.slot = slot;
        this.price = price;
        this.description = description;
        this.image = image;
        this.cup = cup;
    }

    public Long getId_contains() {
        return id_contains;
    }

    public void setId_contains(Long id_contains) {
        this.id_contains = id_contains;
    }

    public Long getRef_machine() {
        return ref_machine;
    }

    public void setRef_machine(Long ref_machine) {
        this.ref_machine = ref_machine;
    }

    public Long getId_product() {
        return id_product;
    }

    public void setId_product(Long id_product) {
        this.id_product = id_product;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getQty_stock() {
        return qty_stock;
    }

    public void setQty_stock(int qty_stock) {
        this.qty_stock = qty_stock;
    }

    public String getSlot() {
        return slot;
    }

    public void setSlot(String slot) {
        this.slot = slot;
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
        return "ProductDTO{" +
                "id_contains=" + id_contains +
                ", ref_machine=" + ref_machine +
                ", id_product=" + id_product +
                ", qty=" + qty +
                ", qty_stock=" + qty_stock +
                ", slot='" + slot + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", cup=" + cup +
                '}';
    }
}
