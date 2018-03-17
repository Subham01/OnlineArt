<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
.button {
    padding: 15px 32px;
    display: inline-block;
    font-size: 16px;
}
nav {
    float: left;
    width:60% ;
    margin: 0;
    padding: 1em;
}
td{
text-align:center;
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
<TABLE ALIGN="CENTER" border="1">
<TR><TD>PRODUCT</TD><TD>PRODUCT NAME</TD><TD>PRODUCT QUANTITY</TD><TD> PRODUCT PRICE</TD></TR>
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
		String firstname=session.getAttribute("uname").toString();
		if(session.getAttribute("item")!=null)
		{
			int a=Integer.parseInt(session.getAttribute("item").toString());
			String sql="select * from "+firstname;
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				int id=rs.getInt("PRODUCT_ID");
				String name=rs.getString("PRODUCT_NAME");
				int quantity=rs.getInt("PRODUCT_QUANTITY");
				int price=rs.getInt("PRODUCT_PRICE");%>
				<TR><TD><img src="images/<%=id%>.jpg" style="width:100px;height:100px;"></TD>
				<TD><%=name %></TD>
				<TD><%=quantity %></TD>
				<TD><%=price %></TD></TR>
	<%		}
			}%>
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
  <div align="center"><a href="user.jsp"><input type="submit" class="button" value="Back To Profile"></a></div> 
  <br><br><br>
<footer>
<p style="text-align:left;">Powered By Globsyn IT Solutions<br>
Articraft © 2017
 <img src="payment1.jpg" align="right" style="width:400px;height:30px;"></p>
</footer>

</div>

</body>
</html>
