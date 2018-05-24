<%@ page import="java.io.*,java.util.*,java.sql.*, javax.sql.*,javax.naming.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Registration</title>

    </head>
    <body>
        <%
            String user=new String();
            Object o= session.getAttribute("com");
            user = o.toString();
            String code = request.getParameter("code");
            String connectionURL = "jdbc:mysql://localhost/shri";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT username,code FROM shri WHERE username='" + user + "' AND code='" + code + "'");
                 if (rs.next()) {
                 
                    response.sendRedirect("reg_success.jsp");
                 }

             else {
                response.sendRedirect("com_error.jsp");

            }
          
            
        %>  
    </body>

</html>