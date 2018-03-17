<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
td{
text-align:center;
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
<table align="center">
<tr><td>
<a href="AddQuantity.jsp"><input type="submit" class="button" value="Add Quantity"></a>
</td>
<td><form action="EditPrice.jsp">
<input type="submit" class="button" value="Edit Price">
</form></td>
<td><a href="index.jsp"><input type="button" class="button" value="Back To Home"></a></td>
</table>
<br><br><br><br>
<table align="center" border="1">
<tr><td>Product</td><td>Product ID</td><td>Product Name</td><td>Product Quantity</td><td>Product Price</td></tr>
<%
  	Connection con=null;
	Statement st=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e)
	{
		e.printStackTrace();
	}
			
	//STEP 2   CREATE THE CONNECTION
	try {
		String url=getServletConfig().getServletContext().getInitParameter("DB_URL");
		String user=getServletConfig().getServletContext().getInitParameter("DB_USER");
		String pass=getServletConfig().getServletContext().getInitParameter("DB_PASS");
		con=DriverManager.getConnection(url,user,pass);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	// STEP 3- CREATE THE STATEMENT
	try
	{
		st=con.createStatement();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}             
	try
	{
		String sql="select * from artlist";
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			int id=rs.getInt("PRODUCT_ID");
			String name=rs.getString("PRODUCT_NAME");
			int quantity=rs.getInt("PRODUCT_QUANTITY");
			int price=rs.getInt("PRODUCT_PRICE");%>
			<TR><TD><img src="images/<%=id%>.jpg" style="width:20%;height:20%;"></TD><td><%=id %></td>
			<TD><%=name %></TD>
			<TD><%=quantity %></TD>
			<TD><%=price %></TD></TR>
<%		}%>
		</TABLE>
<%	
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	//STEP 5-  RELEASE THE QUERY 

	try
	{
		con.close();
		st.close();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
  %>   
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