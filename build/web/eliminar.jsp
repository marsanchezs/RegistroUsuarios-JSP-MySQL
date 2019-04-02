<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
              String code = request.getParameter("code");
              
              Connection cnx = null;
              ResultSet rs = null;
              Statement sta = null;
              
              try{
                 Class.forName("com.mysql.jdbc.Driver");
              cnx = DriverManager.getConnection
                    ("jdbc:mysql://localhost/cursojsp?user=root&password="); 
              
              sta = cnx.createStatement();
              sta.executeUpdate("delete from usuarios where codUsu = '"+code+"'");
              request.getRequestDispatcher("Listado.jsp").forward(request, response);
              sta.close();
              rs.close();
              cnx.close();
              }catch(Exception e){out.print(e+"");}
              
            
            %>
        
    </body>
</html>
