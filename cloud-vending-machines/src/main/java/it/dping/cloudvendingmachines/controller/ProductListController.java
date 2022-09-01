package it.dping.cloudvendingmachines.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.dping.cloudvendingmachines.converter.ProductJSONConverter;
import it.dping.cloudvendingmachines.model.Product;
import it.dping.cloudvendingmachines.service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "products", value = "/products")
public class ProductListController extends HttpServlet {

    private ProductServiceImpl productService;
    private ProductJSONConverter productJsonConverter;

    public void init() throws ServletException {
        // Do required initialization
        productService= new ProductServiceImpl();
        productJsonConverter = new ProductJSONConverter();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products =new ArrayList<>();
         products.addAll(productService.findAll());
        String convert="";

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            convert += objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(products);
        } catch(Exception e) {
            e.printStackTrace();
        }

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        out.print(convert);
        out.flush();
    }
}
