package it.dping.cloudvendingmachines.model;

import java.util.Date;

public class Buying {
    private Long id_buying;
    private Long cod_user;
    private Long cod_product;
    private Date date;
    private String transaction;
    private boolean complete;

    public Buying() {
    }

    public Buying(Long id_buying, Long cod_user, Long cod_product, Date date, String transaction, boolean complete) {
        this.id_buying = id_buying;
        this.cod_user = cod_user;
        this.cod_product = cod_product;
        this.date = date;
        this.transaction = transaction;
        this.complete = complete;
    }

    public Long getId_buying() {
        return id_buying;
    }

    public void setId_buying(Long id_buying) {
        this.id_buying = id_buying;
    }

    public Long getCod_user() {
        return cod_user;
    }

    public void setCod_user(Long cod_user) {
        this.cod_user = cod_user;
    }

    public Long getCod_product() {
        return cod_product;
    }

    public void setCod_product(Long cod_product) {
        this.cod_product = cod_product;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTransaction() {
        return transaction;
    }

    public void setTransaction(String transaction) {
        this.transaction = transaction;
    }

    public boolean isComplete() {
        return complete;
    }

    public void setComplete(boolean complete) {
        this.complete = complete;
    }

    @Override
    public String toString() {
        return "Buying{" +
                "id_buying=" + id_buying +
                ", cod_user=" + cod_user +
                ", cod_product=" + cod_product +
                ", date=" + date +
                ", transaction='" + transaction + '\'' +
                ", complete=" + complete +
                '}';
    }
}
