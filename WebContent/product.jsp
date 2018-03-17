<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>Buy Art And Craft Online</TITLE>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
article{
	article{
	text-align:center;
	width:80%;
    margin-left:auto;
    margin-right:auto;
}
}
</style>
<body>
<div class="container">

<header>
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

<article>
<%!
	int a,b,c,d,e,f,g,h,i,j,k,l;
%>
<%
if(request.getAttribute("a1")==null){
	a=b=c=d=e=f=g=h=i=j=k=l=0;}
else{
a=Integer.parseInt((String)request.getAttribute("a1"));
b=Integer.parseInt((String)request.getAttribute("b1"));
c=Integer.parseInt((String)request.getAttribute("c1"));
d=Integer.parseInt((String)request.getAttribute("d1"));
e=Integer.parseInt((String)request.getAttribute("e1"));
f=Integer.parseInt((String)request.getAttribute("f1"));
g=Integer.parseInt((String)request.getAttribute("g1"));
h=Integer.parseInt((String)request.getAttribute("h1"));
i=Integer.parseInt((String)request.getAttribute("i1"));
j=Integer.parseInt((String)request.getAttribute("j1"));
k=Integer.parseInt((String)request.getAttribute("k1"));
l=Integer.parseInt((String)request.getAttribute("l1"));
}%>
<table>
<tr>
	<td><a href="g1.jsp"><img src="images/1.jpg" style="width:60%;height:30%;"></a><br>SAF Reprint Ink Painting<br>Rs.<%=a %><br><br></td>
	<td><a href="item2.jsp"><img src="images/2.jpg" style="width:60%;height:30%;"></a><br>SAF Ganesh Modern art Ink Painting<br>Rs.<%=b %><br><br></td>
	<td><a href="item3.jsp"><img src="images/3.jpg" style="width:60%;height:30%;"></a><br>SAF Ganesh Modern art Ink Painting<br>Rs.<%=c %><br></td>
</tr>
<tr>
	<td><a href="item4.jsp"><img src="images/4.jpg" style="width:60%;height:30%;"></a><br>SAF Set of 3 Flowers Digital Reprint<br>Painting</a><br>Rs.<%=d %><br><br></td>
	<td><a href="item5.jsp"><img src="images/5.jpg" style="width:60%;height:30%;"></a><br>SAF BUDDHA PREMIUM LARGE 4 PANEL<br>PAINTING<br>Rs.<%=e %><br><br></td>
	<td><a href="item6.jsp"><img src="images/6.jpg" style="width:60%;height:30%;"></a><br>SAF Buddha Ink Painting<br>Rs.<%=f %><br><br></td>
</tr>
<tr>
	<td><a href="item7.jsp"><img src="images/7.jpg" style="width:60%;height:30%;"></a><br>SAF Reprint Ink Painting<br>Rs.<%=g %><br><br></td>
	<td><a href="item8.jsp"><img src="images/8.jpg" style="width:60%;height:30%;"></a><br>Pics and You Girl With Violin Digital Reprint<br>Painting<br>Rs.<%=h %><br></td>
	<td><a href="item9.jsp"><img src="images/9.jpg" style="width:60%;height:30%;"></a><br>Fantasy Gifts Voyage Digital Reprint Painting<br>Rs.<%=i %><br></td>
</tr>
<tr>
	<td><a href="item10.jsp"><img src="images/10.jpg" style="width:60%;height:30%;"></a><br>SAF LARGE KRISHNA JI Painting<br>Painting<br>Rs.<%=j %><br></td>
	<td><a href="item11.jsp"><img src="images/11.jpg" style="width:60%;height:30%;"></a><br>SAF LARGE 4PANEL PAINTING Digital Reprint<br>Rs.<%=k %><br></td>
	<td><a href="item12.jsp"><img src="images/12.jpg" style="width:60%;height:30%;"></a><BR><BR><br>SAF TRIBAL LARGE 3PANEL PREMIUM Ink<br>Painting<br>Rs.<%=l %><br></td>
</tr>
</table>
<BR><BR><BR><BR>
</article>

<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft Â© 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>