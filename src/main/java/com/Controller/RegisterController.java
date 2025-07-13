package com.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.Model.Customer;
import com.Dao.UserDao;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer c = new Customer();
        c.setUsername(request.getParameter("username"));
        c.setPassword(request.getParameter("password"));
        c.setPhone(Long.parseLong(request.getParameter("phone")));
        c.setEmail(request.getParameter("email"));
        c.setAddress1(request.getParameter("address1"));
        c.setAddress2(request.getParameter("address2"));
        c.setCity(request.getParameter("city"));
        c.setState(request.getParameter("state"));
        c.setCountry(request.getParameter("country"));
        c.setZipcode(Long.parseLong(request.getParameter("zipcode")));
        c.setDob(request.getParameter("dob"));

        UserDao dao = new UserDao();
        boolean result = dao.registerCustomer(c);

        if (result) {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Customer registered successfully!'); window.location='index.jsp';</script>");
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Issue in saving Customer Information. Please try again.'); window.location='register.jsp';</script>");
        }
    }
}
