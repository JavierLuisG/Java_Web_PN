/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servelets;
/*
    Cambio de javax a jakarta para que se ejecute en el servicio web. con javax no se ejecuta
 */
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// Librerías para la conexión con la base de datos
import java.sql.*;
import com.mysql.cj.jdbc.Driver;

@WebServlet(name = "SvEmpleados", urlPatterns = {"/SvEmpleados"})
public class SvEmpleados extends HttpServlet {

    // Datos de conexion a la bd
    String driver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "";
    String port = "3306";
    String hostname = "localhost";
    String database = "pruebahlf";
    String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database + "?autoReconnect=true&useSSL=false";
    // conexion a Mysql
    Connection conn;
    Statement statement;
    ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName(driver);
                // credenciales para ingresar a la base de datos
                conn = DriverManager.getConnection(url, username, password);
                statement = conn.createStatement();
                // mostrar datos empleado. ResultSet sirve para jalar los registros
                rs = statement.executeQuery("SELECT * FROM empleados");
                // realizamos while para imprimir por pantalla los datos guardados en la bd
                // rs.next() genera que automaticamente pase a la siguiente casilla para acceder a los datos
                while (rs.next()){
                    out.print(
                            "<tr>"
                                + "<th scope=\"row\">"+ rs.getString(1) +"</th>"
                                + "<td>"+ rs.getString(2) +"</td>"
                                + "<td>"+ rs.getString(3) +"</td>"
                                + "<td>"+ rs.getString(4) +"</td>"
                                + "<td>"
                                // icono de pencil para editar, href para indicar a donde va luego del ? para pasar esos valores
                                    + "<a href=\"editar.jsp?id=" + rs.getString(1) +"&nombre="+ rs.getString(2) +"&direccion="+ rs.getString(3) +"&telefono="+ rs.getString(4) +"\">"
                                        + "<i class=\"bi bi-pen-fill\"></i>"
                                    + "</a>"
                                    // icono de basura para eliminar, m-2 indica un margin de 2 pix 
                                    + "<a href=\"borrar.jsp?id="+ rs.getString(1) +"\" class=\"m-2\">"
                                        + "<i class=\"bi bi-trash-fill\"></i>"
                                    + "</a>"
                                + "</td>"
                            + "</tr> "
                    );
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.print("Error mysql " + e); // Manejo de errores
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
