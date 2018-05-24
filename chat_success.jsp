<%@page import="conPackage.MyConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.io.*,java.sql.*, javax.sql.*,javax.naming.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Messaging</title>
          
         <link rel="stylesheet" href="css/reg.css">
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
                                <% 
                                    Date d = new Date();
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
            %>
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
</head><%
            
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
    <body> 
        <style>
            h2{
                font-size: 3em;
                font-style: oblique;
                font-weight: bolder;
                color: window;
            }
        </style>
        <br>
    <center><h2>Message send Successfully!!!</h2>
        <section class="main">
            <form class="form-4" method="post" action="chat_rply.jsp">
                <h1>Enter Username Of User To Send Message</h1>
                <p>
                    <label for="share">Username</label>
                    <%
                                    if(request.getParameter("chat")!=null)
                                    {
                    out.print("<input type=\"text\" name=\"chat\" placeholder=\"Username\" value=\""+request.getParameter("chat")+"\" required>");
                            }
                                    else
                                    {
                    out.print("<input type=\"text\" name=\"chat\" placeholder=\"Username\" required>");
                                        
                                    }
                            %>
                </p>
                <p>
                    <textarea name="msg" placeholde="Enter Your Message" style="margin: 0px; width: 282px; height: 156px;" required></textarea>
                </p>
                <p>
                    <input type="submit" name="submit" value="Send Message">
                </p>       
            </form>​
            <div class="logo fl-rt"> <a href="chat_user.jsp">See Users List</a></div>
        </section>

    
    </body>
    
</html>