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
        <title>Registration Request</title>
          
</head>
    <body>
         <%
   try{   
       
            String bname = request.getParameter("bname");
            String mail = request.getParameter("email");
            String smob = request.getParameter("mob");
            String pass = request.getParameter("password");
            session.setAttribute("com",request.getParameter("email"));  
         Random rn;
       
            rn = new Random();
            int n = 999999 - 111111 + 1;
            int ion = rn.nextInt() % n;
            int randomNum = 100000 + ion;
            if(randomNum<0)
                randomNum=(-1)*randomNum;
            if(randomNum<100000)
            {
            n = 999999 - 111111 + 1;
            ion = rn.nextInt() % n;
            randomNum = 100000 + ion;
            if(randomNum<0)
                randomNum=(-1)*randomNum;
            }
              if(randomNum<100000)
            {
            n = 999999 - 111111 + 1;
            ion = rn.nextInt() % n;
            randomNum = 100000 + ion;
            if(randomNum<0)
                randomNum=(-1)*randomNum;
            }
              if(randomNum<100000)
            {
            n = 999999 - 111111 + 1;
            ion = rn.nextInt() % n;
            randomNum = 100000 + ion;
            if(randomNum<0)
                randomNum=(-1)*randomNum;
            }
                         
            String q = "INSERT INTO business (name,Email,mob,password,code) VALUES('" + bname + "','" + mail + "','"  + smob + "','" + pass+ "','" + randomNum +"')";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement st = con.prepareStatement(q);
            
            int i= st.executeUpdate(q);
         
         if(i>0)
         {  final String username = "shrikrishna.kulkarni62";
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
                    InternetAddress.parse(""+mail));
            message.setSubject("Confirmation Mail For WebCloud");
            message.setText("Dear Mail your Confirmation code for Webcloud is - ,"+randomNum
                    + "\n\n Enter this code to complete your registration on WebCloud service!");

            Transport.send(message);

    
                    response.sendRedirect("reg_confirm.jsp");
         }else
                 response.sendRedirect("reg_error.jsp");
   }catch(MySQLIntegrityConstraintViolationException e)
   {response.sendRedirect("brereg.jsp");}
    catch (MessagingException e) {
            out.print("Internet Connection Not Available.");
        }

                  %>
    </body>
</html>
