<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Confirm Registration</title>
                    
        <link rel="stylesheet" href="css/reg.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    
    <style>	
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
                        <div class="lo fl-lt"> <a href="index.jsp">WebCloud</a></div>
                        <div class="con fl-rt"> <span>Date:
                                <% 
                                    Date d = new Date();
                                    SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy 'at' hh:mm:ss");
                                    out.print("<h3>" + dt.format(d) + "</h3>");%>
                                <br>
   <%  
            Object o=session.getAttribute("userid");
            
            if(o!=null)
            {
                 out.print("<div class=\"profile fl-rt\"> <a href=\"profile.jsp\">"+session.getAttribute("f_name")+" "+session.getAttribute("l_name")+"</a></div><br>");
               
            out.print("<br><form action=\"logout.jsp\"><input type=\"submit\" value=\"LOGOUT\" name=\"logout\" /> </form>");
            }
            %></span> </div>
                        <div class="clear"></div>
                    </div>
                    <div class="menu">
                        <ul>
           <li><a href="index.jsp">Home</a></li>
                            <li><a href="business.jsp">Login</a></li>
                            <li><a href="about.jsp">About us</a></li>
                            <li><a href="contact.jsp">Contact us</a></li>
                                     </ul>
                    </div>
                </div>
            </div>
        </div>
                        <title>Confirm Registration</title>
  <link rel="stylesheet" href="css/style_1.css">
</head>
<body>
<center>
                <style>h4{
                    font-size: 25px;
                    color: #f6f6f6;
                    
}</style>
        <%
               Object s=session.getAttribute("com");
               String user=s.toString();
               
            String q = "UPDATE business SET code=null WHERE Email='" + user+ "'";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement st = con.prepareStatement(q);
            
            int i= st.executeUpdate(q);
               
            
        %>  
                            
                <br>   <center><h4>Successful Registration. Now you can Login.</h4>
                <br>

                
</body>
</html>
