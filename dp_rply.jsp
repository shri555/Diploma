<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.io.*,java.sql.*, javax.sql.*,javax.naming.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
          
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
</head>
    <body><br><br><br>

                                    

<%
String saveFile="";
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File("C:/Users/Shrikrishna/Documents/NetBeansProjects/Web_Cloud/web/profile/"+saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
String user=session.getAttribute("userid").toString();
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/shri";
PreparedStatement psmnt = null;
try{
    /*
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
psmnt = connection.prepareStatement("UPDATE shri SET dp='"+ff.getName()+"' WHERE username='" + user+ "'");
//psmnt.setString(1, ff.getName());
//psmnt.setString(2, user);

int s = psmnt.executeUpdate();
if(s>0){*/
 String q = "UPDATE shri SET dp= '"+ff.getName()+"' WHERE username= '" +user+ "'";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement st = con.prepareStatement(q);
            
            int i= st.executeUpdate(q);
      if(i>0)
      {
out.print("<center> <h2> Profile Picture Changed Successfully. <br><br> </h2>");
}
else{
out.print("<center> <h2> Error ocuured while changing your Profile Picture. <br><br> Please try again Later</h2>");
}
}
catch(Exception e){
    e.printStackTrace();
}
}
%><%
/*
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/shri";
PreparedStatement psmnt = null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
psmnt = connection.prepareStatement("UPDATE shri SET dp="+ff.getName()+" WHERE username='" + user+ "'");

int s = psmnt.executeUpdate();
if(s>0){
out.print("<center> <h2> Profile Picture Changed Successfully. <br><br> </h2>");
}
else{
out.print("<center> <h2> Error ocuured while changing your Profile Picture. <br><br> Please try again Later</h2>");
}
}
catch(Exception e){
    e.printStackTrace();
}
}*/
%>
    </body>
    
</html>