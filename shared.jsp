<%@ page import="java.io.*,java.util.*,java.sql.*, javax.sql.*,javax.naming.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shared</title>


    </head>
    <body>
        <%    session.setAttribute("k", "full");
            if (session.getAttribute("userid") == null) {
                response.sendRedirect("alogin.jsp");
            } else {

                response.sendRedirect("ashared.jsp");

            }

        %>  
    </body>

</html>