<!DOCTYPE html>
<html>
<%@ page language="java" session="false" import="javax.servlet.*,javax.servlet.http.*,java.sql.*" %>
<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
function fnamevalid()
{
  if(document.login.ct.value == "") 
     {

      document.getElementById("ct_error").innerHTML="User Name field is empty!";
      document.login.ct.focus();
     }
  if(document.login.ct.value !="")
     {
            document.login.psw.focus();
           
     }
}
$('#iconified').on('keyup', function() {
    var input = $(this);
    if(input.val().length === 0) {
        input.addClass('empty');
    } else {
        input.removeClass('empty');
    }
});
</script>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
  min-height: 580px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

 ::placeholder {
  color: white;
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
  <li><p>JOB</p></li>
  <li style="float: right"><a href="Logout">Logout</a></li>
  <li style="float: right"><a href="signup.html">Register</a></li>
  <li style="float: right"><a class="active" href="client.jsp">Home</a></li>  
</ul>
</div>

<div class="bg-img">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<form  method="post" name="login" action="search.jsp" style="max-width:500px;margin:auto" >
  
  <h1 align="center" style="color:black;">Find a Job</h1>
  <p>Job name</p>
  <div class="input-container">
   <input type="text" class="input-field empty" id="iconified" placeholder="&#xf0b1           Type job name "  name="ct" onfocusout="fnamevalid()"/>
  <span class="error"><p id="ct_error"></p></span>
  </div>

  <br>
  <button type="submit" class="btn">Find</button>
</form>
</div>
<%
}
}
%>
</body>
</html>