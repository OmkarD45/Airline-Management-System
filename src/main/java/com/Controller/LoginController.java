package com.Controller;

import com.Dao.LoginDao;
import com.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userid");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        User user = new User(userId, password, userType);

        boolean valid = LoginDao.validate(user.getUserId(), user.getPassword(), user.getUserType());

        if (valid) {
            HttpSession session = request.getSession();
            session.setAttribute("userid", user.getUserId());
            session.setAttribute("usertype", user.getUserType());

            if ("admin".equalsIgnoreCase(user.getUserType())) {
                response.sendRedirect("admin_home.jsp");
            } else if ("passenger".equalsIgnoreCase(user.getUserType())) {
                response.sendRedirect("passenger_home.jsp");
            } else {
                request.setAttribute("errorMsg", "Invalid user type!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMsg", "Invalid credentials!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
