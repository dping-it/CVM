package it.dping.cloudvendingmachines.service.exception;


public class VendingMachineNotFoundException extends NotFoundException {
    public VendingMachineNotFoundException(Long id) {
        super("Impossibile trovare la macchinetta con id:"+id);
        // TODO Auto-generated constructor stub
    }
}
