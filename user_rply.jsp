<%@ page import="java.io.*,java.util.*,java.sql.*, javax.sql.*,javax.naming.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      

    </head>
    <body>
        <%
            String user_n = request.getParameter("new_u");
            String mail = request.getParameter("mail");
            String user= session.getAttribute("userid").toString();
            String q = "UPDATE shri SET username='"+user_n+"' WHERE username='" + user+ "'" +"AND Email='"+mail+ "'";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement st = con.prepareStatement(q);
            
            int i= st.executeUpdate(q);
            if(i>0)
                response.sendRedirect("user_success.jsp");
            else
                response.sendRedirect("user_error.jsp");
           
        %>
        
    </body>

</html>