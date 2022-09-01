package it.dping.cloudvendingmachines.converter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import it.dping.cloudvendingmachines.model.Product;

import java.io.IOException;
import java.util.List;

public class ProductJSONConverter implements JSONConvert<Product> {

   public Product fromJSON(String json) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            Product product = mapper.readValue(json, Product.class);
            return product;
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Error conversion: "+json);
            return null;
        }
    }

    public String toJSON(Product product){
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String json = objectMapper.writeValueAsString(product);
            return json;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String toJSONList(List<Product> products){

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String json= objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(products);
                return json;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
