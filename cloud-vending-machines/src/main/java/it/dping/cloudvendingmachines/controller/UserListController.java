package it.dping.cloudvendingmachines.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.dping.cloudvendingmachines.converter.UserJSONConverter;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "users", value = "/users")
public class UserListController extends HttpServlet {

    private UserServiceImpl userService;
    private UserJSONConverter userJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        userService= new UserServiceImpl();
        userJsonConverter = new UserJSONConverter();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users =new ArrayList<>();
         users.addAll(userService.findAll());
        String convert="";

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            convert += objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(users);
        } catch(Exception e) {
            e.printStackTrace();
        }

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        out.print(convert);
        out.flush();
    }
}
