package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "closemachine", value = "/closemachine")
public class DisconnectFromServiceController extends HttpServlet {

    private VendingMachineServiceImpl vendingMachineService;


    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService = new VendingMachineServiceImpl();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        VendingMachine vendingMachine =null;
        vendingMachine = vendingMachineService.findById(Long.valueOf(request.getParameter("idmachine")));
        vendingMachine= vendingMachineService.setInOperativeMode(vendingMachine);

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        if (vendingMachine!=null){
            response.setStatus(HttpServletResponse.SC_OK);
            response.sendRedirect("index.jsp");
        } else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
        out.flush();

    }

}
