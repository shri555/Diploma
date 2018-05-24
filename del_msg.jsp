<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<html>
    
    
     <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Delete Message</title>
        <link rel="stylesheet" href="css/reg.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <style>	
        body {
            background: #7f9b4e url(images/bg2.jpg) no-repeat center top;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
        }
        .container > header h1,
        .container > header h2 {
            color: #fff;
            text-shadow: 0 1px 1px rgba(0,0,0,0.7);
        }
    </style>

    <body>
        <div class="outer">
            <div class="wrapper">
                <div class="header">
                    <!--header-start-->
                    <div class="header_top">
                        <div class="logo fl-lt"> <a href="index.jsp">WebCloud</a></div>
                        <div class="contact fl-rt"> <span>Date:
                                <% Date d = new Date();
                                    SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy 'at' hh:mm:ss");
                                    out.print("<h3>" + dt.format(d) + "</h3>");%>
                                <br>
                                <br> <br>   <%  
            Object o=session.getAttribute("userid");
            
            if(o!=null)
            {
                   out.print("<div class=\"profile fl-rt\"> <a href=\"profile.jsp\">"+session.getAttribute("f_name")+" "+session.getAttribute("l_name")+"</a></div><br>");
               
            out.print("<form action=\"logout.jsp\"><input type=\"submit\" value=\"LOGOUT\" name=\"logout\" /> </form>");
            }
            %></span> </div>
                        <div class="clear"></div>
                    </div>
                    <div class="menu">
                        <ul>
       <li><a href="index.jsp">Home</a></li>
                            <li><a href="services.jsp">Services</a></li>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="register.jsp">Register</a></li>
                            <li><a href="about.jsp">About us</a></li>
                            <li><a href="contact.jsp">Contact us</a></li>
                                         </ul>
                    </div>
                </div>
                        <%
            
    if(session.getAttribute("userid")!=null)
    {
        String user=session.getAttribute("userid").toString();
        ResultSet rs = MyConnection.getResultFromSqlQuery("select new from shri where username='" + user + "'");
                            while (rs.next()) {
                                if(rs.getString(1) != null)
                                {
                                    out.print("<center><form action=\"view_msg.jsp\"><input type=\"submit\" value=\"You Have a New Message. Click to View New Message\" name=\"msg\" /> </form>");
            }
                             }

                             
                            rs.close();
                            MyConnection.CloseConnection();
                          

    }
    
    %>
    <body><br><br><br><section class="form-4"><center><br><br><h1>
<%
    String id = request.getParameter("id");     
                       String connectionURL = "jdbc:mysql://localhost/shri";  
  
                         
  
                         
                         
            String q = "DELETE from chat where id = " + id;

            Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");  
                        
            Statement s = con.prepareStatement(q);
            
            int i= s.executeUpdate(q);
           if(i>0)
           {
               response.sendRedirect("view_msg.jsp");
           }
           else
           {
                out.print("<h1> Error While Deleting Message.<br/><br/> </h1>");
           }
                         
                            
                             
%>
</section>
    </body>
</html>