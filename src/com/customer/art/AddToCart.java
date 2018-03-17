package com.customer.art;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session=request.getSession();
		ResultSet rs=null;
		RequestDispatcher rd=null;
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
		int a=Integer.parseInt(session.getAttribute("item").toString());
		int b=Integer.parseInt(session.getAttribute("uid").toString());
		String sql="INSERT INTO CART(PRODUCT_ID,CUSTOMER_ID) "
				+"VALUES('"+a+"','"+b+"')"; 
		try
		{
			st.executeUpdate(sql);
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
		response.sendRedirect("Default");
	}
}
