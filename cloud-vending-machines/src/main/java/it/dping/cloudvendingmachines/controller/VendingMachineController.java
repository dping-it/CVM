package it.dping.cloudvendingmachines.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.dping.cloudvendingmachines.converter.VendingMachineJSONConverter;
import it.dping.cloudvendingmachines.model.VendingMachine;
import it.dping.cloudvendingmachines.service.VendingMachineServiceImpl;
import org.apache.commons.io.IOUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet(name = "machine", value = "/machine")
public class VendingMachineController extends HttpServlet {

    private VendingMachineServiceImpl vendingMachineService;
    private VendingMachineJSONConverter vendingMachineJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        vendingMachineService= new VendingMachineServiceImpl();
        vendingMachineJsonConverter = new VendingMachineJSONConverter();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String json= (IOUtils.toString(request.getReader()));
        VendingMachine vendingMachine = this.vendingMachineJsonConverter.fromJSON(json);

        vendingMachine = vendingMachineService.save(vendingMachine);
        String convert = this.vendingMachineJsonConverter.toJSON(vendingMachine);

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
        VendingMachine vendingMachine = this.vendingMachineJsonConverter.fromJSON(json);

        vendingMachine = vendingMachineService.update(vendingMachine);
        String convert = this.vendingMachineJsonConverter.toJSON(vendingMachine);

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
        VendingMachine vendingMachine =null;
        vendingMachine =vendingMachineService.findById(Long.valueOf(request.getParameter("id_vendingMachine")));

        String convert="";

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            convert += objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(vendingMachine);
        } catch(Exception e) {
            e.printStackTrace();
        }

        request.getSession().setAttribute("machine",vendingMachine);
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
        Long id_vendingMachine;
        while(paramNames.hasMoreElements( )) {
            id_vendingMachine = (Long) paramNames.nextElement();
            result = vendingMachineService.deleteById(id_vendingMachine);
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
