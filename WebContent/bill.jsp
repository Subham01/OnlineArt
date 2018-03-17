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

   <%! int q;
   int p,avail_quantity;
   int price;
    %>
    <%
        q=Integer.parseInt(session.getAttribute("quantity").toString());
    	avail_quantity=Integer.parseInt(session.getAttribute("pquantity").toString());
    	if(avail_quantity-q<0)
    		response.sendRedirect("OutOfStock.jsp");
    	else
    	price=Integer.parseInt(session.getAttribute("pprice").toString());
        p=price*q;
        session.setAttribute("totalbill", p);
    %>
<table align="center">
<tr><td><fieldset  style="padding-left: 5em;padding-right:5em;" align="left">
<legend align="center"><font size="6">Price to be paid</font></legend>
<table>
<tr><td>Price: </td><td>&nbsp;&nbsp;&nbsp;<%=price %></td></tr>
<tr><td>Delivery Charges: </td><td>&nbsp;&nbsp;&nbsp;Free</td></tr>
<tr><td>Quantity: </td><td>&nbsp;&nbsp;&nbsp;<%=q%></td></tr>
<tr><td>Amount Payable: </td><td>&nbsp;&nbsp;&nbsp;<%=p%></td></tr><br><br>
</table> 
</fieldset></td>
<td><fieldset  style="padding-left: 5em;padding-right:5em;" align="left">
<legend align="center"><font size="6">Mode Of Payment</font></legend>
<form action="Buy">
  <input type="radio" name="payment" value="card"> Pay By Card<br>
  <input type="radio" name="payment" value="netbanking">NetBanking<br>
  <input type="radio" name="payment" value="COD">Cash On Delivery<br>
  <input type="submit" value="Proceed To Pay">
    </form>
<%!
	String message=""; 

%>

<%
	message = (String)request.getAttribute("key");  

	if(message == null)
		message = "";

%>
<%=message%> 
</fieldset></td></tr>
</table>
<div align="center"><table><tr><td><img src="images/pp.png"></td><td>Safe And Secure Payment</td></tr></table></div>
<br><br><br><br><br><br>
<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>