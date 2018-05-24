
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conPackage.MyConnection"%>
<%
    Object id =session.getAttribute("id"); 
    String doc_id=id.toString();
   
    String user=request.getParameter("share");
    session.setAttribute("user",user);
   
    String q = "INSERT INTO share(doc_id,uid) VALUES('" + doc_id + "','" + user+"')";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shri", "root", "");
            Statement st = con.prepareStatement(q);
            
            int i= st.executeUpdate(q);
            
            if(i>0)
                    response.sendRedirect("share_success.jsp");
         else
                 response.sendRedirect("share_error.jsp");

            
         %>