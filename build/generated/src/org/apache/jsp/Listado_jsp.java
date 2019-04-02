package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Listado_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1 align=\"center\">Listado de Usuarios</h1>\n");
      out.write("        \n");
      out.write("        <table border=\"1\" width=\"600\" align=\"center\">\n");
      out.write("            <tr bgcolor=\"yellow\">\n");
      out.write("                <th colspan=\"5\">Registro de Usuarios</th>\n");
      out.write("                <th><a href=\"agregar.jsp\"> \n");
      out.write("                        <img src=\"Iconos/agregar.png\" width=\"40\" height=\"40\"></a></th>\n");
      out.write("            </tr>\n");
      out.write("            <tr bgcolor=\"yellow\">\n");
      out.write("                <th>Código</th><th>Nombre</th>\n");
      out.write("                <th>Edad</th><th>Sexo</th>\n");
      out.write("                <th>Password</th><th>Acción</th>\n");
      out.write("            </tr>\n");
      out.write("        \n");
      out.write("            ");

                Connection cnx = null; //Conecta a MySQL.
                Statement sta = null; //Ejecuta sentencias SQL.
                ResultSet rs = null; //Guarda valores.
                
                try{
                    Class.forName("com.mysql.jdbc.Driver"); //Inicializacion driver de conexion a MySQL.
                    cnx=DriverManager.getConnection 
                        ("jdbc:mysql://localhost/cursojsp?user=root&password="); //Inicializacion cadena de conexion.
                    
                    sta = cnx.createStatement(); //Inicializa el statement para poder ejecutar la consulta SQL.
                    rs = sta.executeQuery("select * from usuarios"); //Ejecuta la consulta SQL y  guarda valores en la variable rs.
                    
                    while(rs.next()){ //Mientras rs tenga datos
                        
      out.write("\n");
      out.write("                        <tr> <!–Imprime en la fila 1, luego en la 2 y asi sucesivamente las columnas 1, 2, 3, 4 y 5.–>\n");
      out.write("                            <th>");
      out.print(rs.getString(1));
      out.write("</th>\n");
      out.write("                            <th>");
      out.print(rs.getString(2));
      out.write("</th>\n");
      out.write("                            <th>");
      out.print(rs.getString(3));
      out.write("</th>\n");
      out.write("                            <th>");
      out.print(rs.getString(4));
      out.write("</th>\n");
      out.write("                            <th>");
      out.print(rs.getString(5));
      out.write("</th>\n");
      out.write("                            <th>\n");
      out.write("                                <a href=\"editar.jsp?code=");
      out.print(rs.getString(1));
      out.write("\"> \n");
      out.write("                                <img src=\"Iconos/editar.png\" width=\"30\" height=\"30\">||\n");
      out.write("                                </a>\n");
      out.write("                                \n");
      out.write("                                <a href=\"eliminar.jsp?code=");
      out.print(rs.getString(1));
      out.write("\">\n");
      out.write("                                <img src=\"Iconos/eliminar.png\" width=\"30\" height=\"30\">\n");
      out.write("                                </a>\n");
      out.write("                            </th>\n");
      out.write("                        </tr>                     \n");
      out.write("                        ");

                    }
                    sta.close();
                    rs.close();
                    cnx.close();

                }catch(Exception e){}
                    
                
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
