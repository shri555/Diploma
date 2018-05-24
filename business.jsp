<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Business Login</title>
                    
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
                 
            out.print("<br><form action=\"logout.jsp\"><input type=\"submit\" value=\"LOGOUT\" name=\"logout\" /> </form>");
            }
            %></span> </div>
                        <div class="clear"></div>
                    </div>
                    <div class="menu">
                        <ul>
           <li><a href="index.jsp">Home</a></li>
                            <li><a href="business.jsp">Login</a></li>
                            <%/*                            <li><a href="about_b.jsp">About us</a></li>
                            <li><a href="contact_b.jsp">Contact us</a></li>*/%>
                                     </ul>
                    </div>
                </div>
            </div>
        </div>
                        <title>Login Form</title>
  <link rel="stylesheet" href="css/style_1.css">
</head>
<body>
  <form method="post" action="blogin_rply.jsp" class="login">
    <p>
      <label for="login">Email:</label>
      <input type="text" name="login" id="login" placeholder="name@example.com" required>
    </p>

    <p>
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" placeholder="Password" required>
    </p>

    <p class="login-submit">
      <button type="submit" class="login-button">Login</button>
    </p>
    <br>
    
    </form>
    <p class="forgot-password"><a href="reg_business.jsp">Register New Business.</a></p>


</body>
</html>
