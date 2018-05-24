<%@ page import="java.io.*"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.sql.*"%>

<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import="java.io.*"%>
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
                            <%/*                          <li><a href="about_b.jsp">About us</a></li>
                            <li><a href="contact_b.jsp">Contact us</a></li>*/%>
                                     </ul>
                    </div>
                </div>
            </div>
        </div>
  <link rel="stylesheet" href="css/style_1.css">
        <section class="form-4">

            <center/><input type="submit" value="Upload Status"><br><br><br>

            <%

                String rtempfile = File.createTempFile("temp", "1").getParent();
                MultipartRequest multi = new MultipartRequest(request, rtempfile, 1024 * 1024 * 100);     // maximum size 15 MB

                Enumeration files = multi.getFileNames();


                String st = "insert into db(name, type,content, uploaded_by) values (?,?,?,?)";
                PreparedStatement psmt = MyConnection.getConnection().prepareStatement(st);


                String name = "";
                String fileExtesion = "";
                File ff = null;
                FileInputStream fin = null;

                while (files.hasMoreElements()) {
                    name = (String) files.nextElement();
                    ff = multi.getFile(name);
                    fileExtesion = ff.getName().substring(ff.getName().lastIndexOf("."));
                    String s = "" + session.getAttribute("userid");
                    boolean fileAllowed = true;
                    if ((ff != null) && fileAllowed) {

                        try {
                            fin = new FileInputStream(ff);
                            psmt.setString(1, ff.getName());
                            psmt.setString(2, fileExtesion);
                            psmt.setBinaryStream(3, (InputStream) fin, (int) (ff.length()));
                            psmt.setString(4, s);        // pass the user name or id 
                            boolean sss = psmt.execute();

                            out.print("<h1>Database Uploaded successfully...<h1>" + "<br/>FIle Name: " + ff.getName());

                        } catch (Exception e) {
                            out.print("Failed due to " + e);
                        } finally {
                            fin.close();
                            ff.delete();
                        }
                    } else {
                        out.print("Please select the correct file...");
                    }// end of if and else
                }// end of while

                MyConnection.CloseConnection();
            %>
        </section>  </body></html>