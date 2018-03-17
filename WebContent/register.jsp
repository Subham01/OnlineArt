<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>Buy Art And Craft Online</TITLE>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body{
height:100%;
width:100%;
}
.button {
    background-color: orange;
    border: none;
    color: white;
    padding: 15px 28px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
.buttons {
    background-color: blue;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
}
li {
    float: left;
}
li a {
    display: block;
    color: black;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}
header, footer {
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
	background-image: url("bg.jpg");
 background-repeat: no-repeat;
    background-size: 100% 100%;
}
</style>
<body>
<div class="container">

<header>
 <%!
	String msg3=""; 

%>

<%
	msg3 = (String)request.getAttribute("key");  

	if(msg3 == null)
		msg3 = "";

%>
<%!
        String msg="";
		String msg1="";
        %>
    <% 
        try
        {
            if(session.getAttribute("uname")==null)
            {
            	msg="Sign In";
            	msg1="Login";
            }   
            else
            {
                msg=session.getAttribute("uname").toString();
             	msg1="Profile";
            }
        }
        catch(Exception e)
        {
            
        }
        %>
<table width="100%">
<tr><td style="text-align:left;"><p>Need Help? customercare@Articraft.com</td><td  style="text-align:right;font-color:red;"><p>Hello,<a href="login.jsp"><%=msg%></a></p>
</td></tr>
</table>
<img src="logo2.jpg" alt="Articraft" align="left" style="width:270px;height:50px;">
</header>
<br><br>
<form action="GetPrice1" method="get">
<table><tr><td> <a href="index.jsp"><input type="button" class="buttons" value="Home"></a></td>
      <td><input type="submit" class="buttons" value="Product"></td>
 <td> <a href="login.jsp"><input type="button" class="buttons" value=<%=msg1 %>></a></td>
 <td> <a href="contactus.jsp"><input type="button" class="buttons" value="Contact Us"></a><br></td></tr></table>
</form>
<article>
<fieldset style="padding-left: 20em;padding-right:20em;margin-left: 20%;margin-right: 40%;" align="center">		
<legend align="center">Welcome! Register Here</legend>
	  	<font size="4" color="RED" align="center" > <%=msg3 %>	  </font>
<form action="AddCustomer" method="post">
<table  align="center" width="20%"height="20%">
<tr><td>&nbsp;First Name:</td><td><input type="text" name="first-name">&nbsp;</td></tr>
<tr><td>&nbsp;Last Name:</td><td><input type="text" name="last-name">&nbsp;</td></tr>
<tr><td>&nbsp;Email-ID:</td><td><input type="text" name="email">&nbsp;</td></tr>
<tr><td>&nbsp;Contact Number:</td><td><input type="text" name="number">&nbsp;</td></tr>
<tr><td>&nbsp;Address:</td><td><textarea type="text" name="address" rows="4" cols="22"></textarea>&nbsp;</td></tr>
<tr><td>&nbsp;Password:</td><td><input type="Password" name="password">&nbsp;</td></tr>
<tr><td><input type="submit" class="button" value="Register"></td><td><a href="login.jsp"><input type="button" class="button" value="Back"></a></tr>
</table>
</form>
</fieldset>
<br><br><br><br><br>
</article>
<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>