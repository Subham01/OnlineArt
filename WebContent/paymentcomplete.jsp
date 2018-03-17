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
        String msg="";
		String msg1="Login";
        %>
    <% 
         	 if(session.getAttribute("uname")==null)
            {
            	response.sendRedirect("login.jsp");
            }
            else
            {
                msg=session.getAttribute("uname").toString();
             	msg1="Profile";
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
        <%!
            String fname="";
        %>
        <%!
            String lname="";
        %>
        <%!
            String contact="";
        %>
        <%!
            String email="";
        %>
        <%!
            String address="";
        %>
        <%!
        	String name="";
        %>
        <%!
        String q="";
        %>
    <%
                    fname=session.getAttribute("uname").toString();
                    lname=session.getAttribute("lastname").toString();
                    contact=session.getAttribute("contact").toString();
                    name=session.getAttribute("pname").toString();
                    email=session.getAttribute("mailid").toString();
                    q=session.getAttribute("quantity").toString();
                    if(session.getAttribute("alternateaddress")==null)
                    	address=session.getAttribute("address").toString();
                    else
                    address=session.getAttribute("alternateaddress").toString();
        %>
        <div align="center">
       <h1>Your Order Has Been Successfully Placed.<br>ThankYou<br>Continue<a href="index.jsp">Shopping</a>...<br>
        </h1></div>
        <fieldset style="padding-left: 20em;padding-right:20em;margin-left: 20%;margin-right: 70%;">
		<legend align="center"><font size="6">Delivery Details</font></legend>
		<%!int p; %>
		<%p=Integer.parseInt(session.getAttribute("totalbill").toString()); %>
    	<table>
            <tr><td>Name: </td><td><%=fname%> <%=lname%></td></tr>
            <tr><td>Email: </td><td><%=email%></td></tr>
            <tr><td>Contact: </td><td><%=contact%></td></tr><br>
         	<tr><td>Address: </td><td><%=address%></td></tr><br>
         	<tr><td>Product Name: </td><td><%=name%></td></tr>
         	<tr><td>Total Amount:</td><td><%=p %></td></tr><br>
        </table>
        </fieldset>
        <div align="center"><table><tr><td><img src="images/pp.png"></td><td>Safe And Secure Payment</td></tr></table></div>
      
</nav>

<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>