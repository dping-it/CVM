package it.dping.cloudvendingmachines.service.exception;


public class UserNotFoundException extends NotFoundException {
    public UserNotFoundException(Long id) {
        super("Impossibile trovare l'utente con id:"+id);
        // TODO Auto-generated constructor stub
    }

    public UserNotFoundException(String username) {
        super("Impossibile trovare l'utente con username:"+username);
        // TODO Auto-generated constructor stub
    }
}
