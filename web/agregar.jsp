<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Registro de Usuarios</h1>
        <form action="">
            <table border="1" width="300" align="center">
                <tr>
                    <td>Código:</td>
                    <td><input type="text" name="txtCode"</td>
                </tr> 
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtName"</td>
                </tr>
                <tr>
                    <td>Edad:</td>
                    <td><input type="text" name="txtAge"</td>
                </tr> 
                <tr>
                    <td>Sexo:</td>
                    <td><input type="radio" name="gender" value="M"> Masculino
                        <input type="radio" name="gender" value="F"> Femenino</td>
                </tr> 
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="txtPass"</td>
                </tr> 
                <tr>
                    <th colspan="2">
                        <input type="submit" name="btnGuardar" value="Guardar Usuario">
                    </th>
                </tr> 
            </table>  
        </form>
        <%
            if(request.getParameter("btnGuardar")!=null){
              String code = request.getParameter("txtCode");
              String name = request.getParameter("txtName");
              int age = Integer.parseInt(request.getParameter("txtAge"));
              String sex = request.getParameter("gender");
              String pass = request.getParameter("txtPass");
              
              Connection cnx = null;
              ResultSet rs = null;
              Statement sta = null;
              
              try{
                 Class.forName("com.mysql.jdbc.Driver");
              cnx = DriverManager.getConnection
                    ("jdbc:mysql://localhost/cursojsp?user=root&password="); 
              
              sta = cnx.createStatement();
              sta.executeUpdate("insert into usuarios values('"+code+"','"+name+"',"+age+",'"+sex+"','"+pass+"')");
              request.getRequestDispatcher("Listado.jsp").forward(request, response);
              sta.close();
              rs.close();
              cnx.close();
              }catch(Exception e){out.print(e+"");}
              
            }
            %>
    </body>
</html>
