package it.dping.cloudvendingmachines.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "refilmachine", value = "/refilmachine")
public class RefilMachineController extends HttpServlet {

    private VendingMachineServiceImpl vendingMachineService;
    private VendingMachineJSONConverter vendingMachineJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService = new VendingMachineServiceImpl();
        vendingMachineJsonConverter = new VendingMachineJSONConverter();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codProduct = request.getParameter("product");
        String idMachine = request.getParameter("idmachine");
        VendingMachine vendingMachine =null;
        vendingMachine= vendingMachineService.refilProduct(idMachine,codProduct);

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        if (vendingMachine!=null){
            request.getSession().setAttribute("machine", vendingMachine);
            response.setStatus(HttpServletResponse.SC_OK);

        } else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
        response.sendRedirect("refil.jsp");
        out.flush();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codProduct = request.getParameter("product");
        String idMachine = request.getParameter("idmachine");
        VendingMachine vendingMachine =null;
        vendingMachine= vendingMachineService.refilProduct(idMachine,codProduct);

        String convert="";
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            convert += objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(vendingMachine);
        } catch(Exception e) {
            e.printStackTrace();
        }

        if (vendingMachine!=null){
            request.getSession().setAttribute("machine",vendingMachine);
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        out.print(convert);
        out.flush();

    }
}
