package com.admin.art;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/EditPrice")
public class EditPrice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String message="";
		Connection con=null;
		Statement st=null;
		int flag=0;
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
		if("".equals(request.getParameter("id")))
			message="Empty ID";
		else if("".equals(request.getParameter("new_price")))
			message="Empty Price";
		else
		{
			try
			{
				if(Integer.parseInt(request.getParameter("id"))<1||Integer.parseInt(request.getParameter("id"))>12)
					message="Incorrect ID";
				else
				{
					int id=Integer.parseInt(request.getParameter("id"));
					int quantity=Integer.parseInt(request.getParameter("new_price"));
					String sql="UPDATE ARTLIST SET PRODUCT_PRICE = '"+quantity+ "' WHERE PRODUCT_ID ='"+id+"'";
					st.executeUpdate(sql);
					flag=1;
				}
			}
			catch(Exception e)
			{
				message="Invalid  Entry";
			}
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
		if(flag==1)
		response.sendRedirect("AdminChoice.jsp");
		else
		{
			request.setAttribute("key",message);
	        RequestDispatcher rd=request.getRequestDispatcher("/EditPrice.jsp"); 
	        rd.forward(request, response);
		}
	}
}
