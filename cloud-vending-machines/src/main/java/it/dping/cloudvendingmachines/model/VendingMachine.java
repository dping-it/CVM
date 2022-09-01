package it.dping.cloudvendingmachines.model;

import it.dping.cloudvendingmachines.DTO.ProductDTO;

import java.util.HashMap;
import java.util.LinkedList;

public class VendingMachine {
    private Long id_vending_machine;
    private String state;
    private String position;
    private Double balance;
    private boolean working; // Variabile di controllo Starvation

    LinkedList<ProductDTO> productSlots = new LinkedList<>();

    public VendingMachine() {
    }

    public VendingMachine(Long id_vending_machine, String state, String position, Double balance, boolean working) {
        this.id_vending_machine = id_vending_machine;
        this.state = state;
        this.position = position;
        this.balance = balance;
        this.working = working;
    }

    public VendingMachine(Long id_vending_machine, String state, String position, Double balance, boolean working, LinkedList<ProductDTO> productSlots) {
        this.id_vending_machine = id_vending_machine;
        this.state = state;
        this.position = position;
        this.balance = balance;
        this.working = working;
        this.productSlots = productSlots;
    }

    public Long getId_vending_machine() {
        return id_vending_machine;
    }

    public void setId_vending_machine(Long id_vending_machine) {
        this.id_vending_machine = id_vending_machine;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public boolean isWorking() {
        return working;
    }

    public void setWorking(boolean working) {
        this.working = working;
    }

    public LinkedList<ProductDTO> getProductSlots() {
        return productSlots;
    }

    public void setProductSlots(LinkedList<ProductDTO> productSlots) {
        this.productSlots = productSlots;
    }

    @Override
    public String toString() {
        return "VendingMachine{" +
                "id_vending_machine=" + id_vending_machine +
                ", state='" + state + '\'' +
                ", position='" + position + '\'' +
                ", balance=" + balance +
                ", working=" + working +
                ", productSlots=" + productSlots +
                '}';
    }
}
