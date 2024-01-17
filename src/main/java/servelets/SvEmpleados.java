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
import java.util.logging.Level;
import java.util.logging.Logger;

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
                String query = "SELECT * FROM empleados";
                String where = "";
                String nombre = request.getParameter("nombre");
                // dos condiciones que verifican si nombre es null y si where está vacio
                if (nombre != null && !nombre.isEmpty()) {
                    nombre = this.mysql_real_scape_string(nombre);
                    // se le indica a la consulta que va a recibir algun valor '?'
                    where = " where nombre = ?"; 
                }
                query += where;
                // Declaramos el Prepared... (se prepara el query para recibir la variable nombre)
                PreparedStatement preparar = conn.prepareStatement(query);
                // se indica la posicion donde esta el valor (? -> está en el primero)y el valor
                if (nombre != null && !nombre.isEmpty()) {
                    preparar.setString(1, nombre);
                }                
                // se ejecuta el query y como devuelve un ResultSet se guarda en el rs
                rs = preparar.executeQuery();
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
            /** 
             * La maquina realiza demasiados ataques en un solo momento
             * finally permite que no se sature la pagina de tantas consultas en poco tiempo
             */
            } finally { 
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SvEmpleados.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    /**
     * aparte del \ hay mas simbolos que sirven para hacer inyección
     * aqui se ingresan todas las posibles formas de inyección 
     */
    public String mysql_real_scape_string(String texto) {
        // para prevenir inyección -> la \' es la forma como ' se agrega al texto literalmente
        texto = texto.replaceAll("\\\\", "\\\\\\\\");
        texto = texto.replaceAll("\\n", "\\\\n");   
        texto = texto.replaceAll("\\r", "\\\\r");
        texto = texto.replaceAll("\\t", "\\\\t");
        texto = texto.replaceAll("'", "\\\\'"); // debe ir de ultimas es necesario 4 \
        return texto;
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
