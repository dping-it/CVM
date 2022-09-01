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

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {
    private UserServiceImpl userService;

    public void init() throws ServletException {
        // Do required initialization
        userService= new UserServiceImpl();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession httpSession = request.getSession();
        httpSession.setMaxInactiveInterval(300);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        if (!username.equals("") && !password.equals("")) {

            User user = null;
            user = userService.findByCredential(username,password);
            if (user!=null){
                response.setStatus(HttpServletResponse.SC_CREATED);
                httpSession.setAttribute("user", user);
            } else {
                response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            }

            response.sendRedirect("index.jsp");
            PrintWriter out = response.getWriter();
            out.print("Login");
            out.flush();
        }
    }
}
