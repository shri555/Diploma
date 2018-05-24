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
            String user = session.getAttribute("userid").toString();
            String msg = request.getParameter("msg");
            String to = request.getParameter("chat");
            String connectionURL = "jdbc:mysql://localhost/shri";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            
            //ResultSet rsc = stc.executeQuery("INSERT INTO chat (sender,receiver,msg) VALUES('" + user + "','" + to + "','"  + msg +"')");
             String q = "INSERT INTO chat (sender,receiver,msg) VALUES('" + user + "','" + to + "','"  + msg +"')";
 Statement st = con.prepareStatement(q);
            
            int i= st.executeUpdate(q);
                      String p = "INSERT INTO sent_msg (sender,receiver,msg) VALUES('" + user + "','" + to + "','"  + msg +"')";
 Statement t = con.prepareStatement(p);
            
            int j= t.executeUpdate(p);

                 if (i>0 & j>0)
                 {
            String a = "UPDATE shri SET new=100 WHERE username='" + to+ "'";
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement s = c.prepareStatement(a);
            int k= s.executeUpdate(a);
           if(k>0) 
               response.sendRedirect("chat_success.jsp");
                 }
                 else
                 response.sendRedirect("chat_error.jsp?chat="+to);
           
        %>  
    </body>

</html>