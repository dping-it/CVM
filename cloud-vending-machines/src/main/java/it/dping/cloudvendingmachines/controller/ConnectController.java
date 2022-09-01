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

@WebServlet(name = "connect", value = "/connect")
public class ConnectController extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        VendingMachine vendingMachine = null;
        User user = this.userService.findById(Long.valueOf(request.getParameter("id-user")));
        if (request.getParameter("name") != null) {
            vendingMachine = this.vendingMachineService.findById(Long.valueOf(request.getParameter("name")));
            if (vendingMachine != null && user != null ) {

                Cookie ck = new Cookie("idUser", request.getParameter("id-user"));//creating cookie object
                response.addCookie(ck);//adding cookie in the response

                if (user.getActive()>0) {
                    //DISCONNESSIONE E SCARICAMENTO CREDITO
                    user.setActive(0l);
                    user = userService.update(user);

                    vendingMachine = vendingMachineService.findById((Long) request.getSession().getAttribute("id-machine"));
                    vendingMachine.setBalance(0D);
                    vendingMachine.setState("DISPONIBILE");
                    vendingMachineService.update(vendingMachine);
                    request.getSession().setAttribute("id-machine", null);
                    response.setStatus(HttpServletResponse.SC_OK);

                    request.getSession().setAttribute("user", user);
                    request.getSession().setAttribute("machine", vendingMachine);
                    out.print("Disconnesso!");
                } else {
                    if(vendingMachine.getState().equals("0")) {
                        //CONNESSIONE E CARICAMENTO CREDITO
                        vendingMachine.setBalance(user.getCredit());
                        vendingMachine.setState(user.getId_user() + "");
                        user.setActive(vendingMachine.getId_vending_machine());
                        vendingMachine = vendingMachineService.update(vendingMachine);
                        user = userService.update(user);
                        request.getSession().setAttribute("user", user);

                        request.getSession().setAttribute("id-machine", vendingMachine.getId_vending_machine());
                        request.getSession().setAttribute("machine", vendingMachine);
                        response.setStatus(HttpServletResponse.SC_OK);
                        out.print("Connesso!");
                    }else {
                        out.print("Impossibile connettersi alla macchinetta!");
                        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
                    }
                }
            }
            else if (vendingMachine == null && user != null) {
            if (user.getActive()>0) {
                user.setActive(0l);
                user = userService.update(user);

                request.getSession().setAttribute("id-machine", null);
                response.setStatus(HttpServletResponse.SC_OK);
                out.print("Disconnesso!");
                request.getSession().setAttribute("user", user);
            }
            } else {

                out.print("Impossibile connettersi alla macchinetta!");
                response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            }

//        out.flush();
            response.sendRedirect("index.jsp");
        }
        else {
            if (user.getActive()>0) {
                user.setActive(0l);
                user = userService.update(user);

                request.getSession().setAttribute("id-machine", null);
                response.setStatus(HttpServletResponse.SC_OK);
                out.print("Disconnesso!");
                request.getSession().setAttribute("user", user);
                response.sendRedirect("index.jsp");
            }
            response.sendRedirect("index.jsp");
        }
    }
}
