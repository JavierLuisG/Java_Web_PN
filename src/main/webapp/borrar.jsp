<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
        <!-- instalacion de bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <title>Borrar registro</title>
    </head>
    <body>
        <%
            String driver = "com.mysql.cj.jdbc.Driver";
            String username = "root";
            String password = "123456";
            String port = "3306";
            String hostname = "localhost";
            String database = "pruebahlf";
            String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database;
            Connection conn;
            Statement statement;
            ResultSet rs;
            try{
                Class.forName(driver);
                conn = DriverManager.getConnection(url, username, password);
                statement = conn.createStatement();
                statement.executeUpdate("DELETE FROM empleados WHERE id = '" + request.getParameter("id") + "';");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch(SQLException ex){
                out.print("Error en la MySQL " + ex);
            }
        %>
    </body>
</html>
