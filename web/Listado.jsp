<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Listado de Usuarios</h1>
        
        <table border="1" width="600" align="center">
            <tr bgcolor="yellow">
                <th colspan="5">Registro de Usuarios</th>
                <th><a href="agregar.jsp"> 
                        <img src="Iconos/agregar.png" width="40" height="40"></a></th>
            </tr>
            <tr bgcolor="yellow">
                <th>Código</th><th>Nombre</th>
                <th>Edad</th><th>Sexo</th>
                <th>Password</th><th>Acción</th>
            </tr>
        
            <%
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
                        %>
                        <tr> <!–Imprime en la fila 1, luego en la 2 y asi sucesivamente las columnas 1, 2, 3, 4 y 5.–>
                            <th><%=rs.getString(1)%></th>
                            <th><%=rs.getString(2)%></th>
                            <th><%=rs.getString(3)%></th>
                            <th><%=rs.getString(4)%></th>
                            <th><%=rs.getString(5)%></th>
                            <th>
                                <a href="editar.jsp?code=<%=rs.getString(1)%>"> 
                                <img src="Iconos/editar.png" width="30" height="30">||
                                </a>
                                
                                <a href="eliminar.jsp?code=<%=rs.getString(1)%>">
                                <img src="Iconos/eliminar.png" width="30" height="30">
                                </a>
                            </th>
                        </tr>                     
                        <%
                    }
                    sta.close();
                    rs.close();
                    cnx.close();

                }catch(Exception e){}
                    
                %>
        </table>
    </body>
</html>
