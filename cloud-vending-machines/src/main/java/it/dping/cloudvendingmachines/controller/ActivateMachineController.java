package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "activate", value = "/activate")
public class ActivateMachineController extends HttpServlet {

    private VendingMachineServiceImpl vendingMachineService;
    private VendingMachineJSONConverter vendingMachineJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService = new VendingMachineServiceImpl();
        vendingMachineJsonConverter = new VendingMachineJSONConverter();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idMachine = request.getParameter("idmachine");
        VendingMachine vendingMachine =null;
        vendingMachine= vendingMachineService.setWorking(idMachine);

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
}
