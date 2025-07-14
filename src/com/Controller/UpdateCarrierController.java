package com.Controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import com.Model.Carrier;
import com.Dao.CarrierDao;

@WebServlet("/UpdateCarrierController")
public class UpdateCarrierController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Carrier c = new Carrier();
        c.setCarrierName(request.getParameter("carrierName"));
        c.setD30(Integer.parseInt(request.getParameter("d30")));
        c.setD60(Integer.parseInt(request.getParameter("d60")));
        c.setD90(Integer.parseInt(request.getParameter("d90")));
        c.setBulk(Integer.parseInt(request.getParameter("bulk")));
        c.setR2(Integer.parseInt(request.getParameter("r2")));
        c.setR10(Integer.parseInt(request.getParameter("r10")));
        c.setR20(Integer.parseInt(request.getParameter("r20")));
        c.setSilver(Integer.parseInt(request.getParameter("silver")));
        c.setGold(Integer.parseInt(request.getParameter("gold")));
        c.setPlatinum(Integer.parseInt(request.getParameter("platinum")));

        CarrierDao dao = new CarrierDao();
        boolean updated = dao.updateCarrierById(c, id);

        if (updated) {
            response.sendRedirect("show_carriers.jsp?msg=updated");
        } else {
            response.sendRedirect("show_carriers.jsp?msg=notupdated");
        }
    }
}