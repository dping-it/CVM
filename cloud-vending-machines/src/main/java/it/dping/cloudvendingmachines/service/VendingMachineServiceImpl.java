package it.dping.cloudvendingmachines.service;

import it.dping.cloudvendingmachines.DTO.ProductDTO;
import it.dping.cloudvendingmachines.model.Contains;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.exception.VendingMachineNotFoundException;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class VendingMachineServiceImpl implements CrudService<VendingMachine>, VendingMachineService {

    private ConnectorDB connectorDB= new ConnectorDB();
    private UserServiceImpl userService= new UserServiceImpl();

    @Override
    public VendingMachine save(VendingMachine vendingMachine)  {

        String query = "insert into machine (state, position, balance, working)"
                + " values (?, ?, ?, ?)";
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query, Statement.RETURN_GENERATED_KEYS)){
            preparedStmt.setString (1, vendingMachine.getState());
            preparedStmt.setString (2, vendingMachine.getPosition());
            preparedStmt.setDouble (3, vendingMachine.getBalance());
            preparedStmt.setBoolean (4, vendingMachine.isWorking());

            preparedStmt.execute();
            ResultSet resultSet= preparedStmt.getGeneratedKeys();
            if (resultSet.next()){
                vendingMachine.setId_vending_machine(resultSet.getLong(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Macchinetta non aggiunta: "+e);
        }
        return vendingMachine;
    }

    @Override
    public VendingMachine update(VendingMachine vendingMachine) {

        String query = "update machine  set state= ?, position= ?, balance= ?, working= ? WHERE id_vending_machine = ?";

        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){

            preparedStmt.setString (1, vendingMachine.getState());
            preparedStmt.setString (2, vendingMachine.getPosition());
            preparedStmt.setDouble (3, vendingMachine.getBalance());
            preparedStmt.setBoolean (4, vendingMachine.isWorking());

            preparedStmt.setLong (5, vendingMachine.getId_vending_machine());
            preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Macchinetta non aggiornata: "+e);
        }
        return vendingMachine;
    }

    @Override
    public void delete(VendingMachine entity) {

    }

    @Override
    public boolean deleteById(Long id) {
        String query = "delete machine from machine where id_vending_machine = ?";

        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setDouble (1, id);
            preparedStmt.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Macchinetta non eliminata: "+e);
        }
        return false;
    }

    @Override
    public void deleteInBatch(List<VendingMachine> entities) {

    }

    @Override
    public VendingMachine findById(Long id) {
        String query = "select * from machine where id_vending_machine = ?";
        VendingMachine vendingMachine=null;
        Connection conn = null;
        try {
            conn = connectorDB.connect();

        ProductDTO productDTO =null;
        try (PreparedStatement preparedStmt = conn.prepareStatement(query)){
            preparedStmt.setDouble (1, id);

            ResultSet rs = preparedStmt.executeQuery();
            if (rs.next()) {
                vendingMachine =new VendingMachine(rs.getLong("id_vending_machine"), rs.getString("state"),
                        rs.getString("position"),rs.getDouble("balance"), rs.getBoolean("working"));
            }

        } catch (SQLException e) {
//            e.printStackTrace();
//            VendingMachineNotFoundException vendingMachineNotFoundException = new VendingMachineNotFoundException(id);
//            vendingMachineNotFoundException.printStackTrace();
            System.out.println("ALT");
        }

        if (vendingMachine!=null) {

            LinkedList<ProductDTO> gridList =new LinkedList<>();
            String list = "select * from contains c, product p where c.ref_product = p.id_product and c.ref_machine = ?";
            try (PreparedStatement preparedStmt = conn.prepareStatement(list)) {
                preparedStmt.setLong(1, id);

                ResultSet rs = preparedStmt.executeQuery();
                while (rs.next()) {
                    productDTO = new ProductDTO(rs.getLong("id_contains"),rs.getLong("ref_machine"),
                            rs.getLong("id_product"), rs.getInt("qty"),
                            rs.getInt("qty_stock"), rs.getString("slot"),
                            rs.getDouble("price"), rs.getString("description"),
                            rs.getString("image"), rs.getBoolean("cup"));

                    gridList.add(productDTO);
                }
                vendingMachine.setProductSlots(gridList);

            } catch (SQLException e) {
//                VendingMachineNotFoundException vendingMachineNotFoundException = new VendingMachineNotFoundException(id);
//                vendingMachineNotFoundException.printStackTrace();
                System.out.println("STOP");
            }
        }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (conn!=null){
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return vendingMachine;
    }

    @Override
    public VendingMachine findByIdCup(Long id, boolean isInCup) {
        String query = "select * from machine where id_vending_machine = ?";
        VendingMachine vendingMachine=null;
        ProductDTO productDTO =null;
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setDouble (1, id);

            ResultSet rs = preparedStmt.executeQuery();
            if (rs.next()) {
                vendingMachine =new VendingMachine(rs.getLong("id_vending_machine"), rs.getString("state"),
                        rs.getString("position"),rs.getDouble("balance"), rs.getBoolean("working"));
            }

        } catch (SQLException e) {
            VendingMachineNotFoundException vendingMachineNotFoundException = new VendingMachineNotFoundException(id);
            vendingMachineNotFoundException.printStackTrace();
        }

        if (vendingMachine!=null) {

            LinkedList<ProductDTO> gridList =new LinkedList<>();
            String list = "select * from contains c, product p where c.ref_product = p.id_product and c.ref_machine = ? and p.cup=true";
            try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(list)) {
                preparedStmt.setLong(1, id);

                ResultSet rs = preparedStmt.executeQuery();
                while (rs.next()) {
                    productDTO = new ProductDTO(rs.getLong("id_contains"),rs.getLong("ref_machine"),
                            rs.getLong("id_product"), rs.getInt("qty"),
                            rs.getInt("qty_stock"), rs.getString("slot"),
                            rs.getDouble("price"), rs.getString("description"),
                            rs.getString("image"), rs.getBoolean("cup"));

                    gridList.add(productDTO);
                }
                vendingMachine.setProductSlots(gridList);

            } catch (SQLException e) {
                VendingMachineNotFoundException vendingMachineNotFoundException = new VendingMachineNotFoundException(id);
                vendingMachineNotFoundException.printStackTrace();
            }
        }
        return vendingMachine;
    }

    @Override
    public List<VendingMachine> findAll() {
        String query = "select * from machine";
        List<VendingMachine> vendingMachineList = new ArrayList<>();
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)) {

            ResultSet rs = preparedStmt.executeQuery();
            while (rs.next()) {
                vendingMachineList.add(new VendingMachine(rs.getLong("id_vending_machine"), rs.getString("state"),
                        rs.getString("position"),rs.getDouble("balance"), rs.getBoolean("working")));
            }
        } catch (SQLException e) {
            System.err.println("Errore " + e);
            System.out.print("ERRORE Caricamento dati");
        }
        return vendingMachineList;
    }

    @Override
    public Contains addProductToMachine(Long id_vending_machine, Long ref_product, int qty, int qty_stock, String slot) {

        Contains contains= null;

        String query = "insert into contains (ref_machine, ref_product, qty, qty_stock, slot)"
                + " values (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query, Statement.RETURN_GENERATED_KEYS)){
            preparedStmt.setLong (1, id_vending_machine);
            preparedStmt.setLong (2, ref_product);
            preparedStmt.setInt (3, qty);
            preparedStmt.setInt (4, qty_stock);
            preparedStmt.setString (5, slot);

            preparedStmt.execute();
            ResultSet resultSet= preparedStmt.getGeneratedKeys();
            if (resultSet.next()){
                contains=new Contains();
                contains.setRef_machine(id_vending_machine);
                contains.setRef_product(ref_product);
                contains.setQty_slot(qty_stock);
                contains.setQty(qty);
                contains.setSlot(slot);
                contains.setId_contains(resultSet.getLong(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Macchinetta non caricata: "+e);
        }
        return contains;

    }

    @Override
    public Contains updateProductToMachine(Contains contains) {


        String query = "update contains  set ref_machine= ?, ref_product= ?, qty= ?, qty_stock= ?, slot= ? WHERE id_contains = ?";

        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){

            preparedStmt.setLong (1, contains.getRef_machine());
            preparedStmt.setLong (2, contains.getRef_product());
            preparedStmt.setInt (3, contains.getQty());
            preparedStmt.setInt (4, contains.getQty_slot());
            preparedStmt.setString (5, contains.getSlot());

            preparedStmt.setLong (6, contains.getId_contains());
            preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Prodotto in stock non aggiornato: "+e);
        }


        return contains;

    }

    @Override
    public VendingMachine buyProduct(String idMachine, String codProduct) {
        VendingMachine vendingMachine = findById(Long.valueOf(idMachine));
        Contains contains = null;

        int i=0;
        Double price=0D;
        User user =null;

        String query = "select * from contains c, product p where c.ref_machine= ? and c.ref_product= ? and c.ref_product=p.id_product";
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setLong (1, Long.parseLong(idMachine));
            preparedStmt.setLong (2, Long.parseLong(codProduct));

            preparedStmt.execute();

            ResultSet rs = preparedStmt.executeQuery();
            if (rs.next()) {

                contains = new Contains(rs.getLong("id_contains"), rs.getLong("ref_machine"),
                        rs.getLong("ref_product"), rs.getInt("qty"),
                        rs.getInt("qty_stock"), rs.getString("slot"));

                price=rs.getDouble("price");
            }
            i = contains.getQty_slot();
            i--;
            contains.setQty_slot(i);
            updateProductToMachine(contains);
            vendingMachine.setBalance(vendingMachine.getBalance()-price);
            update(vendingMachine);
            user = userService.findById(Long.valueOf(vendingMachine.getState()));
            if(user!=null) {
                user.setCredit(user.getCredit() - price);
                userService.update(user);
            }
        } catch (SQLException e) {
            VendingMachineNotFoundException vendingMachineNotFoundException = new VendingMachineNotFoundException(Long.valueOf(idMachine));
            vendingMachineNotFoundException.printStackTrace();
        }

        return findById(Long.valueOf(idMachine));
    }

    @Override
    public VendingMachine refilProduct(String idMachine, String codProduct) {
        VendingMachine vendingMachine = findById(Long.valueOf(idMachine));
        Contains contains = null;

        int i=0;
        Double price=0D;
        User user =null;

        String query = "select * from contains c, product p where c.ref_machine= ? and c.ref_product= ? and c.ref_product=p.id_product";
        try (PreparedStatement preparedStmt = connectorDB.connect().prepareStatement(query)){
            preparedStmt.setLong (1, Long.parseLong(idMachine));
            preparedStmt.setLong (2, Long.parseLong(codProduct));

            preparedStmt.execute();

            ResultSet rs = preparedStmt.executeQuery();
            if (rs.next()) {

                contains = new Contains(rs.getLong("id_contains"), rs.getLong("ref_machine"),
                        rs.getLong("ref_product"), rs.getInt("qty"),
                        rs.getInt("qty_stock"), rs.getString("slot"));
            }
            contains.setQty_slot(contains.getQty());
            updateProductToMachine(contains);
        } catch (SQLException e) {
            VendingMachineNotFoundException vendingMachineNotFoundException = new VendingMachineNotFoundException(Long.valueOf(idMachine));
            vendingMachineNotFoundException.printStackTrace();
        }

        return findById(Long.valueOf(idMachine));
    }

    @Override
    public void initializeStock(VendingMachine vendingMachine) {

        for(int i =0; i<30 ; i++){
            addProductToMachine(vendingMachine.getId_vending_machine(), (long) i, 10, 10, String.valueOf(i));
        }
    }

    @Override
    public void disconnectMachine(String idMachine){
        VendingMachine vendingMachine = findById(Long.valueOf(idMachine));
        User user=null;
        if (vendingMachine!=null) {

            if (!vendingMachine.getState().equals("SERVICE")) {
                if (Long.valueOf(vendingMachine.getState()) > 0) {

                    user = userService.findById(Long.valueOf(vendingMachine.getState()));
                    if (user != null) {
                        user.setActive(0l);
                        userService.update(user);
                    }
                }

                vendingMachine.setState("0");
                vendingMachine.setBalance(0d);
                update(vendingMachine);
            }
        }

    }

    @Override
    public VendingMachine setInServiceMode(VendingMachine vendingMachine) {
        if (vendingMachine!=null){

            if (vendingMachine.getState().equals("SERVICE")) {
                return vendingMachine;
            }
            else {
                vendingMachine.setState("SERVICE");
                vendingMachine.setBalance(1000d);
                update(vendingMachine);
            }
        }
        return vendingMachine;
    }

    @Override
    public VendingMachine setInOperativeMode(VendingMachine vendingMachine) {
        if (vendingMachine!=null){
                vendingMachine.setState("0");
                vendingMachine.setBalance(0d);
                update(vendingMachine);
        }
        return vendingMachine;
    }

    @Override
    public VendingMachine setWorking(String idMachine) {
        VendingMachine vendingMachine = findById(Long.valueOf(idMachine));

        if (vendingMachine!=null){

            if (vendingMachine.isWorking()) {
                vendingMachine.setWorking(false);
                vendingMachine.setBalance(0d);
                update(vendingMachine);
            }

            else {
                vendingMachine.setWorking(true);
                vendingMachine.setBalance(0d);
                update(vendingMachine);
            }
        }


        return vendingMachine;
    }
}
