<%@ page language="java" import="pack.*, java.util.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Annuaire</title>
    </head>
    <body>
        <%
            Collection<Person> persons = (Collection<Person>)request.getAttribute("persons");
            String erreurMessage = (String) request.getAttribute("error");
            if (persons != null && erreurMessage == null) {
        %>

            <h1>Annuaire</h1>
            <% if ((Boolean) request.getAttribute("personsEmpty")) { %>
                <p>Il n'y a pas de personnes dans l'annuaire pour le moment.</p><br/>
            <% } else { %>
                <% for (Person person : persons) { %>
                    <p><b><%= person.getFirstName() %> <%= person.getLastName() %></b></p><br>
                    <% for (Address address : person.getAddresses()) { %>
                        <p><%= address.getStreet() %> <%= address.getCity() %></p><br>
                    <% } %>
                <% } %>
            <% } %>

        <% } else { %>
            <p>Erreur</p><br/>
        <% } %>

    </body>
</html>