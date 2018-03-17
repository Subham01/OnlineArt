<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>Buy Art And Craft Online</TITLE>
<style>
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
nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
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
* {box-sizing:border-box}
body {font-family: Verdana,sans-serif;margin:0}
.mySlides {display:none}



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
</header>
<br><br>
<form action="GetPrice1" method="get">
<table><tr><td> <a href="index.jsp"><input type="button" class="buttons" value="Home"></a></td>
      <td><input type="submit" class="buttons" value="Product"></td>
 <td> <a href="login.jsp"><input type="button" class="buttons" value=<%=msg1 %>></a></td>
 <td> <a href="contactus.jsp"><input type="button" class="buttons" value="Contact Us"></a><br></td></tr></table>
</form>
<nav>

<img src="images/10.jpg" style="width:650px;height:500px;">
<br><br><br>
<form action="CheckOut">
<%!int a=10; %>
<%session.setAttribute("item",a); %>
<input type="submit" class="button" value="Buy Now">
</form></nav>
<article>
<pre>
<h1>SAF LARGE KRISHNA JI Painting</h1>
</pre>
<table>
<tr><td>Specifications<td></tr>
<tr><td>Model Number</td><td>SAS7703</td></tr>
<tr><td>Model Name</td><td>Reprint</td></tr>
<tr><td>Frame Included</td><td>Yes</td></tr>
<tr><td>Wall Mount</td><td>Yes</td></tr>
<tr><td>Pack of		</td><td>1</td></tr>
<tr><td>Sales Package</td><td>			3 Wall Painting</td></tr>
<tr><td>Frame Color	</td><td>	Black</td></tr>
<tr><td>Other Features</td><td>	Perfect gift Idol</td></tr>
<tr><td>Frame Material</td><td>		Synthetic</td></tr>
<tr><td>Shape</td><td>		Rectangular</td></tr>
<tr><td>Dimensions</td></tr>		
<tr><td>Width</td><td>		22 inch</td></tr>
<tr><td>Height</td><td>		13.5 inch</td></tr>
<tr><td>Weight</td><td>		0.8 kg</td></tr>
<tr><td>Other Dimensions</td><td>	Wall Hanging</td></tr>
<tr><td>Warranty</td></tr>
<tr><td>Warranty Summary</td><td>		Replaceable if manufacturing defect</td></tr>
<tr><td>Warranty Service Type</td><td>	Replaceable</td></tr>
<tr><td>Covered in Warranty</td><td>	Frame</td></tr>
<tr><td>Domestic Warranty</td><td>	1 Month</td></tr>
<tr><td>International Warranty</td><td>1 Month</td></tr>
</table>
</article>
<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>
