package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "open", value = "/open")
public class OpenMachineController extends HttpServlet {

    private VendingMachineServiceImpl vendingMachineService;
    private VendingMachineJSONConverter vendingMachineJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService = new VendingMachineServiceImpl();
        vendingMachineJsonConverter = new VendingMachineJSONConverter();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        VendingMachine vendingMachine =null;
        if (request.getParameter("cup") != null) {
            if (request.getParameter("cup").equals("true")) {
                vendingMachine = this.vendingMachineService.findByIdCup(Long.valueOf(request.getParameter("idmachine")), true);
            } else {
                vendingMachine = vendingMachineService.findById(Long.valueOf(request.getParameter("idmachine")));
            }
        }
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        HttpSession httpSession = request.getSession();
        httpSession.setMaxInactiveInterval(300);

        if (vendingMachine!=null){
            httpSession.setAttribute("machine", vendingMachine);
            response.setStatus(HttpServletResponse.SC_OK);
            response.sendRedirect("machine.jsp");
        } else {
            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
        out.flush();

    }
}
