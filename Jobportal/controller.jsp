<html> 
<%@ page language = "java"  session="false" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body> 

<% 
HttpSession session = request.getSession(false);
if (session != null)
{
String userName=(String)session.getAttribute("value"); 
if (userName.equals("1") )
{
 response.sendRedirect("admin.jsp"); 
} 
else if (userName.equals("0") )
{
 response.sendRedirect("client.jsp"); 
} 
}
%>

</body> 
</html>