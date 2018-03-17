<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>Buy Art And Craft Online</TITLE>
<style>
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
* {box-sizing:border-box}
body {font-family: Verdana,sans-serif;margin:0}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 500%;
  position: relative;
  margin: auto;
}
/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}


/* The dots/bullets/indicators */
.dot {
  cursor:pointer;
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
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
  .prev, .next,.text {font-size: 11px}
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
</header>
<br><br>
<form action="GetPrice1" method="get">
<table><tr><td> <a href="index.jsp"><input type="button" class="buttons" value="Home"></a></td>
      <td><input type="submit" class="buttons" value="Product"></td>
 <td> <a href="login.jsp"><input type="button" class="buttons" value=<%=msg1 %>></a></td>
 <td> <a href="contactus.jsp"><input type="button" class="buttons" value="Contact Us"></a><br></td></tr></table>
</form>

<nav>

<div class="slideshow-container" style="height:50%;width:500%;">

<div class="mySlides fade">
  <img src="images/2.jpg" style="width:650px;height:500px;">
</div>

<div class="mySlides fade">
  <img src="images/pic2b.jpg" style="width:650px;height:500px;">
</div>

<div class="mySlides fade">
  <img src="images/pic2c.jpg" style="width:650px;height:500px;">
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
<br><br><br>
<form action="CheckOut">
<%!int a=2; %>
<%session.setAttribute("item",a); %>
<input type="submit" class="button" value="Buy Now">
</form>
</nav>
<article>
<pre>
<h1>SAF Ganesh Modern art Ink Painting</h1>
</pre>
<table>
<tr><td>Specifications<td></tr>
<tr><td>Model Number</td><td>SAS7703</td></tr>
<tr><td>Model Name</td><td>Reprint</td></tr>
<tr><td>Frame Included</td><td>Yes</td></tr>
<tr><td>Wall Mount</td><td>Yes</td></tr>
<tr><td>Pack of		</td><td>3</td></tr>
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
