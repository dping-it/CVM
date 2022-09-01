package it.dping.cloudvendingmachines.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class CrudServiceImpl implements CrudService{


    public static boolean add(String query) {
        ConnectorDB dc = new ConnectorDB();
        try {
            Connection conn = dc.connect();
            Statement st = conn.createStatement();
            st.executeUpdate(query);
            conn.close();
            return true;

        } catch (SQLException e) {
            System.err.println("Errore " + e);
            System.err.print("ERRORE - Creazione dell'entità.");
        }
        return false;
    }


    public static boolean update(String query) {
        ConnectorDB dc = new ConnectorDB();
        try {
            Connection conn = dc.connect();
            Statement st = conn.createStatement();
            st.executeUpdate(query);
            conn.close();
            return true;

        } catch (SQLException e) {
            System.err.println("Errore " + e);
            System.err.print("ERRORE - Aggiornamento dell'entità.");
        }
        return false;
    }

    public static boolean delete(String query) {
        ConnectorDB dc = new ConnectorDB();
        try {
            Connection conn = dc.connect();
            Statement st = conn.createStatement();
            st.executeUpdate(query);
            conn.close();
            return true;

        } catch (SQLException e) {
            System.err.println("Errore " + e);
            System.err.print("ERRORE - Eliminazione dell'entità.");
        }
        return false;
    }

    @Override
    public Object save(Object entity) {
        return null;
    }

    @Override
    public Object update(Object entity) {
        return null;
    }

    @Override
    public void delete(Object entity) {

    }

    @Override
    public boolean deleteById(Long id) {

        return false;
    }

    @Override
    public void deleteInBatch(List entities) {

    }

    @Override
    public Object findById(Long id) {
        return null;
    }

    @Override
    public List findAll() {
        return null;
    }
}
