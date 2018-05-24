<%-- 
    Document   : login
    Created on : 24 Nov, 2014, 4:11:00 PM
    Author     : Shrikrishna
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Login Page</title>

      
<link type="text/css" rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css_login/style.css" />
        <script src="js/modernizr.custom.63321.js"></script>
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
                                <% Date d = new Date();
                                    SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy 'at' hh:mm:ss");
                                    out.print("<h3>" + dt.format(d) + "</h3>");%>
                                
                                </span> </div>
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
      </head>
        <section class="main">
            <form class="form-4" method="post" action="login_rply.jsp">
                <center> <h3>Please Login First.</h3></center><br><br><br>
                <h1>Login</h1>
                <p>
                    <label for="login">Username or email</label>
                    <input type="text" name="login" placeholder="Username or email" required>
                </p>
                <p>
                    <label for="password">Password</label>
                    <input type="password" name='password' placeholder="Password" required> 
                </p>

                <p>
                    <input type="submit" name="submit" value="Sign In">
                </p>       
            </form>​
        </section>

    </body>
</html>