<%-- 
    Document   : reg_reply
    Created on : 24 Nov, 2014, 6:29:08 PM
    Author     : Shrikrishna
--%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUploadException"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, javax.sql.*,javax.naming.*"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Request</title>
          
</head>
    <body>
         <%
             String pass=null;
   try{   
       String u=request.getParameter("user");
       String m=request.getParameter("mail");          
       ResultSet rs = MyConnection.getResultFromSqlQuery("select password from shri where username='" + u + "' AND Email='"+ m + "'");
                           if(rs.next())
                           pass=rs.getString(1);
        final String username = "shrikrishna.kulkarni62";
        final String password = "kulkarni555";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "25");

        Session sessio = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

            Message message = new MimeMessage(sessio);
            message.setFrom(new InternetAddress("shrikrishna.kulkarni62@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(""+m));
            message.setSubject("Confirmation Mail For WebCloud");
            message.setText("Dear Mail your Password for Webcloud is - ,"+pass
                    + "\n\n Enter this password to login on WebCloud service!");

            Transport.send(message);

  response.sendRedirect("forgot_success.jsp");
        
            
            
              
            }
    catch (MessagingException e) {
            out.print("Internet Connection Not Available."+e);
        }

                  %>
    </body>
</html>
