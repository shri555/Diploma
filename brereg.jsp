<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Business Registration</title>
                    
        <link rel="stylesheet" href="css/newcss.css">
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
                 out.print("<div class=\"profile fl-rt\"> <a href=\"profile.jsp\">"+session.getAttribute("f_name")+" "+session.getAttribute("l_name")+"</a></div><br>");
               
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
                        <title>Registration Form</title>
</head>

    <script>
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
var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i;
var c=emailfilter.test(document.form.email.value);
if(c===false)
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
  <div class="container">
    <section class="register">

     <h1>Register Business on WebCloud</h1>
     <h2>Name or Mail Id already Registered.</h2>
      <form name="form" method="post" action="breg_rply.jsp" onsubmit="return Validation()">
      <div class="reg_section personal_info">
      <h3>Your Business Information</h3>
      <input type="text" name="bname" value="" placeholder="Enter Business Name" required>
      
      <input type="text" name="email" value="" placeholder="Official E-mail Address" required>
      <input type="text" name="mob" value="" placeholder="Official Mobile Number" required>
  
      </div>
      <div class="reg_section password">
        
      <h3>Your Password</h3>
      <input type="password" name="password" value="" placeholder="Account Password" required>
      </div>
          
      <div class="reg_section password">
      <h3>Your Address</h3>
      <select>
        <option value="">India</option>
        <option value="">London</option>
        <option value="">Africa</option>
        <option value="">Italy</option>
       <option value="">America</option>
      </select>
      
      </div>
      <p class="terms">
        <label>
            <input type="checkbox" name="remember_me" id="remember_me" required>
           I accept  <a href="index.jsp">WebCloud</a> Terms & Condition
        </label>
      </p>
      <p class="submit"><input type="submit" name="commit" value="Sign Up"></p>
      </form>
    </section>
  </div>


    
</body>
</html>
