package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.UserJSONConverter;
import it.dping.cloudvendingmachines.model.User;
import it.dping.cloudvendingmachines.service.UserServiceImpl;
import org.apache.commons.io.IOUtils;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet(name = "user", value = "/user")
public class UserController extends HttpServlet {

    private UserServiceImpl userService;
    private UserJSONConverter userJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        userService= new UserServiceImpl();
        userJsonConverter = new UserJSONConverter();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String json= (IOUtils.toString(request.getReader()));
        User user = this.userJsonConverter.fromJSON(json);

        user = userService.save(user);
        String convert = this.userJsonConverter.toJSON(user);

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_CREATED);
        out.print(convert);
        out.flush();

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String json= (IOUtils.toString(request.getReader()));
        User user = this.userJsonConverter.fromJSON(json);

        user = userService.update(user);
        String convert = this.userJsonConverter.toJSON(user);

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_ACCEPTED);
        out.print(convert);
        out.flush();

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user =null;
        user =userService.findById(Long.valueOf(request.getParameter("id_user")));
        String convert = this.userJsonConverter.toJSON(user);

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        out.print(convert);
        out.flush();
    }

    @Override
    public void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean result = false;
        Enumeration paramNames = request.getParameterNames();
        Long id_user;
        while(paramNames.hasMoreElements( )) {
            id_user = (Long) paramNames.nextElement();
            result = userService.deleteById(id_user);
        }
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        if (result) {
            response.setStatus(HttpServletResponse.SC_OK);
            out.print("Utente eliminato");
        }else {
            response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
            out.print("Errore utente non eliminato");
        }
        out.flush();
    }


    public void destroy() {
        // do nothing.
    }
}
