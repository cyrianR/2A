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
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            response.setContentType("text/html");
            out.print("<html><body><h1>Serv</h1>");
            String compute = request.getParameter("compute");
            if (compute.equals("add")) {
                float somme = Float.parseFloat(request.getParameter("nb1")) + Float.parseFloat(request.getParameter("nb2"));
                out.print("<p>"+ String.valueOf(somme) +"</p>");
            }
            out.print("</body></html>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}