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

    private Facade facade = new Facade();
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String op = request.getParameter("op");
            if (op.equals("bindPersonAddress")) {
                request.setAttribute("personsEmpty", facade.listPersons().isEmpty());
                request.setAttribute("persons", facade.listPersons());
                request.setAttribute("addressesEmpty", facade.listAddresses().isEmpty());
                request.setAttribute("addresses", facade.listAddresses());
                request.getRequestDispatcher("bindPersonAddress.jsp").forward(request, response);
            }
            if (op.equals("executeBinding")) {
                long personId = Long.parseLong(request.getParameter("bindingPerson"));
                long addressId = Long.parseLong(request.getParameter("bindingAddress"));
                facade.bindPersonAddress(personId, addressId);

                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                out.print("<html><body>");
                out.print("<p>Lien bien créé.</p>");
                out.print("</body></html>");
            }
            if (op.equals("list")) {
                request.setAttribute("personsEmpty", facade.listPersons().isEmpty());
                request.setAttribute("persons", facade.listPersons());
                request.getRequestDispatcher("list.jsp").forward(request, response);
            }
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.print("<html><body>");
            out.print("<p>Erreur</p><br/>");
            out.print("<p>" + e.getMessage() + "</p>");
            out.print("</body></html>");
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            response.setContentType("text/html");
            out.print("<html><body>");
            String op = request.getParameter("op");
            if (op.equals("addPerson")) {
                String lastName = request.getParameter("lastName");
                String firstName = request.getParameter("firstName");
                facade.addPerson(firstName, lastName);
                out.print("<p>Personne bien ajoutée !</p>");
            } else if (op.equals("addAddress")) {
                String street = request.getParameter("street");
                String city = request.getParameter("city");
                facade.addAddress(street, city);
                out.print("<p>Adresse bien ajoutée !</p>");
            }
            out.print("</body></html>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}