<%@page import="conPackage.MyConnection"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Contact Us - WebCloud</title>
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
                                    out.print("<h3>" + dt.format(d) + "</h3>");

                                %>
                                <br>
                                <%
                                    Object o = session.getAttribute("userid");

                                    if (o != null) {
                                        out.print("<div class=\"profile fl-rt\"> <a href=\"profile.jsp\">" + session.getAttribute("f_name") + " " + session.getAttribute("l_name") + "</a></div><br>");

                                        out.print("<br><form action=\"logout.jsp\"><input type=\"submit\" value=\"LOGOUT\" name=\"logout\" /> </form>");
                                    }
                                %>
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
                <div class="content">
                    <!--content-start-->

                    <div class="content_bottom">
                        <div class="content_left fl-lt">

                            <div class="pic_area">
                                <div class="fl-lt"> <img src="img/feedback.jpg" alt="" width="470" height="268"> </div>
                                <div class="pic_area">
                                    <section class="main">
                                         <script type="text/javascript">
function Validation()
{
var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i;
var c=emailfilter.test(document.form.email.value);
if(c===false)
{
alert("Please Enter a valid Mail ID");
document.form.email.focus();
return false;
}

}
</script>
 
                                        <form class="form-4" method="post" action="feedback.jsp" onsubmit="return Validation()">
                                            <h1>Feedback Form</h1>
                                            <p>
                                                <label for="name">Name:</label>
                                                <input type="text" name="name" placeholder="Enter Your Name" required>
                                            </p>
                                            <p>
                                                <label for="emial">Email:</label>
                                                <input type="text" name="email" value="" placeholder="Enter Your Email" required>
                                            </p>
                                            <p>
                                                <label for="feed">Enter your Feedback: </label>
                                                <textarea name="feed" placeholder="Enter Your Feedback." style="margin: 1px; width: 280px; height: 51px;"></textarea></p>
                                            <p>
                                                <input type="submit" name="submit" value="Submit Feedback">
                                            </p>       
                                        </form>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="content_right fl-rt">

                            <div class="fl-rt"> <img src="img/ContactUs.jpg" alt="" width="350" height="200"> </div>
                            <br><br><h1>Contact Us</h1>
                            <br>
                            <h4>Shrikrishna A. Kulkarni.<br>
                                Contact No.- +91- 9922790512.<br>
                                Email- kulkarni_shrikrishna@yahoo.com
                            </h4>
                            <br><br><br><br>
                            <h1>Office Address</h1>

                            <h4>WebCloud<br>
                                IT Park Area, Kolhapur. <br>
                                Pin- 416002.<br>
                                Office Phone- 0231-255555<br>

                                Email- info_kop@webcloud.com
                            </h4>
                            <h4>WebCloud<br>
                                Aundh IT Park Bhau Patil Rd, Pune. <br>
                                Pin- 411020.<br>
                                Mobile- +91-9900990099<br>

                                Email- info_pune@webcloud.com
                            </h4>

                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--content-end-->
            </div>
        </div>
        <div class="footer_wrap">

    </body>
</html>
