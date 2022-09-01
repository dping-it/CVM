package it.dping.cloudvendingmachines.service;

import it.dping.cloudvendingmachines.model.Role;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.service.exception.UserNotFoundException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static it.dping.cloudvendingmachines.model.Role.*;

public class UserServiceImpl implements CrudService<User>, UserService {
    private PasswordHashing passwordHashing=new PasswordHashing();
    private ConnectorDB connectorDB= new ConnectorDB();


    @Override
    public User save(User user)  {
        String role="USER";


        String query = "insert into user (credit, username, password, email, name, mobile, active, role)"
                + " values (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query, Statement.RETURN_GENERATED_KEYS)){
                preparedStmt.setDouble (1, user.getCredit());
                preparedStmt.setString (2, user.getUsername());
                preparedStmt.setString (3, user.getPassword());
                preparedStmt.setString (4, user.getEmail());
                preparedStmt.setString (5, user.getName());
                preparedStmt.setString (6, user.getMobile());
                preparedStmt.setLong (7, user.getActive());
                if(user.getRole()!=null) {
                    preparedStmt.setString(8, user.getRole().toString());
                }else {
                    preparedStmt.setString(8,role);
                }
                preparedStmt.execute();
                ResultSet resultSet= preparedStmt.getGeneratedKeys();
                if (resultSet.next()){
                    user.setId_user(resultSet.getLong(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("Il cliente non aggiunto: "+e);
            }
            return user;
    }

    @Override
    public User update(User user) {
        String role="USER";
        String query = "update user  set credit= ?, username= ?, password= ?, email= ?," +
                " name= ?, mobile= ?, active= ?, role= ? WHERE id_user = ?";

        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){

            preparedStmt.setDouble (1, user.getCredit());
            preparedStmt.setString (2, user.getUsername());
            preparedStmt.setString (3, user.getPassword());
            preparedStmt.setString (4, user.getEmail());
            preparedStmt.setString (5, user.getName());
            preparedStmt.setString (6, user.getMobile());
            preparedStmt.setLong (7, user.getActive());
            if(user.getRole()!=null) {
                preparedStmt.setString(8, user.getRole().toString());
            }else {
                preparedStmt.setString(8,role);
            }
            preparedStmt.setLong (9, user.getId_user());
            preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Il cliente non aggiornato: "+e);
        }
        return user;
    }

    @Override
    public void delete(User entity) {

    }

    @Override
    public boolean deleteById(Long id) {
        String query = "delete user from user where id_user = ?";

        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setDouble (1, id);
            preparedStmt.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Il cliente non aggiunto: "+e);
        }
        return false;
    }

    @Override
    public void deleteInBatch(List<User> entities) {

    }

    @Override
    public User findById(Long id) {
        String query = "select * from user where id_user = ?";
        User user=null;
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setDouble (1, id);

            ResultSet rs = preparedStmt.executeQuery();
            while (rs.next()) {
                user =new User(rs.getLong("id_user"), rs.getDouble("credit"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("name"), rs.getString("mobile"),
                        rs.getLong("active"), decodeRole(rs.getString("role")));
            }
        } catch (SQLException e) {
            UserNotFoundException userNotFoundException = new UserNotFoundException(id);
            userNotFoundException.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> findAll() {
        String query = "select * from user";
        List<User> userList = new ArrayList<>();
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)) {

            ResultSet rs = preparedStmt.executeQuery();
            while (rs.next()) {
                userList.add(new User(rs.getLong("id_user"), rs.getDouble("credit"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("name"), rs.getString("mobile"),
                        rs.getLong("active"), decodeRole(rs.getString("role"))));
            }
        } catch (SQLException e) {
            System.err.println("Errore " + e);
            System.out.print("ERRORE Caricamento dati");
        }
        return userList;
    }

    private Role decodeRole(String s){
        switch (s){
            case "ADMINISTRATOR":
                return ADMINISTRATOR;

            case "SERVICE":
                return SERVICE;

            default:
                return USER;
        }
    }

    @Override
    public User findByCredential(String username, String password) {

        String query = "select * from user where username = ? and password = ?";
        User user=null;
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setString (1, username);
            preparedStmt.setString (2, password);

            ResultSet rs = preparedStmt.executeQuery();
            if (rs.next()) {
                user =new User(rs.getLong("id_user"), rs.getDouble("credit"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("name"), rs.getString("mobile"),
                        rs.getLong("active"), decodeRole(rs.getString("role")));
            }
        } catch (SQLException e) {
            UserNotFoundException userNotFoundException = new UserNotFoundException(username);
            userNotFoundException.printStackTrace();
        }
        return user;
    }

    @Override
    public User rechargeCredit(Long idUser, Double amount) {
        User user= findById(idUser);
        user.setCredit(user.getCredit()+amount);
        return update(user);
    }
}
