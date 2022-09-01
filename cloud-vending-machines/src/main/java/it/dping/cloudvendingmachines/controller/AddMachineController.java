package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.UserJSONConverter;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.CustomFormatData;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "add", value = "/add")
public class AddMachineController extends HttpServlet {

    private VendingMachineServiceImpl machineService;
    private UserJSONConverter userJsonConverter;
    private CustomFormatData customFormatData;

    public void init() throws ServletException {
        machineService= new VendingMachineServiceImpl();
        userJsonConverter = new UserJSONConverter();
        customFormatData = new CustomFormatData();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        VendingMachine vendingMachine = new VendingMachine();

            if (request.getParameter("place") != null) {
                vendingMachine.setPosition(request.getParameter("place"));

                vendingMachine.setBalance(0d);
                vendingMachine.setState("0");
                vendingMachine.setWorking(true);
                machineService.save(vendingMachine);
                machineService.initializeStock(vendingMachine);
                response.setStatus(HttpServletResponse.SC_ACCEPTED);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
        }

        response.sendRedirect("index.jsp");

        out.flush();
    }
}
