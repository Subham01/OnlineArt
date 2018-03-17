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
    height:100%;
    border: 1px solid gray;
}
body{
height: 100%;
}

header, footer {
    padding: 1em;
    color: white;
    height: 100%;
    background-color: black;
    clear: left;
    text-align: center;
	background-image: url("bg.jpg");
 background-repeat: no-repeat;
    background-size: 100% 100%;
}
img {
    opacity: 0.5;
    filter: alpha(opacity=50); /* For IE8 and earlier */
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
    padding: 1em;
}
article {
	height:80%;
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
<nav>
    <%!
            String key="";
        %>
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
        <%! String address1="";
        %>
        <%! int quantity,price;
        %>
    <%
                    fname=session.getAttribute("uname").toString();
                    lname=session.getAttribute("lastname").toString();
                    contact=session.getAttribute("contact").toString();
                    email=session.getAttribute("mailid").toString();
                    address=session.getAttribute("address").toString();
                    if(session.getAttribute("alternateaddress")==null)
                        address1="";
                    else
                    address1=session.getAttribute("alternateaddress").toString();
                    quantity=Integer.parseInt(session.getAttribute("pquantity").toString());
                    price=Integer.parseInt(session.getAttribute("pprice").toString());
        %>
        <fieldset style="padding-left: 5em;padding-right:5em;margin-left: 30%;margin-right: 50%;" align="center">
		<legend align="center"><font size="6">Delivery Details</font></legend>
    	<table>
            <tr><td>Name: </td><td><%=fname%> <%=lname%></td></tr>
            <tr><td>Email: </td><td><%=email%></td></tr>
            <tr><td>Contact: </td><td><%=contact%></td></tr><br>
        
        <% if("".equals(address1)){
         %>
         <tr><td>Address: </td><td><%=address%></td></tr><br>
            <tr><td>Alternative Address(optional)</td><td><a href="alternate_address.jsp">Alternative Address?</a></td></tr><br>
          <% } else { %>
          <tr><td>Address : </td><td><%=address1%></td></tr><br>
           <tr><td>Alternative Address(optional)</td><td><a href="alternate_address.jsp">Alternative Address?</a></td></tr><br>

          <% } %>
          </table>

</nav>
<article >
<%if(quantity<=0) {%>
<h1>Sorry ,Out Of Stock</h1>
<%} else { %>
 <form action="BillDetails">
              <h2><table>
             <tr><td>Quantity Left: </td><td><%=quantity %></td></tr>
              <tr><td>Price: </td><td><%=price %></td></tr>
	            <tr><td>No. Of Items: 
	            <select name="quantity">
	            <option value="1">1</option>
	            <option value="2">2</option>
	            <option value="3">3</option>
	            <option value="4">4</option>
	            <option value="5">5</option>
	            <option value="6">6</option>
	            </select><br></td>
	            <td><a href="bill.jsp"><input type="submit" class="button" value="Proceed"></a></td></tr>
        </TABLE></h2>
          </form>
          <%} %>
</article>
<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>
