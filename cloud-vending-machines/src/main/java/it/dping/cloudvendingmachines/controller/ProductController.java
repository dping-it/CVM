package it.dping.cloudvendingmachines.controller;

import it.dping.cloudvendingmachines.converter.ProductJSONConverter;
import it.dping.cloudvendingmachines.model.Product;
import it.dping.cloudvendingmachines.service.ProductServiceImpl;
import org.apache.commons.io.IOUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet(name = "product", value = "/product")
public class ProductController extends HttpServlet {
    private String message;

    private ProductServiceImpl productService;
    private ProductJSONConverter productJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        productService= new ProductServiceImpl();
        productJsonConverter = new ProductJSONConverter();
        message = "Hello World";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String json= (IOUtils.toString(request.getReader()));
        Product product = this.productJsonConverter.fromJSON(json);
        product = productService.save(product);
        String convert = this.productJsonConverter.toJSON(product);
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
        Product product = this.productJsonConverter.fromJSON(json);
        product = productService.update(product);
        String convert = this.productJsonConverter.toJSON(product);
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
        Product product =null;
        product =productService.findById(Long.valueOf(request.getParameter("id_product")));
        String convert = this.productJsonConverter.toJSON(product);

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
        Long id_product;
        while(paramNames.hasMoreElements( )) {
            id_product = (Long) paramNames.nextElement();
            result = productService.deleteById(id_product);
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
