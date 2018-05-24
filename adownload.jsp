<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>File List</title>
        <link rel="stylesheet" href="css/reg.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
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
    
    <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;}
            th, td {
                padding: 5px;
                text-align: center; 
                font-style: normal;
                font-weight: bolder ;
                font-size: 25px;
            }
        </style>
                                <section class="form-4">                  
                                    <center> <h1>Download file Page!</h1>
                                        </section>
                
    <center>
        <table style="width:80%">
    
            <% 
                                    String s=""+session.getAttribute("userid");
                ResultSet rs = MyConnection.getResultFromSqlQuery("select doc_id,filename,type, upload_time from documents where upload_by='"+s+"'");
                int count =0;
                while(rs.next())
                {
                    ++count;   
                    if(count==1)
                        out.print("<tr> <th colspan='4'>File Name</th><th colspan='4'>File Type</th><th colspan='4'>Upload Time</th><th colspan='4'>Action</th></tr><br/>");
            
                   out.println("<tr>"
                           + "<td colspan='4'>"+rs.getString(2)+"</td>"
                           + "<td colspan='4'>"+rs.getString(3)+"</td>"
                           + "<td colspan='4'>"+rs.getString(4)+"</td>"
                           + "<td colspan='4'><a href='sdownload.jsp?Doc_id="+rs.getInt(1) +"'> Download </a></td>"                                                      
                           + "</tr>"+"<br>");
                       
                }
                rs.close();
                MyConnection.CloseConnection();
                if(count==0)
                {
                    out.println("<tr><td colspan='4'> No File Found..!! </td></tr>");
                }
            %>            
        </table>
        <br/>
         

    <div class="contact"><br><center>
<form action="infrastructure.jsp"><input type="submit" value="Back" name="back" /> </form>
 </div>                                
    </body>
</html>