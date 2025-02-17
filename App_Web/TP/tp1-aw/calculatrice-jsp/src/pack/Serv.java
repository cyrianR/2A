package pack;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Serv")
public class Serv extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("somme", null);
        try {
            String compute = request.getParameter("compute");
            if (compute.equals("add")) {
                float somme = Float.parseFloat(request.getParameter("nb1")) + Float.parseFloat(request.getParameter("nb2"));
                request.setAttribute("somme", somme);
            }
        } catch (Exception e) {
            request.setAttribute("somme", e.getMessage());
            e.printStackTrace();
        }
        request.getRequestDispatcher("page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}