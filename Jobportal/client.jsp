<!DOCTYPE html>
<html>
<%@ page language="java" session="false" import="javax.servlet.*,javax.servlet.http.*,java.sql.*" %>
<head>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: black;
}

li p{
  float: left;
 display: block;
  color: white;
  text-align: center;
  padding: 3px 40px;
  margin-left: 5px;
  text-decoration: none;
  height:15px;
}

li a{
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}

.bg-img {
  /* The image used */
  background-image: url("zain2.jpeg");
  min-height: 585px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

</style>
</head>
<body>
<% 
HttpSession session = request.getSession(false);
if (session != null)
{
String userName=(String)session.getAttribute("value");
if (userName.equals("0") )
{
	%>
<div>
<ul>
  <li><p>Jobs</p></li>
  <li style="float: right"><a href="Logout">Log out</a></li>
  <li style="float: right"><a href="available.jsp">Available jobs</a></li>
  <li style="float: right"><a href="search1.jsp">Search</a></li>
  <li style="float: right"><a class="active" href="client.jsp">Home</a></li>  
</ul>
</div>
<div class="bg-img" >
<br>
<form  method="post" action="Insert" style="max-width:500px;margin:auto" name=signup>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

  <h1 align="center" style="color:black">Yor are welcome as an client.</h1>
</form>
</div>
<%
}
}
%>
</body>
</html>
