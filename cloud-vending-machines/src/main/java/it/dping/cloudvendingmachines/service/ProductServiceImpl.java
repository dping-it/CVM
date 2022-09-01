package it.dping.cloudvendingmachines.service;

import it.dping.cloudvendingmachines.model.Product;
import it.dping.cloudvendingmachines.service.exception.ProductNotFoundException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements CrudService<Product> {

    private ConnectorDB connectorDB= new ConnectorDB();

    @Override
    public Product save(Product product)  {

        String query = "insert into product (price, description, image, cup)"
                + " values (?, ?, ?)";
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query, Statement.RETURN_GENERATED_KEYS)){
            preparedStmt.setDouble (1, product.getPrice());
            preparedStmt.setString (2, product.getDescription());
            preparedStmt.setString (3, product.getImage());
            preparedStmt.setBoolean (4, product.isCup());
            preparedStmt.execute();
            ResultSet resultSet= preparedStmt.getGeneratedKeys();
            if (resultSet.next()){
                product.setId_product(resultSet.getLong(1));
            }
            System.out.println("Prodotto aggiunto con successo!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Prodotto non aggiunta: "+e);
        }
        return product;
    }

    @Override
    public Product update(Product product) {

        String query = "update product  set price= ?, description= ?, image= ?, cup= ? WHERE id_product = ?";

        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){

            preparedStmt.setDouble (1, product.getPrice());
            preparedStmt.setString (2, product.getDescription());
            preparedStmt.setString (3, product.getImage());
            preparedStmt.setBoolean (4, product.isCup());
            preparedStmt.setLong (5, product.getId_product());
            preparedStmt.execute();
            System.out.println("Prodotto aggiornato con successo!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Prodotto non aggiornato: "+e);
        }
        return product;
    }

    @Override
    public void delete(Product entity) {

    }

    @Override
    public boolean deleteById(Long id) {
        String query = "delete product from product where id_product = ?";

        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setDouble (1, id);

            preparedStmt.execute();
            System.out.println("Prodotto eliminato con successo!");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Prodotto non eliminato: "+e);
        }
        return false;
    }

    @Override
    public void deleteInBatch(List<Product> entities) {

    }

    @Override
    public Product findById(Long id) {
        String query = "select * from product where id_product = ?";
        Product product=null;
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setDouble (1, id);

            ResultSet rs = preparedStmt.executeQuery();
            while (rs.next()) {
                product =new Product(rs.getLong("id_product"), rs.getDouble("price"),
                        rs.getString("description"), rs.getString("image"), rs.getBoolean("cup"));
            }
        } catch (SQLException e) {
            ProductNotFoundException productNotFoundException = new ProductNotFoundException(id);
            productNotFoundException.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> findAll() {
        String query = "select * from product";
        List<Product> productList = new ArrayList<>();
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)) {

            ResultSet rs = preparedStmt.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getLong("id_product"), rs.getDouble("price"),
                        rs.getString("description"), rs.getString("image"), rs.getBoolean("cup")));
            }
        } catch (SQLException e) {
            System.err.println("Errore " + e);
            System.out.print("ERRORE Caricamento dati");
        }
        return productList;
    }
}
