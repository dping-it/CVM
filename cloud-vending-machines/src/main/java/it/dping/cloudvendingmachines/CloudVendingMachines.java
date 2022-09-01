package it.dping.cloudvendingmachines;

import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "reset", value = "/reset")
public class CloudVendingMachines extends HttpServlet {
    private VendingMachineServiceImpl vendingMachineService;
    private UserServiceImpl userService;
    private String message="www.dping.it";

    public void init() throws ServletException {
        vendingMachineService= new VendingMachineServiceImpl();
        userService = new UserServiceImpl();
        resetSimulation();
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
        response.sendRedirect("index.jsp");
    }

    public void destroy() {
    }

    void resetSimulation(){
        List <User> userList = userService.findAll();
        List <VendingMachine> vendingMachineList = vendingMachineService.findAll();
        for (User u: userList
             ) {
            u.setActive(0l);
            userService.update(u);
        }

        for (VendingMachine v: vendingMachineList
        ) {
            v.setBalance(0d);
            v.setState("0");
            vendingMachineService.update(v);
        }
    }
}
