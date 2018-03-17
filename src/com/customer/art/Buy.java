package com.customer.art;
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
import javax.servlet.http.HttpSession;
@WebServlet("/Buy")
public class Buy extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
		Connection con=null;
		Statement st=null;
		Statement st1=null;
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
			st1=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}             
		try
		{
			HttpSession session=request.getSession();
			String firstname=session.getAttribute("uname").toString();
			int a=Integer.parseInt(session.getAttribute("item").toString());
			int id=Integer.parseInt(session.getAttribute("item").toString());
			String name=session.getAttribute("pname").toString();
			int bill=Integer.parseInt(session.getAttribute("totalbill").toString());
			int q=Integer.parseInt(session.getAttribute("quantity").toString());
			int p=Integer.parseInt(session.getAttribute("pquantity").toString());
			String sql="UPDATE ARTLIST SET PRODUCT_QUANTITY = '"+(p-q)+ "' WHERE PRODUCT_ID ='"+a+"'";
			String sql1="insert into "+firstname+"(PRODUCT_ID,PRODUCT_NAME,PRODUCT_QUANTITY,PRODUCT_PRICE)" 
					+"VALUES('"+id+"','"+name+"','"+q+"','"+bill+"')";
			st.executeUpdate(sql);
			st1.executeUpdate(sql1);
			RequestDispatcher rd=request.getRequestDispatcher("/buy.jsp");
	        String op=request.getParameter("payment");
	        if("COD".equals(op))
	            response.sendRedirect("paymentcomplete.jsp");
	        else if("card".equals(op))
	            response.sendRedirect("card.jsp");
	        else if("netbanking".equals(op))
	            response.sendRedirect("netbanking.jsp");
	        else
	        {
	            String message="Select a Mode Of Payment";
	            request.setAttribute("key", message);
	            rd=request.getRequestDispatcher("/bill.jsp");
	            rd.forward(request,response);
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
			st1.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
    }
}
