package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;
import org.apache.commons.io.IOUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.Delayed;

@WebServlet(name = "buy", value = "/buy")
public class BuyController extends HttpServlet {
    private  VendingMachineServiceImpl vendingMachineService;



    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService = new VendingMachineServiceImpl();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String codProduct = request.getParameter("product");
        String idMachine = request.getParameter("idmachine");
        VendingMachine vendingMachine= vendingMachineService.findById(Long.valueOf(idMachine));

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        if (vendingMachine != null) {

        if (vendingMachine.getProductSlots().get(Integer.parseInt(codProduct)-1).getQty_stock()>0) {
            vendingMachine = vendingMachineService.buyProduct(idMachine, codProduct);

            request.setAttribute("machine", vendingMachine);
            request.getSession().setAttribute("machine", vendingMachine);
            response.setStatus(HttpServletResponse.SC_OK);
            response.sendRedirect("machine.jsp");

            } else {
                response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
        out.flush();

    }
}
