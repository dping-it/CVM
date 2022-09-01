package it.dping.cloudvendingmachines.service;

import it.dping.cloudvendingmachines.model.User;

public interface UserService <T extends User> {

    T findByCredential(String username, String password);

    User rechargeCredit(Long idUser, Double amount);
}
