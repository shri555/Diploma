<%@ page import="java.io.*,java.util.*,java.sql.*, javax.sql.*,javax.naming.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message</title>

    </head>
    <body>
        <%
          try
          {String name = request.getParameter("name");
            String email = request.getParameter("email");
            String feed = request.getParameter("feed");
            session.setAttribute("user", name);
            String connectionURL = "jdbc:mysql://localhost/shri";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            
           String p = "INSERT INTO feedback (name,email,feed) VALUES('" + name + "','" + email + "','"  + feed +"')";
 Statement st = con.prepareStatement(p);
            
            int i= st.executeUpdate(p);
                
                 if (i>0)
               response.sendRedirect("feed_success.jsp");
                 else
                 response.sendRedirect("error.jsp");
          }catch(Exception e)
          {
response.sendRedirect("error.jsp");
              
          }
        %>  
    </body>

</html>