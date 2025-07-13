package com.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.Model.Carrier;
import com.Dao.CarrierDao;

@WebServlet("/EditCarrierController")
public class EditCarrierController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        CarrierDao dao = new CarrierDao();
        Carrier c = dao.getCarrierById(id);
        request.setAttribute("carrier", c);
        request.setAttribute("cid", id);
        request.getRequestDispatcher("edit_carrier.jsp").forward(request, response);
    }
}
