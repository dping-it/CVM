package it.dping.cloudvendingmachines.service;

import it.dping.cloudvendingmachines.model.Contains;
import it.dping.cloudvendingmachines.model.VendingMachine;


public interface VendingMachineService<T extends VendingMachine> {
    Contains addProductToMachine(Long id_vending_machine, Long ref_product, int qty, int qty_stock, String slot);

    VendingMachine buyProduct(String idMachine, String codProduct);

    Contains updateProductToMachine(Contains contains);

    VendingMachine findByIdCup(Long id, boolean isInCup) ;

    VendingMachine refilProduct(String idMachine, String codProduct);

    void initializeStock(VendingMachine vendingMachine);

    void disconnectMachine(String idMachine);

    VendingMachine setInServiceMode(VendingMachine vendingMachine);

    VendingMachine setInOperativeMode(VendingMachine vendingMachine);

    VendingMachine setWorking(String idMachine);
}
