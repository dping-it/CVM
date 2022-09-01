package it.dping.cloudvendingmachines.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "machines", value = "/machines")
public class VendingMachineListController extends HttpServlet {

    private VendingMachineServiceImpl vendingMachineService;
    private VendingMachineJSONConverter vendingMachineJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService= new VendingMachineServiceImpl();
        vendingMachineJsonConverter = new VendingMachineJSONConverter();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<VendingMachine> vendingMachines =new ArrayList<>();
         vendingMachines.addAll(vendingMachineService.findAll());
        String convert="";

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            convert += objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(vendingMachines);
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
