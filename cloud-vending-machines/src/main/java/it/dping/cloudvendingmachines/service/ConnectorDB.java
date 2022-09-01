package it.dping.cloudvendingmachines.service;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectorDB {
    DataSource ds=null;

    public ConnectorDB() {
        Context ctx = null;
        try {
            ctx = new InitialContext();
            this.ds = (DataSource) ctx.lookup("java:comp/env/jdbc/proietto");
        } catch (NamingException ex) {
            System.out.println("Impossibile inizializare la connessione dal DATASOURCE");
            ex.printStackTrace();
        }

    }

    public Connection connect () throws SQLException {
        Connection conn = null;
            conn = ds.getConnection();
            return conn;
    }

}
