<%@ page import="java.io.*,java.util.*,java.sql.*, javax.sql.*,javax.naming.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Request</title>

    </head>
    <body>
        <%
            if(session.getAttribute("userid")!= null)
        {
          response.sendRedirect("log.jsp");   
        }
        else
        {
            String user = request.getParameter("login");
            String pass = request.getParameter("password");
            session.setAttribute("com", user);
            String connectionURL = "jdbc:mysql://localhost/shri";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement stc = con.createStatement();
            ResultSet rsc = stc.executeQuery("SELECT code,Email,password FROM business WHERE Email='" + user+ "'");
                /* if (rsc.next())
                 {
                 String c=rsc.getString(1);
                 String u=rsc.getString(2);
                 String p=rsc.getString(3);
                 if(u==null)
                    response.sendRedirect("login_error.jsp");
                 if(c==null)
                 {*/
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT name,Email,password,code FROM business WHERE Email='" + user + "' AND password='" + pass + "'");
            if (rs.next()) {
                if(rs.getString(4)== null)
                {
                    response.sendRedirect("success.jsp");
                
                }else
               // session.setAttribute("f_name", rs.getString(1));
               
                response.sendRedirect("breg_confirm.jsp");
                }

             else {
                response.sendRedirect("blogin_error.jsp");

            }
        }
        
                 /*}
                 else
                 {
                     response.sendRedirect("reg_confirm.jsp");
                 }
                 }
               /*  else
                    response.sendRedirect("login_error.jsp");
        }*/
        %>
        
    </body>

</html>