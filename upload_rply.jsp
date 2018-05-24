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
        <title>Upload Status</title>
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
                                <%
                                    Object o = session.getAttribute("userid");

                                    if (o != null) {
                                        out.print("<div class=\"profile fl-rt\"> <a href=\"profile.jsp\">" + session.getAttribute("f_name") + " " + session.getAttribute("l_name") + "</a></div><br>");

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

            if (session.getAttribute("userid") != null) {
                String user = session.getAttribute("userid").toString();
                ResultSet rs = MyConnection.getResultFromSqlQuery("select new from shri where username='" + user + "'");
                while (rs.next()) {
                    if (rs.getString(1) != null) {
                        out.print("<center><form action=\"view_msg.jsp\"><input type=\"submit\" value=\"You Have a New Message. Click to View New Message\" name=\"msg\" /> </form>");
                    }
                }


                rs.close();
                MyConnection.CloseConnection();


            }

        %>
        <section class="form-4">

            <center/><input type="submit" value="Upload Status"><br><br><br>

            <%

                String rtempfile = File.createTempFile("temp", "1").getParent();
                MultipartRequest multi = new MultipartRequest(request, rtempfile, 1024 * 1024 * 100);     // maximum size 15 MB

                Enumeration files = multi.getFileNames();


                String st = "insert into documents(filename, type,content, upload_by) values (?,?,?,?)";
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

                            out.print("<h1>Uploaded successfully...<h1>" + "<br/>FIle Name: " + ff.getName());

                        } catch (Exception e) {
                            out.print("Failed due to " + e);
                        } finally {
                            // next statement is must otherwise file will not be deleted from the temp as fin using f.
                            // its necessary to put outside otherwise at the time of exception file will not be closed.
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