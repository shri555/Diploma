<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Business Services</title>
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
         session.setAttribute("userid", session.getAttribute("com"));
         
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
                            <%/*               <li><a href="about_b.jsp">About us</a></li>
                            <li><a href="contact_b.jsp">Contact us</a></li>*/%>
                                     </ul>
                    </div>
                </div>
            </div>
        </div>
  <link rel="stylesheet" href="css/style_1.css">
</head>
<body>

      <center>                  <div class="btn">
        <form action="data_upload.jsp" class="form-4"><input type="submit" name="submit" value="Upload Database"></form>
  
        <form action="view_data.jsp" class="form-4"><input type="submit" name="submit" value="View Database"> </form>
    
        <form action="dwnld_data.jsp" class="form-4"><input type="submit" name="submit" value="Download Database"> </form>
     
        <form action="delete_data.jsp" class="form-4"><input type="submit" name="submit" value="Delete Database"> </form>
            </div></center>
    
    
</body>
</html>
