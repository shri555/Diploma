<%-- 
    Document   : register
    Created on : 24 Nov, 2014, 5:36:43 PM
    Author     : Shrikrishna
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Registration Form</title>
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
    <div class="wrapper">
    <div class="header">
      <!--header-start-->
      <div class="header_top">
        <div class="logo fl-lt"> <a href="index.jsp">WebCloud</a></div>
        <div class="contact fl-rt"> <span>Date:
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
                            <li><a href="services.jsp">Services</a></li>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="register.jsp">Register</a></li>
                            <li><a href="about.jsp">About us</a></li>
                            <li><a href="contact.jsp">Contact us</a></li>
                       </ul>
      </div>
    </div>
  </div>
  <div class="container">
    <section class="register">
        
      <h1>Select Your Profile Photo</h1>
      <form name="form" method="post" action="dp_rply.jsp" >
      <div class="reg_section personal_info">
      <h3> Select Your profile Photo</h3>
          <input type="file" name="file"/>
      
   
      </div>
      <p class="submit"><center><input type="submit" name="commit" value="Change Profile"></p>
      </form>
    </section>
  </div>


</body>
      
</html>