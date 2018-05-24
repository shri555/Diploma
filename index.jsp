<%@page import="conPackage.MyConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Home - WebCloud</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/reg.css">
        <link rel="stylesheet" type="text/css" href="css_login/style.css" />
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
                                    out.print("<h3>" + dt.format(d) + "</h3>");
                                
                                     String q = "set global max_allowed_packet=1024*1024*500;";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement st = con.prepareStatement(q);
            
            int i= st.executeUpdate(q);
                                %>
                                <br>
                               
                                <%  
            Object o=session.getAttribute("userid");
            
            if(o!=null)
            {
                String user=session.getAttribute("userid").toString();
        ResultSet rs = MyConnection.getResultFromSqlQuery("select dp from shri where username='" + user + "'");
                            while (rs.next()) {
                 if(rs.getString(1)!= null)
                 {
        //    out.print("<img src=\"profile\\"+rs.getString(1)+".jpg\" height=\"150px\" width=\"150px\" alt=\"ProfilePic\">");
            out.print("<div class=\"profile fl-rt\"> <a href=\"profile.jsp\">"+session.getAttribute("f_name")+" "+session.getAttribute("l_name")+"</a></div><br>");
            out.print("<br><form action=\"logout.jsp\"><input type=\"submit\" value=\"LOGOUT\" name=\"logout\" /> </form>");
                 }
                            else
                 {
                //  out.print("<img src=\"profile\\default.jpg\" height=\"150px\" width=\"150px\" alt=\"ProfilePic\">");
            out.print("<div class=\"profile fl-rt\"> <a href=\"profile.jsp\">"+session.getAttribute("f_name")+" "+session.getAttribute("l_name")+"</a></div><br>");
            out.print("<br><form action=\"logout.jsp\"><input type=\"submit\" value=\"LOGOUT\" name=\"logout\" /> </form>");
               
                 }}
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
                <!--header-end-->
                <div class="content">
                    <!--content-start-->
                    <div class="banner"><center> <img src="img/a.jpg" alt="" width="800" height="318"> </div>
                    <div class="content_bottom">
                        <div class="content_left fl-lt">
   
                            <h2>Welcome to our website</h2>
                            <p> Nowadays due to the growth of technologies, we have different services and applications that allow users to perform tasks that improve productivity in their daily activities.However, the need to access any time and / or from a remote site has grown from a theoretical proposal a genuine need. This has given rise to seek alternatives to solve this problem. One of the alternatives is known by the term cloud computing; cloud computing can be defined as that service (software, platform or
infrastructure) located on the Internet and is accessed from a mobile device or desktop computer, giving users a wide variety of applications (databases, middle office software, storage,etc.).
</p>
                            <div class="pic_area">
                                <div class="fl-lt"> <img src="img/pic1.jpg" alt="" width="200" height="268"> </div>
                                <div class="pic_area_right fl-rt">
                                    <p> We propose a cloud environment to backup and store data on a private cloud using PVFS2 like file system for storage data in order to increase the performance of these applications. This option allows input / output parallel, so that will reduce the access times to data. On the client-end, a multi platform application is developed using free software that allows data transfer fast and simple way. </p>
                                    <p> The advantages of this implementation is that it can reuse existing infrastructure (servers, cluster, and other devices) to reduce costs, becoming an advantage compared to having to deploy a private cloud from nowhere. </p>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="content_right fl-rt">
                            <h2>Our Services</h2>
                            <h3><a href="html_view.jsp">HTML Viewer.</a></h3>
                            <p> HTML viewer is provided to view the design view of HTML code on browser window. It shows frequent output of that in frame below. You must try it. No need to save file in editor with not any extension. It is fast and it is time efficient. </p>
                            <h3><a href="msg.jsp">Messaging.</a></h3>
                            <p> Communication service provided by cloud technology as Application as service. By this you can send message or can chat with users registered in this system. </p>
                            <h3><a href="upload.jsp">File Storage.</a></h3>
                            <p> Storage system is a Infrastructure as service provider by our cloud system. This will gives you space to store files on cloud and retrieve them as your need remotely.    </p>
                            <h3><a href="share.jsp">Share File Among Users.</a></h3>
                            <p> This is a new feature introduced by our cloud that is to share file among users. No extra space will be needed while sharing the file. It is a better option to send or share file between your friends or relatives.</p>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--content-end-->
            </div>
        </div>
        <div class="footer_wrap">
            <!--footer-start-->
            <div class="wrapper">
                <div class="footer_left fl-lt">
                    <div class="footer_menu">
                        <ul>
                            <li class="noback nopad"><a href="index.jsp">Home</a></li>
                            <li><a href="about.jsp">About us</a></li>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="register,jsp">Register</a></li>
                            <li><a href="services.jsp">Services</a></li>
                            <li><a href="contact.jsp">Contact us</a></li>
                        </ul>
                    </div>
                    <p>Copyright © 2015 WebCloud. All rights reserved. Design by <a href="index.jsp">WebCloud</a></p>
                </div>
                <div class="footer_right fl-rt"> <span class="fl-lt">Follow us:</span> <a href="#" class="fl-lt"> <img src="img/twitter.png" alt=""> Twitter </a> <a href="#" class="fl-rt"> <img src="img/fb.png" alt=""> Facebook </a>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!--footer-end-->
    </body>
</html>