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
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
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
.button {
    background-color: orange;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
<body>
<div class="container">

<header>
<table width="100%">
<tr><td style="text-align:left;"><p>Need Help? customercare@Articraft.com</td></tr>
</table>
<img src="logo2.jpg" alt="Articraft" align="left" style="width:270px;height:50px;">
</header>
<br><br>
<article>
<%!
String msg="";
%>
<% 
msg=(String)request.getAttribute("key");
if(msg==null)
	msg="";
%>
<fieldset style="padding-left: 20em;padding-right:20em;margin-left: 20%;margin-right: 40%;" align="center">		
<legend align="center"><h1>Edit Price</h1></legend>
<font size="4" color="RED" align="center" > <%=msg %>	  </font>
<form action="EditPrice" method="post">
<table align="center">
<tr><td>Enter id of the Product: </td><td><input type="text" name="id"></td></tr>
<tr><td>Enter Price of the Product:</td><td><input type="text" name="new_price"></td></tr>
<tr><td><input type="submit" class="button" value="Change"></td><td><a href="AdminControl.jsp"><input type="button" class="button" value="Back"></a></td></tr>
</table>
</form>
</fieldset>
<br><br><br>
</article>
<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>