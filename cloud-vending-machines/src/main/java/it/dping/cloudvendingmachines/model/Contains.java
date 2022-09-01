package it.dping.cloudvendingmachines.model;

public class Contains {
    private Long id_contains;
    private Long ref_machine;
    private Long ref_product;
    private int qty;
    private int qty_slot;
    private String slot;

    public Contains() {
    }

    public Contains(Long id_contains, Long ref_machine, Long ref_product, int qty, int qty_slot, String slot) {
        this.id_contains = id_contains;
        this.ref_machine = ref_machine;
        this.ref_product = ref_product;
        this.qty = qty;
        this.qty_slot = qty_slot;
        this.slot = slot;
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

    public Long getRef_product() {
        return ref_product;
    }

    public void setRef_product(Long ref_product) {
        this.ref_product = ref_product;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getQty_slot() {
        return qty_slot;
    }

    public void setQty_slot(int qty_slot) {
        this.qty_slot = qty_slot;
    }

    public String getSlot() {
        return slot;
    }

    public void setSlot(String slot) {
        this.slot = slot;
    }

    @Override
    public String toString() {
        return "Contains{" +
                "id_contains=" + id_contains +
                ", ref_machine=" + ref_machine +
                ", ref_product=" + ref_product +
                ", qty=" + qty +
                ", qty_slot=" + qty_slot +
                ", position='" + slot + '\'' +
                '}';
    }
}
