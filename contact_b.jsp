<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>About Business Services</title>
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
                            <li><a href="about_b.jsp">About us</a></li>
                            <li><a href="contact_b.jsp">Contact us</a></li>
                                     </ul>
                    </div>
                </div>
            </div>
        </div>
  <link rel="stylesheet" href="css/style_1.css">
</head>

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
