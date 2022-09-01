package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.UserJSONConverter;
import it.dping.cloudvendingmachines.model.Role;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.service.CustomFormatData;
import it.dping.cloudvendingmachines.service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

import static it.dping.cloudvendingmachines.model.Role.*;

@WebServlet(name = "editrole", value = "/editrole")
public class EditRoleController extends HttpServlet {

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

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        User user = userService.findById(Long.valueOf(request.getParameter("id_user")));
        response.setStatus(HttpServletResponse.SC_ACCEPTED);
        request.setAttribute("user-selected", user);
        response.setStatus(HttpServletResponse.SC_OK);
        request.getRequestDispatcher("/WEB-INF/view/edit-user-role-component/edit-user-role.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String role = request.getParameter("role");
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        User user = userService.findById(Long.valueOf(request.getParameter("iduser")));
        if(role.equals("USER")){
            user.setRole(USER);
        }
        if(role.equals("SERVICE")) {
            user.setRole(SERVICE);
        }
        if(role.equals("ADMINISTRATOR")) {
            user.setRole(ADMINISTRATOR);
        }
        userService.update(user);
        response.setStatus(HttpServletResponse.SC_ACCEPTED);
        response.sendRedirect("index.jsp");
        out.flush();

    }
}
