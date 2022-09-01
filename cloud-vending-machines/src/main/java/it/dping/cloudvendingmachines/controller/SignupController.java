package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.UserJSONConverter;
import it.dping.cloudvendingmachines.model.Role;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import static it.dping.cloudvendingmachines.model.Role.USER;

@WebServlet(name = "signup", value = "/signup")
public class SignupController extends HttpServlet {
    private UserServiceImpl userService;
    private UserJSONConverter userJsonConverter;

    public void init() throws ServletException {
        userJsonConverter = new UserJSONConverter();
        userService= new UserServiceImpl();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String credit = request.getParameter("credit");
        String name = request.getParameter("name");

        HttpSession httpSession = request.getSession();
        httpSession.setMaxInactiveInterval(300);

        User user = new User();
        user.setActive(0l);
        user.setPassword(password);
        user.setCredit(Double.valueOf(credit));
        user.setUsername(username);
        user.setName(name);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setRole(USER);

        user = userService.save(user);
        String convert = this.userJsonConverter.toJSON(user);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        if (user!=null) {
                response.setStatus(HttpServletResponse.SC_CREATED);
                httpSession.setAttribute("user", user);
            } else {
                response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            }
            response.sendRedirect("index.jsp");
            PrintWriter out = response.getWriter();

            out.print(convert);
            out.flush();
    }
}
