<%-- 
    Document   : register
    Created on : 24 Nov, 2014, 5:36:43 PM
    Author     : Shrikrishna
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Password Change</title>
  <link rel="stylesheet" href="css/reg.css">
  <link type="text/css" rel="stylesheet" href="css/style.css">

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
                                <br>
                 <%  
            Object o=session.getAttribute("userid");
            
            if(o!=null)
            {
                 out.print("<div class=\"profile fl-rt\"> <a href=\"profile.jsp\">"+session.getAttribute("f_name")+" "+session.getAttribute("l_name")+"</a></div><br>");
               
            out.print("<br><form action=\"logout.jsp\"><input type=\"submit\" value=\"LOGOUT\" name=\"logout\" /> </form>");
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
  <div class="container">
    <section class="register">
        <script type="text/javascript">
function Validation()
{
var a = document.form.mob.value;

if(isNaN(a))
{
alert("Enter the valid Mobile Number");
document.form.mob.focus();
return false;
}
if((a.length > 10) || (a.length < 10))
{
alert(" Your Mobile Number must be 10 Digit");
document.form.mob.select();
return false;
}
var b = document.form.username.value;
if(!isNaN(b))
{
alert("Please Enter Only Characters");
document.form.username.select();
return false;
}
var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i
var c=emailfilter.test(document.form.email.value);
if(c==false)
{
alert("Please Enter a valid Mail ID");
document.form.email.focus();
return false;
}
var d = document.form.fname.value;
if(!isNaN(d))
{
alert("Please Enter Only Characters in your Name");
document.form.fname.select();
return false;
}

var e = document.form.lname.value;
if(!isNaN(e))
{
alert("Please Enter Only Characters in your Name");
document.form.lname.select();
return false;
}
}
</script>

      <h1>Change Password Of Your Account</h1>
      <form name="form" method="post" action="pass_rply.jsp">
      <div class="reg_section personal_info">
    
      <input type="password" name="old" value="" placeholder="Enter Old Password" required>
      <input type="password" name="new" value="" placeholder="Enter New Password" required>
      </div>
      <p class="submit"><center><input type="submit" name="commit" value="Change Password"></p>
      </form>
    </section>
  </div>


</body>
      
</html>