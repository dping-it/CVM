package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.UserJSONConverter;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import org.apache.commons.io.IOUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "recharge", value = "/recharge")
public class RechargeCreditController extends HttpServlet {
    private UserServiceImpl userService;
    private UserJSONConverter userJsonConverter;

    public void init() throws ServletException {
        userService= new UserServiceImpl();
        userJsonConverter = new UserJSONConverter();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long idUser = Long.valueOf(request.getParameter("id-user"));
        Double amount = Double.valueOf(request.getParameter("amount"));

        User user = userService.rechargeCredit(idUser, amount);
        String convert = this.userJsonConverter.toJSON(user);

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_ACCEPTED);
        request.getSession().setAttribute("user", user);
        response.sendRedirect("index.jsp");
        out.flush();
    }
}
