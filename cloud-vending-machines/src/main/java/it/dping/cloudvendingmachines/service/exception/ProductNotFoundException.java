package it.dping.cloudvendingmachines.service.exception;


public class ProductNotFoundException extends NotFoundException {
    public ProductNotFoundException(Long id) {
        super("Impossibile trovare il prodotto con id:"+id);
        // TODO Auto-generated constructor stub
    }
}
