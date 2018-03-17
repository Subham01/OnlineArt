package com.admin.art;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/DefaultAdd")
public class DefaultAdd extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		ResultSet rs=null;
		Connection con=null;
		Statement st=null;
		String message=null;
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
		
		 
		
				
		// STEP 4 EXECUTE THE QUERY
		
		//INSERTION              
		try
		{
			String sqlremove="delete from ARTLIST";
			st.executeUpdate(sqlremove);
			int price[]={647,847,927,837,347,872,298,987,174,564,983,759};
			String name[]={"SAF Ink Painting","SAF Ganesh Art","SAF Ganesh Modern","SAF 3 Flowers","SAF BUDDHA","SAF LaughingBuddha","SAF Reprint Ink","Girl With Violin","Voyage Painting","Radhey Krishna Ji","SAF LARGE 4PANEL","SAF TRIBAL LARGE"};
			int i=1;
			for(i=1;i<=12;i++)
			{
				String sql = "INSERT INTO ARTLIST(PRODUCT_ID,PRODUCT_NAME,PRODUCT_PRICE,PRODUCT_QUANTITY) "
						+"VALUES('"+i+"','"+name[i-1]+"','"+price[i-1]+"','"+10+"')";
				st.executeUpdate(sql);
			}
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
		
		response.sendRedirect("AdminChoice.jsp");
	}
}
