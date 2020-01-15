<!DOCTYPE html>
<html>
<%@ page language="java" session="false" import="javax.servlet.*,javax.servlet.http.*,java.sql.*" %>
<script>

$('#iconified').on('keyup', function() {
    var input = $(this);
    if(input.val().length === 0) {
        input.addClass('empty');
    } else {
        input.removeClass('empty');
    }
});

function jnamevalid()
{
  if(document.signup.jname.value == "") 
     {

      document.getElementById("jname_error").innerHTML="Job Title field is empty!";
      document.signup.jname.focus();
     }
  if(document.signup.jname.value !="")
     {
            document.signup.dep.focus();
           
     }
}

function dnamevalid()
{
  if(document.signup.dep.value == "") 
     {

      document.getElementById("dep_error").innerHTML="Department field is empty!";
      document.signup.dep.focus();
     }
  else{
            document.signup.project.focus();
           
     }
}

function pnamevalid()
{
  if(document.signup.project.value == "") 
     {

      document.getElementById("project_error").innerHTML="Project field is empty!";
      document.signup.project.focus();
     }
  else{
            document.signup.pro.focus();
           
     }
}

function pronamevalid()
{
  if(document.signup.pro.value == "") 
     {

      document.getElementById("pro_error").innerHTML="Province field is empty!";
      document.signup.pro.focus();
     }
  else{
            document.signup.date.focus();
           
     }
}

function datevalid()
{
  if(document.signup.date.value == "") 
     {

      document.getElementById("date_error").innerHTML="Date field is empty!";
      document.signup.date.focus();
     }
}

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
}

.icon {
  padding: 10px;
  color: white;
  min-width: 50px;
  text-align: center;
  margin-left: 90px;

}

.input-field {
  width: 100%;
  padding: 10px;
   border: 0;
  outline: 0;
   background: none;
  border-bottom: 2px solid black;
}

.input-field:focus {
  border-bottom: 2px solid black;
}
p{
  margin-left: 90px;
}
/* Set a style for the submit button */
.btn {
  background-color:black ;
  color: white;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  width: 65%;
  opacity: 0.9;
border-radius: 15px;
margin-left: 90px;
}
.error{
  font-size: 14px;
  color: red;
  display:block;
   }

.btn:hover {
  opacity: 1;
}
input.empty {
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
    font-size: 110%;
    text-decoration: inherit;
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
  color: Black;
}
</style>

<body>
<% 
HttpSession session = request.getSession(false);
if (session != null)
{
String userName=(String)session.getAttribute("value");
if (userName.equals("1") )
{
	%>
<div>
<input type="text" value="<%= session.getAttribute("value") %>" />
<ul>
  <li><p>JOB</p></li>
<li style="float: right"><a href="Logout">Logout</a></li>
  <li style="float: right"><a href="#about">About</a></li>
  <li style="float: right"><a class="active" href="admin.jsp">Home</a></li>  
</ul>
</div>
<div class="bg-img">
<br>
<form  method="post" action="Addjob" style="max-width:500px;margin:auto" name=signup>
  <p>Job title</p>
  <div class="input-container">
    <input type="text" class="input-field empty" id="iconified" placeholder="           Type your job name " name="jname" onfocusout="jnamevalid()">
    <span class="error"><p id="jname_error"></p></span>
  </div>
   <p>Department</p>
  <div class="input-container">
    <input type="text" class="input-field empty" placeholder="           Type name of Deparment " name="dep" onfocusout="dnamevalid()">
    <span class="error"><p id="dep_error"></p></span>
  </div>
   <p>Project</p>
  <div class="input-container">
    <input type="text" class="input-field empty" placeholder="           Type name Project " name="project" onfocusout="pnamevalid()">
    <span class="error"><p id="project_error"></p></span>
  </div>
    
   <p>Province</p>
  <div class="input-container">
    <input type="text" class="input-field empty" placeholder="           Type name Province " name="pro" onfocusout="pronamevalid()">
    <span class="error"><p id="pro_error"></p></span>
  </div>
  <p>Date</p>
  <div class="input-container">
    <input type="date" class="input-field empty"  placeholder="           Select a date " name="date" onfocusout="datevalid()">
    <span class="error"><p id="date_error"></p></span>
  </div>
  <br>
  <button type="submit" class="btn">Add</button>
</form>
</div>
<%
}
}
else{
	RequestDispatcher rd =request.getRequestDispatcher("error.jsp");
	rd.forward(request,response);
}
%>
</body>
</html>