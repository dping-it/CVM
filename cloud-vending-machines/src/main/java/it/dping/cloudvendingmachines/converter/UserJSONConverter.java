package it.dping.cloudvendingmachines.converter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import it.dping.cloudvendingmachines.model.User;

import java.io.IOException;

public class UserJSONConverter implements JSONConvert<User> {

   public User fromJSON(String json) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            User user = mapper.readValue(json, User.class);
            return user;
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Error conversion: "+json);
            return null;
        }
    }

    public String toJSON(User user){
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String json = objectMapper.writeValueAsString(user);
            return json;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
