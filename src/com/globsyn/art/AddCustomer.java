package com.globsyn.art;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String firstname=request.getParameter("first-name");
		String lastname=request.getParameter("last-name");
        String email=request.getParameter("email");
		String contact=request.getParameter("number");
		String address=request.getParameter("address");
        String password=request.getParameter("password");
		RequestDispatcher rd=request.getRequestDispatcher("/register.jsp");
		ResultSet rs=null;
		Connection con=null;
		Statement st=null;
		Statement st1=null;
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
		if("".equals(firstname)&&"".equals(lastname)&&"".equals(email)&&"".equals(contact)&&"".equals(address)&&"".equals(password))
		{
			message="All Feilds Empty";
		}
		else if("".equals(firstname))
		{
			message="Empty FirstName";
		}
		else if("".equals(lastname))
		{
			message="Empty LastName";
		}
		else if("".equals(email))
		{
			message="Empty Email";
		}
		else if("".equals(contact))
		{
			message="Empty Contact";
		}
		else if("".equals(address))
		{
			message="Empty Address";
		}
		else if("".equals(password))
		{
			message="Empty Password";
		}
		else
		{
			String sql="create table "+firstname+"(PRODUCT_ID INT NOT NULL,PRODUCT_NAME VARCHAR(50) NOT NULL, PRODUCT_QUANTITY INT NOT NULL,PRODUCT_PRICE INT NOT NULL) ";
			String insertSQL4 = "INSERT INTO customer(FIRSTNAME,LASTNAME,EMAILID,CONTACT,ADDRESS,PASSWORD) "
					+"VALUES('"+firstname+"','"+lastname+"','"+email+"','"+contact+"','"+address+"','"+password+"')";              
			try
			{
				st1.executeUpdate(sql);
				st.executeUpdate(insertSQL4);
				message="registered successfully";
				rd=request.getRequestDispatcher("/login.jsp");
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
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
		request.setAttribute("key",message);
		rd.forward(request, response);
	}
}
