package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.UserJSONConverter;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.service.CustomFormatData;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import org.apache.commons.io.IOUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "editprofile", value = "/editprofile")
public class EditProfileController extends HttpServlet {
    private UserServiceImpl userService;
    private UserJSONConverter userJsonConverter;
    private CustomFormatData customFormatData;

    public void init() throws ServletException {
        userService= new UserServiceImpl();
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

        User user = userService.findById(Long.valueOf(request.getParameter("id")));
        if (user !=null) {
            if (request.getParameter("credit") != null) {
                user.setCredit(Double.parseDouble(request.getParameter("credit").replace(",", ".")));
            }
            if (request.getParameter("username") != null) {
                user.setUsername(request.getParameter("username"));
            }
            if (request.getParameter("mobile") != null) {
                user.setMobile(request.getParameter("mobile"));
            }
            if (request.getParameter("email") != null) {
                user.setEmail(request.getParameter("email"));
            }
            if (request.getParameter("name") != null) {
                user.setName(request.getParameter("name"));
            }

            user = userService.update(user);
            response.setStatus(HttpServletResponse.SC_ACCEPTED);
            request.getSession().setAttribute("user", user);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
        }

        response.sendRedirect("index.jsp");

        out.flush();
    }
}
