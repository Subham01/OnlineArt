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
div.container {
    border-left: solid 1px #f00;
    width: 100%;
}
* {box-sizing:border-box}
body {
font-family: Verdana,sans-serif;}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
article{
	text-align:center;
	width:80%;
    margin-left:auto;
    margin-right:auto;
}
header, footer {
    padding: 1em;
	height:20%;
    color: white;
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
<%
if((session.getAttribute("call")==null))
	response.sendRedirect("Default");
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
 <td> <a href="login.jsp"><input type="button" class="buttons" value="<%=msg1%>"></a></td>
 <td> <a href="contactus.jsp"><input type="button" class="buttons" value="Contact Us"></a><br></td></tr></table>
</form>
<article>
<form action="GetPrice">
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="images/p1.jpg" style="width:1000px;height:400px;border:1px;">
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="images/p2.jpg" style="width:1000px;height:400px;border:1px;">
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="images/p3.jpg" style="width:1000px;height:400px;border:1px;">
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

<hr>
New Products<hr>
<table>
<tr>
	<td><a href="g1.jsp"><img src="images/1.jpg" style="width:60%;height:30%;"></a><br>SAF Reprint Ink Painting<br><br></td>
	<td><a href="item2.jsp"><img src="images/2.jpg" style="width:60%;height:30%;"></a><br>SAF Ganesh Modern art Ink Painting<br><br></td>
	<td><a href="item3.jsp"><img src="images/3.jpg" style="width:60%;height:30%;"></a><br>SAF Ganesh Modern art Ink Painting<br><br></td>
</tr>
</table>
<hr>
<table align="center">
<tr><td style="border-right:solid 2px black";><i class="fa fa-lock"style="font-size:60px";></i><br><h3>Safe & Secure</h3>Security is a key concern for all parties<br> when transacting online business..</td>
   <td style="border-right:solid 2px black";><i class="fa fa-truck"style="font-size:60px";></i><br><h3>Shipping Policy</h3>Shipping within India is Free!<br> We generally ship within 1 or 2 days..</td>
	   <td><i class="fa fa-thumbs-o-up"style="font-size:60px";></i><br><h3>Replacement Guarantee</h3>We will replace the product <br>to your satisfaction at no extra cost..</td>
   </table>
<hr>
</form>
</article>
<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:300px;height:30px;"></p>
</footer>

</div>

</body>
</html>
