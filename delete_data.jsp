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
                            <%/*               <li><a href="about.jsp">About us</a></li>
                            <li><a href="contact.jsp">Contact us</a></li>*/%>
                                     </ul>
                    </div>
                </div>
            </div>
        </div>
  <link rel="stylesheet" href="css/style_1.css">
</head>
<body>


                                <section class="form-4">                  
                                    <center> <h1>Delete file</h1> <br>
                                        </section>
                            <style>
          table, th, td {
                border: 1px solid white;
                border-collapse: collapse;}
            th, td {
                padding: 5px;
                text-align: center; 
                font-style: normal;
                font-weight: bolder ;
                font-size: 22px;
                color: wheat;
            }</style>
    <center>
        <table style="width:80%">
    
<% 
                                    String s=""+session.getAttribute("userid");
                ResultSet rs = MyConnection.getResultFromSqlQuery("select id,name,type, upload_time from db where uploaded_by='"+s+"'");
                int count =0;
                while(rs.next())
                {
                         ++count;   
                    if(count==1)
                        out.print("<tr><th>DB Name</th><th>File Type</th><th>Upload Time</th><th>Action</th></tr>");
            
                   out.println("<tr>"
                           + "<td>"+rs.getString(2)+"</td>"
                           + "<td>"+rs.getString(3)+"</td>"
                           + "<td>"+rs.getString(4)+"</td>"
                           + "<td><a href='sadelete.jsp?Doc_id="+rs.getInt(1) +"'> Delete </a></td>"                                                      
                           + "</tr>");
                     
                       
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
<form action="success.jsp"><input type="submit" value="Back" name="back" /> </form>
 </div>                                

    
</body>
</html>
