package com.customer.art;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ResultSet rs=null;
	Connection con=null;
	Statement st=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher rd=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
				
		try {
			String url=getServletConfig().getServletContext().getInitParameter("DB_URL");
			String user=getServletConfig().getServletContext().getInitParameter("DB_USER");
			String pass=getServletConfig().getServletContext().getInitParameter("DB_PASS");
			con=DriverManager.getConnection(url,user,pass);
			st=con.createStatement();
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
			HttpSession session=request.getSession();
			if(session.getAttribute("uname")==null)
				rd=request.getRequestDispatcher("/login.jsp");
			else
			{
			int a=Integer.parseInt(session.getAttribute("item").toString());
			String sql="select * from ARTLIST";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				int id=rs.getInt("PRODUCT_ID");
				if(id==a)
				{
					String name=rs.getString("PRODUCT_NAME");
					session.setAttribute("pname", name);
					int price=rs.getInt("PRODUCT_PRICE");
					session.setAttribute("pprice", price);
					int quantity=rs.getInt("PRODUCT_QUANTITY");
					session.setAttribute("pquantity",quantity);
					break;
				}
			}
			rd=request.getRequestDispatcher("/checkout.jsp");
			
			}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			con.close();
			st.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		rd.forward(request,response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

}
