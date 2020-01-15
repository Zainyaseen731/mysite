<html>

<head>
<title>Information</title>
<style>

body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 80%;
  margin-bottom: 15px;
  margin-left: 90px;
 color:none;
  background: none;
}

.icon {
  padding: 10px;
  color: white;
  min-width: 50px;
  text-align: center;
margin-left: 90px;
 
}

input.empty {
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
    font-size: 110%;
    text-decoration: inherit;
}
          
.input-field {
  width: 80%;
  padding: 10px;
  border: 0;
  outline: 0;
  background: none;
  border-bottom: 2px solid black;
}

.input-field:focus {
  border-bottom: 2px solid black;
}

/* Set a style for the submit button */
.btn {
  background-color:black ;
  color: white;
  padding: 10px 100px;
 margin-left: 90px;
  border: none;
  cursor: pointer;
  width: 65%;
  opacity: 0.9;
  border-radius: 15px;
}
p{
  margin-left: 90px;
}
.btn:hover {
  opacity: 1;
}


.bg-img {
  /* The image used */
  background-image: url("zain2.jpeg");
  min-height: 645px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

 ::placeholder {
  color: black;
}
</style>
</head>
<%@ page language = "java" session="false"  import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>
<%
HttpSession session = request.getSession(false);
if (session != null)
{
String userName=(String)session.getAttribute("value");
if (userName.equals("1") )
{
String hay=(String)session.getAttribute("i");
String name = (String)session.getAttribute("n");
String department = (String)session.getAttribute("de");
String project = (String)session.getAttribute("p");
String province = (String)session.getAttribute("pro");
String date = (String)session.getAttribute("d");
%>
<div class="bg-img">
<br>

<form method="post" action="Updates" style="max-width:500px;margin:auto" >
 <h1 align="center" style="color:black;">Update</h1> 
  <input type="hidden" value=<%=hay%> name="id1"> 

 <p>Name</p>
  <div class="input-container">
    <input type="text" class="input-field empty" value=<%=name%> name="name1"/>
  </div>
<p>Department</p>
  <div class="input-container">
    <input type="text" class="input-field empty" value=<%=department%> name="department1"/>
  </div>
<p>Project</p>
  <div class="input-container">
    <input type="text" class="input-field empty" value=<%=project%> name="project1"/>
  </div>
<p>Province</p>
  <div class="input-container">
    <input type="text" class="input-field empty" value=<%=province%> name="province1"/>
  </div>
<p>Date</p>
  <div class="input-container">
    <input type="date" class="input-field empty" value=<%=date%> name="date1"/>
  </div>
<br>
  <button type="submit" class="btn">Update</button>
</div>
</form>

</table>
<%
}
}
%>
</body>
</html>