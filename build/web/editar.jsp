<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Editar Usuarios</h1>
        <%
            String code = request.getParameter("code");
            
                Connection cnx = null; //Conecta a MySQL.
                Statement sta = null; //Ejecuta sentencias SQL.
                ResultSet rs = null; //Guarda valores.
                
                try{
                    Class.forName("com.mysql.jdbc.Driver"); //Inicializacion driver de conexion a MySQL.
                    cnx=DriverManager.getConnection 
                        ("jdbc:mysql://localhost/cursojsp?user=root&password="); //Inicializacion cadena de conexion.
                    
                    sta = cnx.createStatement(); //Inicializa el statement para poder ejecutar la consulta SQL.
                    rs = sta.executeQuery("select * from usuarios where codUsu = '"+code+"'"); //Ejecuta la consulta SQL y  guarda valores en la variable rs.
                    
                    while(rs.next()){ //Mientras rs tenga datos
            %>
        
        <form action="">
            <table border="1" width="300" align="center">
                <tr>
                    <td>Código:</td>
                    <td><input type="text" name="txtCode" value="<%=rs.getString(1)%>" readonly="readonly"</td>
                </tr> 
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtName" value="<%=rs.getString(2)%>"</td>
                </tr>
                <tr>
                    <td>Edad:</td>
                    <td><input type="text" name="txtAge" value="<%=rs.getString(3)%>"</td>
                </tr> 
                <tr>
                    <td>Sexo:</td>
                    <td><input type="radio" name="gender" value="M" > Masculino
                        <input type="radio" name="gender" value="F" > Femenino</td>
                </tr> 
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="txtPass" value="<%=rs.getString(5)%>"</td>
                </tr> 
                <tr>
                    <th colspan="2">
                        <input type="submit" name="btnEditar" value="Editar Usuario">
                    </th>
                </tr> 
            </table>  
        </form>
                
                    <%
                       }
                        }catch(Exception e){}


                        if(request.getParameter("btnEditar")!=null){
                        String codeUser = request.getParameter("txtCode");
                        String name = request.getParameter("txtName");
                        int age = Integer.parseInt(request.getParameter("txtAge"));
                        String sex = request.getParameter("gender");
                        String pass = request.getParameter("txtPass");

                        sta.executeUpdate("update usuarios set nomUsu='"+name+"',edadUsu="+age+",sexUsu='"+sex+"',passUsu= '"+pass+"' where CodUsu = '"+codeUser+"'");

                        request.getRequestDispatcher("Listado.jsp").forward(request, response);
}
                        %>
    </body>
</html>
