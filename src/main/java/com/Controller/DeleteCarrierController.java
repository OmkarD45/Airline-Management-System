package com.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.Dao.CarrierDao;

@WebServlet("/DeleteCarrierController")
public class DeleteCarrierController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        CarrierDao dao = new CarrierDao();

        if (dao.deleteCarrierById(id)) {
            response.sendRedirect("show_carriers.jsp?msg=deleted");
        } else {
            response.sendRedirect("show_carriers.jsp?msg=notdeleted");
        }
    }
}
