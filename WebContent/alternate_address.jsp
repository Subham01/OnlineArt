<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>Buy Art And Craft Online</TITLE>
<style>
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
div.container {
    width: 100%;
    border: 1px solid gray;
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
nav {
    float: left;
    width:60% ;
    margin: 0;
    padding: 1em;
}
article {
    margin-left: 50%;
	height:80%;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}
</style>
<body>
<div class="container">

<header>
<%!
        String msg="";
		String msg1="Login";
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
<tr><td style="text-align:left;"><p>Need Help? customercare@Articraft.com</td><td  style="text-align:right;font-color:red;"><p>Hello,<a href="user.jsp"><%=msg%></a></p>
</td></tr>
</table>
<img src="logo2.jpg" alt="Articraft" align="left" style="width:270px;height:50px;">
   <h1>City Gallery</h1>
</header>
<tr><td>
<form action="GetPrice1" method="get">
<table><tr><td> <a href="index.jsp"><input type="button" class="buttons" value="Home"></a></td>
      <td><input type="submit" class="buttons" value="Product"></td>
 <td> <a href="login.jsp"><input type="button" class="buttons" value=<%=msg1 %>></a></td>
 <td> <a href="contactus.jsp"><input type="button" class="buttons" value="Contact Us"></a><br></td></tr></table>
</form>
        <form action="AddressDetails">
        <fieldset style="padding-left: 5em;padding-right:5em;margin-left: 30%;margin-right: 50%;" align="center">
		<legend align="center"><font size="6">Alternative Address</font></legend>
	    	<table>
	        <tr>Enter The new Address:</TR> 
	        <TR><textarea type="text" name="address"></textarea></tr><br>
	   		 <tr><input type="submit"></tr>
	  		</table>
	  		</fieldset>
        </form>
        <br><br><br>
<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>
