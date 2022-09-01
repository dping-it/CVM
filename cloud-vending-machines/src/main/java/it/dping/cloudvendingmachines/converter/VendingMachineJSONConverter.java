package it.dping.cloudvendingmachines.converter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import it.dping.cloudvendingmachines.model.VendingMachine;

import java.io.IOException;

public class VendingMachineJSONConverter implements JSONConvert<VendingMachine> {

   public VendingMachine fromJSON(String json) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            VendingMachine vendingMachine = mapper.readValue(json, VendingMachine.class);
            return vendingMachine;
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Error conversion: "+json);
            return null;
        }
    }

    public String toJSON(VendingMachine vendingMachine){
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String json = objectMapper.writeValueAsString(vendingMachine);
            return json;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
