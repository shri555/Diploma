<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>About Business Services</title>
               <link rel="stylesheet" href="css/reg.css">
       <link rel="stylesheet" type="text/css" href="css_login/style.css" />
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
                            <li><a href="about_b.jsp">About us</a></li>
                            <li><a href="contact_b.jsp">Contact us</a></li>
                                     </ul>
                    </div>
                </div>
            </div>
        </div>
  <link rel="stylesheet" href="css/style_1.css">
</head>
<body>
<div class="content">
                    <!--content-start-->
                    
                    <div class="content_bottom">
                        <div class="content_left fl-lt">
                            <h1>About Us</h1>
                         
                            <div class="pic_area">
                                <div class="fl-lt"> <img src="img/Cloud.jpg" alt="" width="470" height="268"> </div>
                                <div class="pic_area">
                                    <pp> We propose a cloud environment to backup and store data on a private cloud for storage data in order to increase the performance of these applications. This option allows input / output parallel, so that will reduce the access times to data. On the client-end, a multi platform application is developed using free software that allows data transfer fast and simple way. The advantages of this implementation is that it can reuse existing infrastructure (servers, cluster, and other devices ) to reduce costs, becoming an advantage compared to having to deploy a private cloud from nowhere. </pp>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="content_right fl-rt">
                            <h1>Our Goals</h1>
                            <h4> Fast And Secure Service.</h4>
                            <pp> Our cloud provide fast and secure service for storing your files and downloading your files back. You can also share files so it is so reliable. </p>
                            <h4> Good Application Services.</a></h4>
                            <pp> Application as a service this is provided by our cloud. So as application we provide HTML viewer and Messaging services. These both services are fast and robust. Easy to use. </p>
                            <h4> Mobile Access.</h4>
                            <pp> We provide a mobile access to store file and download files. That is you can upload your file from anywhere and can download that file from elsewhere. It will give you security and good performance of cloud system. </p>
                             </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--content-end-->
            </div>
        </div>
        <div class="footer_wrap">
           

</body>
</html>
