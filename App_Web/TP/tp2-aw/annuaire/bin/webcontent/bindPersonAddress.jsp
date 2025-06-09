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
            Collection<Address> addresses = (Collection<Address>)request.getAttribute("addresses");
            String erreurMessage = (String) request.getAttribute("error");
            if (persons != null && addresses != null && erreurMessage == null) {
        %>

        <h1>Associer une personne et une adresse.</h1>
        <form action="Serv" method="get">
            <p>Choisir la personne: </p>
            <% if ((Boolean) request.getAttribute("personsEmpty")) { %>
                <p>Il n'y a pas de personnes dans l'annuaire pour le moment.</p>
            <% } else { %>
                <% for (Person person : persons) { %>
                    <input type="radio" id="<%= person.getId() %>" name="bindingPerson" value="<%= person.getId() %>">
                    <label for="<%= person.getId() %>"><%= person.getFirstName() %> <%= person.getLastName() %></label><br>
                <% } %>
            <% } %>

            <br>

            <p>Choisir l'adresse:</p>
            <% if ((Boolean) request.getAttribute("addressesEmpty")) { %>
                <p>Il n'y a pas d'adresses dans l'annuaire pour le moment.</p>
            <% } else { %>
                <% for (Address address : addresses) { %>
                    <input type="radio" id="<%= address.getId() %>" name="bindingAddress" value="<%= address.getId() %>">
                    <label for="<%= address.getId() %>"><%= address.getStreet() %> <%= address.getCity() %></label><br>
                <% } %>
            <% } %>
        
            <input type="submit" value="OK">
            <input type="hidden" name="op" value="executeBinding">
        </form>

        <% } else { %>
            <p>Erreur</p><br/>
        <% } %>

    </body>
</html>