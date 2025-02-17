<%@ page language="java" import="pack.*, java.util.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Serv</title>
    </head>
    <body>
    <h1>Enter two numbers</h1>
    <form action= "Serv" method="get">
    nb1<input type="text" name="nb1"><br/>
    nb2<input type="text" name="nb2"><br/>
    <input type="submit" name="compute" value="add">
    </form>
    
    <% if (request.getAttribute("somme") != null) { %>
        <p>La somme est : ${somme}</p>
        <% } %>
    </body>
</html>