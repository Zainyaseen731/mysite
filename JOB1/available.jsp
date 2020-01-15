<html>
<head>
<title>Information</title></head>
<%@ page language = "java" session="false" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>
<% 
HttpSession session = request.getSession(false);
if (session != null)
{
String userName=(String)session.getAttribute("value");
if (userName.equals("0") )
{
	%>
<h1>Available Jobs</h1>
<table border = "1" width = "400">
<tr>
<td><b>Name</b></td>
<td><b>Department</b></td>
<td><b>project</b></td>
<td><b>province</b></td>
<td><b>date</b></td>
</tr>
<%

try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/test";
    Connection con=DriverManager.getConnection(url, "root", "root");

String name = "";
String department = "";
String project = "";
String province = "";
String date = "";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select * from job1");

while(rs.next()) {
 name = rs.getString("jontitle");
 department = rs.getString("department");
 project = rs.getString("project");
 province = rs.getString("province");
 date = rs.getString("date");
%>

<tr>
<td><% out.println(name); %></td>
<td><%= department %></td>
<td><%= project %></td>
<td><%= province %></td>
<td><%= date %></td>
</tr>
<%
}
%>
<%
stmt.close();
con.close();
}
catch(Exception e){System.out.println("Exception");}
%>

</table>
<%
}
}
%>
</body>
</html>