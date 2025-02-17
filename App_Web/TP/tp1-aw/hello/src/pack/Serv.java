package pack;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Serv")
public class Serv extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // EXO 1
        // response.getWriter().println("<html><body>Hello World !</body></html>");
        
        // EXO 2
        String s1 = request.getParameter("nb1");
        String s2 = request.getParameter("nb2");
        float somme = Float.parseFloat(s1) +  Float.parseFloat(s2);
        response.getWriter().println("<html><body>La somme de " + s1 + " et " + s2 + " est " + String.valueOf(somme) + "</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}