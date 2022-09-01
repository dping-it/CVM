package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.Contains;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "charging", value = "/charging")
public class ChargingMachineController extends HttpServlet {

    private VendingMachineServiceImpl vendingMachineService;
    private VendingMachineJSONConverter vendingMachineJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService= new VendingMachineServiceImpl();
        vendingMachineJsonConverter = new VendingMachineJSONConverter();
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long ref_product = Long.valueOf(request.getParameter("ref_product"));
        Long id_vending_machine = Long.valueOf(request.getParameter("id_vending_machine"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        int qty_stock = Integer.parseInt(request.getParameter("qty_stock"));
        String slot = request.getParameter("slot");

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        if (!ref_product.equals("") && !id_vending_machine.equals("")) {
            Contains contains = null;
            contains = vendingMachineService.addProductToMachine(id_vending_machine, ref_product, qty, qty_stock, slot);
            if (contains != null) {
                response.setStatus(HttpServletResponse.SC_CREATED);

            } else {
                response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            }
            PrintWriter out = response.getWriter();
            out.print("Login");
            out.flush();
        }
    }
}
