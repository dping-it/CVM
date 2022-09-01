package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "disconnect", value = "/disconnect")
public class DisconnectController extends HttpServlet {
    private VendingMachineServiceImpl vendingMachineService;
    private VendingMachineJSONConverter vendingMachineJsonConverter;
    private UserServiceImpl userService;

    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService = new VendingMachineServiceImpl();
        vendingMachineJsonConverter = new VendingMachineJSONConverter();
        userService = new UserServiceImpl();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idMachine = request.getParameter("machine");
        vendingMachineService.disconnectMachine(idMachine);
        response.sendRedirect("machine.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        User user = this.userService.findById(Long.valueOf(request.getParameter("id-user")));
        if (user.getActive()>0) {
            user.setActive(0l);
            user = userService.update(user);
            Long id = Long.valueOf(request.getParameter("id-machine"));
            if(id>0) {
                VendingMachine vendingMachine =vendingMachineService.findById(id);
                vendingMachine.setState("0");
                vendingMachine.setBalance(0D);
                vendingMachineService.update(vendingMachine);
            }
            request.getSession().setAttribute("id-machine", null);
            response.setStatus(HttpServletResponse.SC_OK);
            out.print("Disconnesso!");
            request.getSession().setAttribute("user", user);
            response.sendRedirect("index.jsp");
        }else{
            response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
            response.sendRedirect("index.jsp");
        }
    }
}
