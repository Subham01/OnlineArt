package com.globsyn.art;

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


public class GetPrice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet rs=null;
	Connection con=null;
	Statement st=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
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
		}
		catch (SQLException e) {
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
		String sql="select * from ARTLIST";
		try
		{
			
			ResultSet rs=st.executeQuery(sql);
			String[] arr=new String[12];
			int p=0;
			while(rs.next())
			{
				String price=rs.getString("PRODUCT_PRICE");
				arr[p]=price;
				p++;
			}
			request.setAttribute("a1",arr[0]);
			request.setAttribute("b1",arr[1]);
			request.setAttribute("c1",arr[2]);
			request.setAttribute("d1",arr[3]);
			request.setAttribute("e1",arr[4]);
			request.setAttribute("f1",arr[5]);
			request.setAttribute("g1",arr[6]);
			request.setAttribute("h1",arr[7]);
			request.setAttribute("i1",arr[8]);
			request.setAttribute("j1",arr[9]);
			request.setAttribute("k1",arr[10]);
			request.setAttribute("l1",arr[11]);
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
		 rd = request.getRequestDispatcher("/product.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
	
}
